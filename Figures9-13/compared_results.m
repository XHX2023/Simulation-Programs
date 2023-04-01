%  %Figure 9
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,x_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,x_PPC(1,:),'-r','lineWidth',1);
%  hold on;
%  plot(t,ydd_PPC(1,:),'--k','lineWidth',1);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  ylabel('$q(t)$ (packets)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  str1='$q(t)$ without PPC','Interpreter','latex';
%  str2='$q(t)$ with PPC','Interpreter','latex';
%  str3='$q_{\rm{ref}}(t)$','Interpreter','latex';
%  legend(str1,str2,str3);
%  hold on;
%  ylim([99,108.1]);
%  hold on;
%  xlim([0,10]);
%  set(gca,'XTick',0:2:10);
%  set(gca,'YTick',99:1:108);


 
%   %Figure 10
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,e11_without,'b-.','lineWidth',1);
%  hold on;
%  plot(t,e11_PPC,'r-','lineWidth',1);
%  hold on;
%  plot(t,deta_2_PPC*rhoo_PPC,'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  plot(t,-deta_1_PPC*rhoo_PPC,'-.','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  ylim([-4.5,10]);
%  str1='$e_1(t)$ without PPC','Interpreter','latex';
%  str2='$e_1(t)$ with PPC','Interpreter','latex';
%  str3='$\delta_2 \tilde \rho(t)$','Interpreter','latex';
%  str4='$- \delta_1 \tilde \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');
%  set(gca,'YTick',-4:2:10);
 


%  %Figure 11
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,WW_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,WW_PPC(1,:),'-r','lineWidth',1);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  ylabel('$W(t)$ (packets)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  str1='$W(t)$ without PPC','Interpreter','latex';
%  str2='$W(t)$ with PPC','Interpreter','latex';
%  legend(str1,str2,'location','SouthEast');
%  hold on;
%  ylim([0,12]);
%  hold on;
%  xlim([0,10]);
%  set(gca,'XTick',0:2:10);
%  set(gca,'YTick',0:2:12);
% 
%  axes('Position',[0.288623346560841 0.395378716744912 0.464840195105831 0.299999999999999]);
%  plot(t,WW_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,WW_PPC(1,:),'-r','lineWidth',1);
%  ylim([9.99,10.005]); % ÉèÖÃ×ø±êÖá·¶Î§
%  xlim([4,5]);% ÉèÖÃ×ø±êÖá·¶Î§
%  set(gca,'XTick',4:0.5:5);
%  set(gca,'YTick',9.99:0.005:10.005); 
 
 
 
%  %Figure 12
%  figure('Units','centimeter','Position',[4 2 8 6]);
%  plot(t,uu_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,uu_PPC(1,:),'-r','lineWidth',1);
% %  hold on;
% %  plot([0,10],[0,0],'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  ylabel('Control input $u(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',8);
%  str1='$u(t)$ without PPC','Interpreter','latex';
%  str2='$u(t)$ with PPC','Interpreter','latex';
% %  str3='$v_{\rm{min}}$','Interpreter','latex';
%  legend(str1,str2);
%  hold on;
%  ylim([-0.1,1.1]);
%  hold on;
%  xlim([0,10]);
%  set(gca,'XTick',0:2:10);
%  set(gca,'YTick',0:0.2:1);
% 
%  axes('Position',[0.240998346560841 0.377739827856024 0.24523602843916 0.299999999999999]);
%  plot(t,uu_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,uu_PPC(1,:),'-r','lineWidth',1);
% %  hold on;
% %  plot([0,10],[0,0],'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  ylim([-0.05,0.2]); % ÉèÖÃ×ø±êÖá·¶Î§
%  xlim([0,0.004]);% ÉèÖÃ×ø±êÖá·¶Î§
%  set(gca,'XTick',0:0.004:0.004);
%  set(gca,'YTick',-0.05:0.05:0.2);
%  
%  axes('Position',[0.627290013227513 0.377739827856024 0.245236028439162 0.299999999999999]);
%  plot(t,uu_without(1,:),'-.b','lineWidth',1);
%  hold on;
%  plot(t,uu_PPC(1,:),'-r','lineWidth',1);
% %  hold on;
% %  plot([0,10],[0,0],'--','lineWidth',1,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  ylim([0.006,0.008]); % ÉèÖÃ×ø±êÖá·¶Î§
%  xlim([6,6.5]);% ÉèÖÃ×ø±êÖá·¶Î§
%  set(gca,'XTick',6:0.25:6.5);
%  set(gca,'YTick',0.006:0.001:0.008);
 

 
  %Figure 13
 figure('Units','centimeter','Position',[4 2 8 6]);
 plot(t,XA_without(1,:),'-.b','lineWidth',1);
 hold on;
 plot(t,XA_PPC(1,:),'-r','lineWidth',1);
 xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex','FontSize',8);
 ylabel('Model error $\Xi(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',8);
 str1='$\Xi(t)$ without PPC','Interpreter','latex';
 str2='$\Xi(t)$ with PPC','Interpreter','latex';
 legend(str1,str2);
 hold on;
%  ylim([99,108.1]);
 hold on;
 xlim([0,10]);
 set(gca,'XTick',0:2:10);
%  set(gca,'YTick',99:1:108);

 
%  %Í¼¡ª¡ª¡ª¡ª¡ª¡ª×ø±ê×ÖÌå8
%  figure('Units','centimeter','Position',[5 5 8 8]);
%  subplot(2,1,1)
%  plot(t,x_PPC(5,:),'r--','lineWidth',1);
%  hold on;
%  plot(t,x_PPC(6,:),'b-.','lineWidth',1);
%  hold on;
%  plot(t,x7_PPC,'-','Color',[0.466666666666667 0.674509803921569 0.188235294117647],'lineWidth',1);
%  xlim([0 10]);
%  ylim([0,1.2]);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('Non-negative signals','FontName','Times New Roman');
%  str1='${\eta_1}(t)$ ','Interpreter','latex';
%  str2='${\eta_2}(t)$ ','Interpreter','latex';
%  str3='${\eta_3}(t)$ ','Interpreter','latex';
%  legend(str1,str2,str3);
%  set(gca,'XTick',0:2:10);
%  set(gca,'YTick',0:0.2:1.2);
% 
%  subplot(2,1,2)
%  plot(t,rhoo_PPC,'--r','lineWidth',1);
%  hold on;
%  plot(t,rhoo1_PPC,'-.b','lineWidth',1);
%  xlim([0 10]);
%  ylim([-0.1 6]);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('PPFs','FontName','Times New Roman','Interpreter','latex');
% str1='SFTPPF $\tilde \rho(t)$','Interpreter','latex';
% str2='FTPPF $\rho(t)$','Interpreter','latex';
% legend(str1,str2);
% set(gca,'XTick',0:2:10);
% set(gca,'YTick',0:2:6);