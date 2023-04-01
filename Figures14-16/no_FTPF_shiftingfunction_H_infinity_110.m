clc;
close all;
clear;

%定义时间间隔
h=0.001;
t=0;
u=[];
NN=10000;   %运行时间设定为3秒

%参数定义
k1=1.2;
k2=5;
beta=15;
a=0.08;   %调小该值前期震荡变缓慢
aa=a*a;
k3=100;   %越大控制信号前期抖动小，但是误差抖动越大
r1=0.3;
hhhh=1;

%系统参数
R=0.1;
C=10000;
N=100;
Tp=0.09;

%辅助系统参数
v_min=0;
v_max=1;
T11=1;
T21=4;

%定义初值
x0=[110;0;1;1;0;0];   %分别对应状态1，状态2，辅助函数状态，自适应律
x=x0;
x_10=110-100;
xx=[];
u0=0.1223;

%控制器设计
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
    
    %——————有限时间性能函数——————
    rho_0=8.97;
    lamda=2;
    rho_Tf=0.03;
    Tf=2;
    
    if t(i)<Tf
        rho(i)=rho_0*exp(-lamda*t(i)/(Tf-t(i)))+rho_Tf;
    else
        rho(i)=rho_Tf;
    end
    rhoo=[(rho_0+rho_Tf+0) rho];     %保存rhoo

    %——————函数rho(i)的导数——————
    if t(i)<Tf
        rho_1(i)=-lamda*Tf*rho_0*exp(-lamda*t(i)/(Tf-t(i)))/((Tf-t(i))^2);
    else
        rho_1(i)=0;
    end
    
    %——————无变边界的有限时间性能函数——————
    if t(i)<Tf
        rho1(i)=rho_0*exp(-lamda*t(i)/(Tf-t(i)))+rho_Tf;
    else
        rho1(i)=rho_Tf;
    end
    rhoo1=[(rho_0+rho_Tf+0) rho1];     %保存rhoo
   
   %——————调节函数Shifting function——————
   v0=0.91;
   n=2;
   T1=Tf;
   if t(i)<T1
       v(i)=1-v0*(sin(pi*(T1-t(i))/(2*T1)))^(n+1);
   else
       v(i)=1;
   end
   
   %——————调节函数Shifting function的导数——————
   if t(i)<T1
       v_1(i)=pi*v0*(n+1)*((sin(pi*(T1-t(i))/(2*T1)))^n)*(cos(pi*(T1-t(i))/(2*T1)))/(2*T1);
   else
       v_1(i)=0;
   end
   
   %——————新的误差X——————
   X(i)=v(i)*e1(i);
   XX=[(1-v0)*x_10 X];



   
   %——————arctan非对称型误差变换——————
   deta_2=1;
   deta_1=0.5;
   xi_1=(deta_1+deta_2)/pi;
   xi_2=(-deta_1+deta_2)/2;
   varpi=tan( (pi*(deta_1-deta_2)) / (2*(deta_1+deta_2)) );
   epsilon(i)=tan( (X(i)-rho(i)*xi_2) / (rho(i)*xi_1) ) - varpi;
   GG=(1 + (epsilon(i)+varpi)^2) / (xi_1*rho(i));
   HH= - rho_1(i) * (1+(epsilon(i)+varpi)^2) * (xi_1*atan(epsilon(i)+varpi)+xi_2) / (rho(i)*xi_1);  
   
   %——————定义第一个误差z1——————
   z1(i)=epsilon(i);
   
   %——————虚拟控制律——————
   alpha_1(i)=(-k1*z1(i)-GG*v(i)*x(3,i)+GG*v(i)*qref_1(i)-GG*v_1(i)*e1(i)-HH-GG^2*v(i)^2*z1(i)/(4*r1^2))/(GG*v(i));
   
   %——————定义第二个误差z2——————
   z2(i)=x(2,i)-alpha_1(i)-x(3,i);
   
   %——————自适应律——————
   xx(4,i)=h*(hhhh*z2(i)^2/(2*aa)-k3*x(4,i))+x(4,i);
   
   %——————控制律——————
   v1(i)=-(k2*z2(i)+f(i)+GG*v(i)*z1(i)+beta*x(3,i)+z2(i)*x(4,i)/(2*aa)+z2(i)/2)/g(i);
   vv=[u0, v1];
   
   %——————输入受限后的控制律——————
   u(i)=0.5*tanh((v1(i)-0.5)/0.5)+0.5;
   uu=[u0 u];
   
   %计算下一步状态
   %诱导时延引发的不确定性
   Xa(i)=50*sin(x(1,i)/C+Tp);
   XA=[5 Xa];

   xx(1,i)=h*(x(2,i)+d(i))+x(1,i);
   xx(2,i)=h*(f(i)+g(i)*u(i) + Xa(i))+x(2,i);
   xx(3,i)=h*(-beta*x(3,i)+g(i)*(u(i)-v1(i)))+x(3,i);
   
   %辅助系统
   x7(i)=(0.5*sign(v1(i)-v_min)-0.5) * (v1(i)-v_min) + (0.5*sign(v1(i)-v_max)+0.5) * (v1(i)-v_max);
   xx(5,i)=h*(-T11*x(5,i)+x(6,i))+x(5,i);
   xx(6,i)=h*(-T21*x(6,i)+x7(i))+x(6,i);
   
    W(i)=R*(x(2,i)+C)/N;   %窗口大小
    WW=[0 W];
    
    XX7=[0 x7];

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
 
 figure(2)   %窗口大小
 plot(t,WW(1,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('W(t)');
 
 figure(3)
 plot(t,uu(1,:),'lineWidth',1);
 hold on;
 plot(t,vv(1,:),'r','lineWidth',1);
 hold on;
 ylim([-0.1,0.3]);
 xlabel('t');
 ylabel('Control input');
 
 figure(5)
 plot(t,e11,'k--','lineWidth',1);
 hold on;
 plot(t,XX,'r-','lineWidth',1);
 hold on;
 plot(t,deta_2*rhoo,'-.','lineWidth',1);
 hold on;
 plot(t,-deta_1*rhoo,'-.','lineWidth',1);
 hold on;
 plot(t,deta_2*rhoo1,'k--','lineWidth',1);
 hold on;
 plot(t,-deta_1*rhoo1,'k--','lineWidth',1);
 hold on;
 ylim([-5,10]);
 xlabel('t(s)');
 ylabel('Error');
 
 figure(6)
 plot(t,x(4,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('Adaptive');
 
 figure(7)
 plot(t,dd(1,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('Disturbance');
 
 figure(8)
 plot(t,x(5,:),'r','lineWidth',1);
 hold on;
 plot(t,x(6,:),'b','lineWidth',1);
 hold on;
 plot(t,XX7(1,:),'k','lineWidth',1);
 xlabel('t(s)');
 ylabel('Auxiliary system');

 figure(9)
 plot(t,XA(1,:),'r','lineWidth',1);
 