%  %Í¼17¡ª¡ª¡ª¡ª¡ª¡ª×ø±ê×ÖÌå8
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,x_qi(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,x_shen(1,:),'--','lineWidth',1);
%  hold on;
%  plot(t,x_pr(1,:),'-r','lineWidth',1);
%  hold on;
%  plot(t,ydd(1,:),'--k','lineWidth',1);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  ylabel('$q(t)$ (packets)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  str1='$q(t)$ under Controller 1','Interpreter','latex';
%  str2='$q(t)$ under Controller 2','Interpreter','latex';
%  str3='$q(t)$ under Controller 3','Interpreter','latex';
%  str4='$q_{\rm{ref}}(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  hold on;
%  ylim([99.6,108.2]);
%  hold on;
%  xlim([0,3]);
%  set(gca,'XTick',0:1:3);
%  set(gca,'YTick',99:1:108);


%Í¼18¡ª¡ª¡ª¡ª¡ª¡ª×ÖÌå8
figure('Units','centimeter','Position',[5 0.1 24 27]);
subplot(3,1,1)
plot(t,e11_qi(1,:),'b','lineWidth',0.8);
hold on;
plot(t,varphi_qi*XI_qi(1,:),'--','lineWidth',0.8);
hold on;
plot(t,-phi_qi*XI_qi(1,:),'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
xlim([0 3]);
ylim([-5 10]);
xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('$e_1(t)$ (packets)','FontName','Times New Roman');
str1='$e_1(t)$ under Controller 1','Interpreter','latex';
str2='$\varphi \xi(t)$ in Qi et al. (2022)','Interpreter','latex';
str3='$- \phi \xi(t)$ in Qi et al. (2022)','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',0:0.5:3);
set(gca,'YTick',-5:5:10);

subplot(3,1,2)
plot(t,e11_shen(1,:),'-','lineWidth',0.8);
hold on;
plot(t,KK1_shen(1,:),'--','lineWidth',0.8);
hold on;
plot(t,-KK1_shen(1,:),'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
xlim([0 3]);
ylim([-10 10]);
xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('$e_1(t)$ (packets)','FontName','Times New Roman');
str1='$e_1(t)$ under Controller 2','Interpreter','latex';
str2='$\kappa (t)$ in Shen et al. (2022b)','Interpreter','latex';
str3='$- \kappa (t)$ in Shen et al. (2022b)','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',0:0.5:3);
set(gca,'YTick',-10:5:10);

subplot(3,1,3)
plot(t,e11_pr(1,:),'-','lineWidth',0.8);
hold on;
plot(t,XX_pr(1,:),'-','lineWidth',0.8);
hold on;
plot(t,deta_2_pr * rhoo_pr(1,:),'--','lineWidth',0.8);
hold on;
plot(t,- deta_1_pr * rhoo_pr(1,:),'-.','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
xlim([0 3]);
ylim([-5 10]);
xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('$e_1(t)$ (packets)','FontName','Times New Roman');
str1='$e_1(t)$ under Controller 3','Interpreter','latex';
str2='$\chi(t)$ in this article','Interpreter','latex';
str3='$\delta_2 \tilde \rho(t)$ in this article','Interpreter','latex';
str4='$- \delta_1 \tilde \rho(t)$ in this article','Interpreter','latex';
legend(str1,str2,str3,str4,'location','SouthEast');
set(gca,'XTick',0:0.5:3);
set(gca,'YTick',-10:5:10);


% %Í¼19¿ØÖÆÊäÈë¡ª¡ª¡ª¡ª¡ª¡ª×ø±ê×ÖÌå8
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,uu_qi(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,uu_shen(1,:),'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  plot(t,uu_pr(1,:),'-r','lineWidth',1);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  ylabel('Control input $u(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  str1='$u(t)$ under Controller 1','Interpreter','latex';
%  str2='$u(t)$ under Controller 2','Interpreter','latex';
%  str3='$u(t)$ under Controller 3','Interpreter','latex';
%  legend(str1,str2,str3);
%  hold on;
%  ylim([-0.002,0.2]);
%  hold on;
%  xlim([0,3]);
%  set(gca,'XTick',0:0.5:3);
%  set(gca,'YTick',0:0.05:0.2);
% 
%  axes('Position',[0.219831679894174 0.324823161189357 0.24523602843916 0.299999999999999]);
%  plot(t,uu_qi(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,uu_shen(1,:),'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  plot(t,uu_pr(1,:),'-r','lineWidth',1);
%  ylim([-0.002,0.04]); % ÉèÖÃ×ø±êÖá·¶Î§
%  xlim([0,0.3]);% ÉèÖÃ×ø±êÖá·¶Î§
%  set(gca,'XTick',0:0.1:0.3);
%  set(gca,'YTick',0:0.02:0.04);
