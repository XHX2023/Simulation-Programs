clc;
close all;
clear all;

t=-50:0.1:50;
%ETF
delta_1=0.6;
delta_2=0.8;
s1=(delta_1+delta_2)/pi;
s2=(delta_2-delta_1)/2;
w=tan(pi*(delta_1-delta_2)/(2*(delta_1+delta_2)));
S=s1*atan(t+w)+s2;

%ETF1
E=2*atan(t)/pi;

%ETF2
k_1=-1.3;
k_2=1.4;
k_a=(k_2-k_1)/pi;
k_b=(k_1+k_2)/2;
T=k_a*atan(t)+k_b;



figure('Units','centimeter','Position',[4 2 24 18]);
annotation('arrow',[0.517722222222222 0.517722222222222],[0.111902777777778 0.925761574074074],'LineWidth',1.6);
hold on;
annotation('arrow',[0.130548611111111 0.904013888888889],[0.517303240740741 0.517127314814815],'LineWidth',1.6);
hold on;
plot(t,S,'-r','lineWidth',2.4);
hold on;
plot(t,E,'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',2.4);
hold on;
plot(t,T,'-.','Color',[0.466666666666667 0.674509803921569 0.188235294117647],'lineWidth',2.4);
hold on;
plot([-50,50],[-1,-1],'b--','lineWidth',1.6);
hold on;
plot([-50,50],[1,1],'b--','lineWidth',1.6);
ylim([-1.5 1.5]);
% xlabel('$\varepsilon(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',18);
% ylabel('ETF','FontName','Times New Roman','FontSize',18);
set(gca,'xticklabel',[]);
set(gca,'yticklabel',[]);

figure('Units','centimeter','Position',[4 2 24 18]);
plot(t,S,'-r','lineWidth',2.4);
hold on;
plot(t,E,'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',2.4);
hold on;
plot(t,T,'-.','Color',[0.466666666666667 0.674509803921569 0.188235294117647],'lineWidth',2.4);
hold on;
plot([-50,50],[-1,-1],'b--','lineWidth',1.6);
hold on;
plot([-50,50],[1,1],'b--','lineWidth',1.6);
hold on;
plot([-50,50],[0,0],'k--','lineWidth',1.6);
hold on;
plot([0,0],[-1.5,1.5],'k--','lineWidth',1.6);
ylim([-1.5 1.5]);
xlabel('$\varepsilon(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',14);
ylabel('ETF','FontName','Times New Roman','FontSize',14);
str1='$S(\varepsilon (t))$','Interpreter','latex';
str2='$\Psi (\varepsilon (t))$','Interpreter','latex';
str3='$T(\varepsilon (t))$','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',-50:25:50);
set(gca,'YTick',-1.5:0.5:1.5);

figure('Units','centimeter','Position',[4 2 8 6]);
plot(t,S,'-r','lineWidth',0.8);
hold on;
plot(t,E,'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
hold on;
plot(t,T,'-.','Color',[0.466666666666667 0.674509803921569 0.188235294117647],'lineWidth',0.8);
hold on;
plot([-50,50],[-1,-1],'b--','lineWidth',0.6);
hold on;
plot([-50,50],[1,1],'b--','lineWidth',0.6);
hold on;
plot([-50,50],[0,0],'k--','lineWidth',0.6);
hold on;
plot([0,0],[-1.5,1.5],'k--','lineWidth',0.6);
ylim([-1.5 1.5]);
xlabel('$\varepsilon(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',6);
ylabel('ETF','FontName','Times New Roman','FontSize',6);
str1='$S(\varepsilon (t))$','Interpreter','latex';
str2='$\Psi (\varepsilon (t))$','Interpreter','latex';
str3='$T(\varepsilon (t))$','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',-50:25:50);
set(gca,'YTick',-1.5:0.5:1.5);





