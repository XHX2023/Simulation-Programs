clc;
close all;
clear;

t=0:0.001:5;

%！！！！！！(21)_v1！！！！！！
v01=0.9;
T1=2;
n=2;
v11=-v01.*(sin(pi.*(T1-t)./(2.*T1))).^(n+1).*(t<T1)+1;

v02=0.2;
v12=-v02.*(sin(pi.*(T1-t)./(2.*T1))).^(n+1).*(t<T1)+1;

v03=0.5;
v13=-v03.*(sin(pi.*(T1-t)./(2.*T1))).^(n+1).*(t<T1)+1;

%！！！！！！(22)！！！！！！
T2=2;
e=sin(pi.*t./(2.*T2)).*(t<T2)+1.*(t>=T2);

%！！！！！！(23)！！！！！！
T3=2;
u=(-((T3-t)./T3).^(n+2)).*(t<T3)+1;

%！！！！！！(24)！！！！！！
T4=2;
k=((2.*t./T3-(t./T3).^2).^2).*(t<T4)+1.*(t>=T4);



figure('Units','centimeter','Position',[5 5 8 9]);
subplot(2,1,1)
plot(t,v11,'k-','lineWidth',0.8);
hold on;
plot(t,e,'--r','lineWidth',0.8);
hold on;
plot(t,u,'--','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
hold on;
plot(t,k,'--b','lineWidth',0.8);
xlim([0 5]);
ylim([-0.2 1.2]);
xlabel('Time(sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('Shifting function','FontName','Times New Roman');
str4='${\mu}(t)$ with ${\mu_{0}=0.8}$','Interpreter','latex';
str1='${\mu_1}(t)$ ','Interpreter','latex';
str2='${\mu_2}(t)$ ','Interpreter','latex';
str3='${\mu_3}(t)$ ','Interpreter','latex';
legend(str4,str1,str2,str3,'location','SouthEast');
set(gca,'XTick',0:1:5);
set(gca,'YTick',-0.2:0.2:1.2);

subplot(2,1,2)
plot(t,v12,'--r','lineWidth',0.8);
hold on;
plot(t,v13,'-.b','lineWidth',0.8);
hold on;
plot(t,v11,'-k','lineWidth',0.8);
xlim([0 5]);
ylim([-0.2 1.2]);
xlabel('Time(sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('$\mu(t)$','FontName','Times New Roman','Interpreter','latex');
str1='${\mu}(t)$ with ${\mu_{0}=0.2}$','Interpreter','latex';
str2='${\mu}(t)$ with ${\mu_{0}=0.5}$','Interpreter','latex';
str3='${\mu}(t)$ with ${\mu_{0}=0.9}$','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',0:1:5);
set(gca,'YTick',-0.2:0.2:1.2);

