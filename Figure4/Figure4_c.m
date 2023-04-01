clc;
close all;
clear;

%����ʱ����
h=0.001;
t=0;
u=[];
NN=3000;   %����ʱ���趨Ϊ3��

%��������
k1=2;
k2=4;
beta=15;
a=0.55;   %��С��ֵǰ���𵴱仺��
aa=a*a;
r=4;   %Խ������ź�ǰ�ڶ���С����������Խ��


%�����ֵ
x0=[-0.5;0;1;0;0];   %�ֱ��Ӧ״̬1��״̬2����������״̬������Ӧ��
x=x0;
x_10=-0.5-0;
xx=[];
u0=0;

%���������
for i=1:NN
    %�����������������������г��ȡ�����������
    qref(i)=0;
    qref_1(i)=0;   %�������г��ȵĵ���
    ydd=[0 qref];
    
    %������������������и���������������
    e1(i)=x(1,i)-qref(i);
    e11=[x_10 e1];
    
    %����������������ʱ�����ܺ���������������
    rho_0=0.97;
    lamda=2;
    rho_Tf=0.03;
    Tf=1;
    
%     rho_0=50;
%     lamda=4;
%     rho_Tf=50;
%     Tf=1;
    
    if t(i)<Tf
        rho(i)=rho_0*exp(-lamda*t(i)/(Tf-t(i)))+rho_Tf+(x(4,i));
    else
        rho(i)=rho_Tf+(x(4,i));
    end
    rhoo=[(rho_0+rho_Tf+0) rho];     %����rhoo
    
    if t(i)<Tf
        rho1(i)=rho_0*exp(-lamda*t(i)/(Tf-t(i)))+rho_Tf;
    else
        rho1(i)=rho_Tf;
    end
    rhoo1=[(rho_0+rho_Tf+0) rho1];     %����rhoo
    
   %���������������ں���Shifting function������������
   v0=0.9;
   n=1;
   T1=0.8;
   if t(i)<T1
       v(i)=1-v0*(cos(pi*t(i)/(2*T1)))^(n+1);
   else
       v(i)=1;
   end
   
   %���������������ں���Shifting function�ĵ���������������
   if t(i)<T1
       v_1(i)=pi*v0*(n+1)*((cos(pi*t(i)/(2*T1)))^(n))*sin(pi*t(i)/(2*T1))/(2*T1);
   else
       v_1(i)=0;
   end
   
   %�������������µ����X������������
   X(i)=v(i)*e1(i);
   XX=[(1-v0)*x_10 X];
   
   %������������arctan�����任������������
   deta_max=0.75;
   deta_min=1;
   if X(i)>0
       deta=deta_max;
   else
       deta=deta_min;
   end
   
    %����������������ʱ�����ܺ�������������������
   A(i)=(sec(pi*X(i)/(2*deta*rho(i))))^2*pi/(2*deta*rho(i));
   A1(i)=(sec(pi*X(i)/(2*deta*rho(i))))^2*(-pi*X(i)/(2*deta*(rho(i))^2));
    
   T11=10;
   T21=10;
   if t(i)<Tf
        rho_1(i)=-lamda*Tf*rho_0*exp(-lamda*t(i)/(Tf-t(i)))/((Tf-t(i))^2)+((-T11*x(4,i)+x(5,i)));
    else
        rho_1(i)=0+((-T11*x(4,i)+x(5,i)));
   end
 
   epsilon(i)=tan(pi*X(i)/(2*deta*rho(i)));
   GG=pi*(1+epsilon(i)^2)/(2*deta*rho(i));
   HH=-rho_1(i)*(1+epsilon(i)^2)*atan(epsilon(i))/rho(i);  
   
   %�����������������һ�����z1������������
   z1(i)=epsilon(i);
   
   %��������������������ɡ�����������
   alpha_1(i)=(-k1*z1(i)+GG*v(i)*qref_1(i)-GG*v_1(i)*e1(i)-HH)/(GG*v(i));
   
   %����������������ڶ������z2������������
   z2(i)=x(2,i)-alpha_1(i);
   
   %����������������Ӧ�ɡ�����������
   xx(3,i)=h*(z2(i)^2/(2*aa)-r*x(3,i))+x(3,i);
   
   %�����������������ɡ�����������
   v1(i)=-(k2*z2(i)+GG*v(i)*z1(i)+z2(i)*x(3,i)/(2*aa)+0.5*z2(i));
   v_min=-18;
   v_max=18;
   
   if v1(i)<v_min
       u(i)=v_min;
   elseif v1(i)<v_max
       u(i)=v1(i);
   else
       u(i)=v_max;
   end

   vv=[u0, u];
   
   %������һ��״̬
   xx(1,i)=h*(x(2,i))+x(1,i);
   xx(2,i)=h*(u(i))+x(2,i);
    
   x7(i)=5*((0.5*sign(v1(i)-v_min)-0.5)*(v1(i)-v_min)+(0.5*sign(v1(i)-v_max)+0.5)*(v1(i)-v_max));
   xx(4,i)=h*((-T11*x(4,i)+x(5,i)))+x(4,i);
   xx(5,i)=h*(-T21*x(5,i)+x7(i))+x(5,i);
   
    %����״̬
    x=[x0 xx];     %���з��䣬����Ϊ��Ӧ��״̬
    t=[t i*h];

end
   
 %��ͼ����
 figure(1);   %���г���
 plot(t,x(1,:),'lineWidth',1);
%  legend('x_1(t)')
 xlabel('t(s)');
 ylabel('q(t)');
 
 figure(2)
 plot(t,vv(1,:),'r','lineWidth',1);
 hold on;
 xlabel('t');
 ylabel('Control input');
 
 figure(3)
 plot(t,e11,'k--','lineWidth',1);
 hold on;
 plot(t,XX,'r-','lineWidth',1);
 hold on;
 plot(t,deta_max*rhoo1,'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,-deta_min*rhoo1,'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 hold on;
 plot(t,deta_max*rhoo,'b-.','lineWidth',1);
 hold on;
 plot(t,-deta_min*rhoo,'b-.','lineWidth',1);
 ylim([-1.5,1]);
 xlabel('t(s)');
 ylabel('Error');
 
 figure(4)
 plot(t,x(4,:),'r','lineWidth',1);
 hold on;
 plot(t,x(5,:),'b','lineWidth',1);
 xlabel('t(s)');
 ylabel('Auxiliary system');
 
 