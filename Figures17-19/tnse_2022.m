 %论文 Arbitrary-Time Algorithom
 %《A Novel Congestion Controller With Prescribed Settling Time for TCP/AQM Network System》, 2022.

 clc;
 close all;
 clear;

 %定义时间间隔
 h=0.001;   %步 长选择为0.001；
 t=0;
 u=[];
 uu=[];
 ydd=[];
 NN=3000;  %运行时间设定为5秒

 %设计参数定义
 %Step 1
 deta1=20;
 ta=0.8;
 n=2;
 %Step 2
 deta2=30;

 %系统参数
 R=0.1;
 C=10000;
 N=100;

 %定义初值
 x0=[108;0];   %分别对应状态1，状态2，辅助函数状态，自适应律
 x=x0;
 x_10=108-100;
 xx=[];
 u0=0;

%控制器设计(后面的时刻可以表示为i*hh)
for i=1:NN
    %——————系统中变量定义a(i),b(i),f(i),g(i)——————
    cwnd(i)=R*(x(2,i)+C)/N;
    b1(i)=-0.12*log10(cwnd(i))+0.69;
    a1(i)=0.16*((cwnd(i))^0.8)*b1(i)/(2-b1(i));
    f(i)=N*a1(i)/R^2;
    g(i)=-b1(i)*(x(2,i)+C)^2/N;
    
    %——————定义期望队列长度——————
    qref(i)=100;
    qref_1(i)=0;   %期望队列长度的导数
    ydd=[100 qref];
    
    %——————定义队列跟踪误差——————
    e1(i)=x(1,i)-qref(i);
    e11=[x_10 e1];

    %——————Prescribed Performance Control——————
    %Prescribed Performance Function
    k=10;
    d=0.2;
    Tf=1;
    sigma=2.1;
    if t(i) < Tf
        xi(i)=(k-d) * (1-t(i)/Tf)^(sigma+1) + d;
    else
        xi(i)=d;
    end
    XI=[k, xi];

    %Derivative of Prescribed Performance Function
    if t(i)<Tf
        xi_1(i)=(k-d) * (1-t(i)/Tf)^(sigma) * (sigma+1) * (-1/Tf);
    else
        xi_1(i)=0;
    end
    if t(i)<Tf
        xi_2(i)=(k-d) * (1-t(i)/Tf)^(sigma-1) * (sigma+1) * sigma * (1/Tf)^2;
    else
        xi_2(i)=0;
    end

    %Error Transformation
    varphi=1;
    phi=0.5;
    rho(i)=e1(i)/xi(i);
    rho_1(i)=((x(2,i)-qref_1(i))*xi(i) - e1(i)*xi_1(i)) / (xi(i)^2);
    varsigma(i)=log((varphi*rho(i) + phi*varphi) / (phi*varphi - phi*rho(i)));
    A(i)=- ((phi+varphi)*rho(i)) / ((phi+rho(i)) * (varphi-rho(i))) * (xi_1(i)/xi(i));
    B(i)=(phi+varphi) / ((varphi+rho(i)) * (varphi-rho(i))) * (1/xi(i));

   %——————定义第一个误差z1——————
   z1(i)=varsigma(i);
   
   %——————虚拟控制律——————
   alpha_1(i)= - (A(i) - B(i)*qref_1(i) + deta1 * (exp(z1(i))-1) * (ta-t(i))^n) / B(i);
   
   %——————虚拟控制律的导数——————
   alpha1_z1(i)=-deta1 * (ta-t(i))^n / (B(i)*exp(z1(i)));
   alpha1_A(i)=-1/B(i);
   alpha1_B(i)=(A(i) + (deta1 * (exp(z1(i))-1) * (ta-t(i))^n) / (exp(z1(i)))) / (B(i)^2);
   alpha1_qref1(i)=1;
   alpha1_t(i)=(deta1 * n * (exp(z1(i))-1) * (ta-t(i))^(n-1)) / (B(i)*exp(z1(i)));
   A_rho(i)=-(xi_1(i) * (phi+varphi) * (rho(i)^2+phi*varphi)) / (xi(i) * (phi+rho(i))^2 * (varphi-rho(i))^2);
   A_xi(i)=(phi+varphi)*rho(i) / ((phi+rho(i)) * (varphi-rho(i))) * (xi_1(i)) / (xi(i)^2);
   A_xi1(i)=-(varphi+phi)*rho(i) / ((phi+rho(i)) * (varphi-rho(i))) * 1 / (xi(i));
   B_rho(i)=- 1 / xi(i) * ((phi+varphi) * (varphi-phi-2*rho(i))) / ((phi+rho(i))^2 * (varphi-rho(i))^2);
   B_xi(i)=-(phi+varphi) / ( (phi+rho(i)) * (varphi-rho(i)) ) * 1 / (xi(i)^2);
   Q1(i)=alpha1_z1(i) * ( A(i) + B(i) * (x(2,i)-qref_1(i)) );
   Q2(i)=( alpha1_A(i)*A_rho(i) + alpha1_B(i)*B_rho(i) ) * rho_1(i);
   Q3(i)=alpha1_A(i)*A_xi1(i)*xi_2(i);
   Q4(i)=( alpha1_A(i)*A_xi(i) + alpha1_B(i)*B_xi(i) )*xi_1(i);
   alpha1(i)=Q1(i) + Q2(i) + Q3(i) + Q4(i) + alpha1_qref1(i)*0 + alpha1_t(i);

   %——————定义第二个误差z2——————
   z2(i)=x(2,i)-alpha_1(i);
   
   %——————控制律——————
   u(i)=-( (deta2*(exp(z2(i))-1)*(ta-t(i))^n) / (exp(z2(i))) + B(i)*z1(i) + f(i) - alpha_1(i)) / g(i);
   uu=[u0 u];

   %计算下一步状态
   xx(1,i)=h*(x(2,i))+x(1,i);
   xx(2,i)=h*(f(i)+g(i)*u(i))+x(2,i);

   W(i)=R*(x(2,i)+C)/N;   %窗口大小
   WW=[0 W];
    
    %储存状态
    x=[x0 xx];     %按列分配，则行为对应的状态
    t=[t i*h];

end
   
 %绘图部分
 figure(1);   %队列长度
 plot(t,x(1,:),'lineWidth',1);
%  legend('x_1(t)')
 xlabel('t(s)');
 ylabel('q(t)');
 
 figure(2)
 plot(t,uu(1,:),'lineWidth',1);
 hold on;
%  ylim([-0.1,0.3]);
 xlabel('t');
 ylabel('Control input');
 
 figure(3)
 plot(t,e11,'r-','lineWidth',1);
 hold on;
 plot(t,-phi*XI,'-.','lineWidth',1);
 hold on;
 plot(t,varphi*XI,'-.','lineWidth',1);
 hold on;
%  ylim([-2,6]);
 xlabel('t(s)');
 ylabel('Error');

 
 
