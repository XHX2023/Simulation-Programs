 %论文 Finite-Time Algorithom
 %《Adaptive finite time congestion tracking control for TCP/AQM system with input saturation》, 2022.

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
 c1=10;
 r=97/101;
 aa1=0.4;
 l1=100;
 sigma1=5;
 %Step 2
 c2=2;
 l2=10;
 a2=0.5;
 sigma2=1;

 %系统参数
 R=0.1;
 C=10000;
 N=100;

 %定义初值
 x0=[108;0;0;0];   %分别对应状态1，状态2，辅助函数状态，自适应律
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
    
    %——————系统中的扰动——————
    d(i)=2*sin(2*pi*t(i))+1.5*cos(3*t(i))+3.5;
%     d(i)=0;
    dd=[5 d];
    
    %——————定义队列跟踪误差——————
    e1(i)=x(1,i)-qref(i);
    e11=[x_10 e1];

    %——————Prescribed Performance Control——————
    %Prescribed Performance Function
    k_10=10;
    k_12=0.2;
    mu_1=5;
    k1(i)=(k_10 - k_12)*exp(-mu_1*t(i)) + k_12;
    k1_1(i)=(k_10 - k_12)*exp(-mu_1*t(i))*(-mu_1);
    KK1=[k_10 k1];
   
    %Error Transformation
    A(i)=e1(i)/k1(i);
    epson(i)=0.5*log((1+A(i)) / (1-A(i)));
    gamma(i)=tanh(epson(i));
    gamma_ep(i)=4 / ( exp(epson(i)) + exp(-epson(i)) )^2;
    H1(i)=1 / (k1(i)*gamma_ep(i));
    H2(i)=-H1(i)*k1_1(i)*gamma(i);

   %——————定义第一个误差z1——————
   z1(i)=epson(i);
   
   %——————自适应律——————
   xx(3,i)=h*( l1*z1(i)^2/(2*aa1^2) - sigma1*x(3,i) )+x(3,i);

   %——————虚拟控制律——————
   alpha_1(i)=-(c1*z1(i)^(2*r-1) + z1(i)*x(3,i)/(2*aa1^2) + z1(i)/2) / H1(i);
   
   %——————定义第二个误差z2——————
   z2(i)=x(2,i)-alpha_1(i);
   
   %——————自适应律——————
   xx(4,i)=h*(l2*z2(i)^2/(2*a2^2) - sigma2*x(4,i))+x(4,i);
   
   %——————控制律——————
   v(i)=-(c2*z2(i)^(2*r-1) + z2(i)*x(4,i)/(2*a2^2) + z2(i)/2)/g(i);
   vv=[u0, v];
   
   %——————输入受限后的控制律——————
   if v(i)<0
       u(i)=0;
   else
       u(i)=tanh(v(i));
   end
%    u(i)=0.5*tanh((v1(i)-0.5)/0.5)+0.5;
   uu=[u0 u];

   %计算下一步状态
   xx(1,i)=h*(x(2,i)+d(i))+x(1,i);
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
 
 figure(3)
 plot(t,uu(1,:),'lineWidth',1);
 hold on;
%  ylim([-0.1,0.3]);
 xlabel('t');
 ylabel('Control input');
 
 figure(4)
 plot(t,e11,'r-','lineWidth',1);
 hold on;
 plot(t,-KK1,'-.','lineWidth',1);
 hold on;
 plot(t,KK1,'-.','lineWidth',1);
 hold on;
%  ylim([-2,6]);
 xlabel('t(s)');
 ylabel('Error');

 
