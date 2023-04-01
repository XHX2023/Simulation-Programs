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
k2=5;
beta=1;
a=0.55;   %��С��ֵǰ���𵴱仺��
aa=a*a;
r=4;   %Խ������ź�ǰ�ڶ���С����������Խ��


%�����ֵ
x0=[1.25;0;1];   %�ֱ��Ӧ״̬1��״̬2����������״̬������Ӧ��
x=x0;
x_10=1.25-0;
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
    rho_0=0.95;
    lamda=2;
    rho_Tf=0.05;
    Tf=1;
    
%     rho_0=50;
%     lamda=4;
%     rho_Tf=50;
%     Tf=1;
    
    if t(i)<Tf
        rho(i)=rho_0*exp(-lamda*t(i)/(Tf-t(i)))+rho_Tf;
    else
        rho(i)=rho_Tf;
    end
    rhoo=[(rho_0+rho_Tf+0) rho];     %����rhoo
    
      %����������������ʱ�����ܺ�������������������
   if t(i)<Tf
        rho_1(i)=-lamda*Tf*rho_0*exp(-lamda*t(i)/(Tf-t(i)))/((Tf-t(i))^2);
    else
        rho_1(i)=0;
   end
   
   %���������������ں���Shifting function������������
   v0=0.98;
   n=1;
   T1=Tf;
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
   deta_max=1;
   deta_min=0.75;
   if X(i)>0
       deta=deta_max;
   else
       deta=deta_min;
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
   u(i)=-(k2*z2(i)+GG*v(i)*z1(i)+z2(i)*x(3,i)/(2*aa)+0.5*z2(i));
   vv=[u0, u];
   
   %������һ��״̬
   xx(1,i)=h*(x(2,i))+x(1,i);
   xx(2,i)=h*(u(i))+x(2,i);
    
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
 plot(t,deta_max*rhoo,'b-.','lineWidth',1);
 hold on;
 plot(t,-deta_min*rhoo,'b-.','lineWidth',1);
 hold on;
 ylim([-1,1.5]);
 xlabel('t(s)');
 ylabel('Error');
 
 
 
 