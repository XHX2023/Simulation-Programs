 %%%%%%%%%%%%%%%%%%%%%%
 figure(1);   
 plot(t,x_without(1,:),'lineWidth',1);
 hold on;
 plot(t,x_PPC(1,:),'lineWidth',1);
 hold on;
 plot(t,ydd_PPC(1,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('q(t)');
 
 figure(2)   
 plot(t,WW_without(1,:),'lineWidth',1);
 hold on;
 plot(t,WW_PPC(1,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('W(t)');
  
 figure(3)
 plot(t,uu_without(1,:),'lineWidth',1);
 hold on;
 plot(t,uu_PPC(1,:),'lineWidth',1);
 hold on;
 ylim([-0.1,0.3]);
 xlabel('t');
 ylabel('Control input');
 
 figure(4)
 plot(t,e11_without,'k--','lineWidth',1);
 hold on;
 plot(t,e11_PPC,'r-','lineWidth',1);
 hold on;
 plot(t,XX_PPC,'r-.','lineWidth',1);
 hold on;
 plot(t,deta_max_PPC*rhoo_PPC,'-.','lineWidth',1);
 hold on;
 plot(t,-deta_min_PPC*rhoo_PPC,'-.','lineWidth',1);
 hold on;
%  ylim([-2,6]);
 xlabel('t(s)');
 ylabel('Error');
   
 figure(5)
 plot(t,x_PPC(4,:),'lineWidth',1);
 xlabel('t(s)');
 ylabel('Adaptive');
 
 figure(6)
 plot(t,x_PPC(5,:),'r','lineWidth',1);
 hold on;
 plot(t,x_PPC(6,:),'b','lineWidth',1);
 xlabel('t(s)');
 ylabel('Auxiliary system');
 
 %%%%%%%%%%%%%%%%%%%%%%
 figure('Units','centimeter','Position',[4 2 8 6]);
 plot(t,x_without(1,:),'-k','lineWidth',1);
 hold on;
 plot(t,x_PPC(1,:),'-.r','lineWidth',1);
 hold on;
 plot(t,ydd_PPC(1,:),'--b','lineWidth',1);
 xlabel('$v(t)$','FontName','Times New Roman','Interpreter','latex','FontSize',6);
 ylabel('$u(v(t))$','FontName','Times New Roman','Interpreter','latex','FontSize',6);
 str1='$u(t)$','Interpreter','latex';
 str2='$h(v(t))$','Interpreter','latex';
 str3='$d(v(t))$','Interpreter','latex';
 legend(str1,str2,str3);
%  set(gca,'XTick',-1.5:0.5:2.5);
%  set(gca,'YTick',-0.5:0.5:2);


%  figure('Units','centimeter','Position',[2 2 24 18]);
%  subplot(2,2,1)
%  plot(t,e11_SFTPPC_108,'k--','lineWidth',1.6);
%  hold on;
%  plot(t,XX_SFTPPC_108,'r-','lineWidth',1.6);
% %  hold on;
% %  plot(t,deta_max_a*rhoo1_a,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  plot(t,deta_max_SFTPPC_108*rhoo_SFTPPC_108,'b-.','lineWidth',1.6);
% %  hold on;
% %  plot(t,-deta_min_a*rhoo1_a,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
%  hold on;
%  plot(t,-deta_min_SFTPPC_108*rhoo_SFTPPC_108,'b-.','lineWidth',1.6);
%  hold on;
%  ylim([-4,10]);
%  str1='$e_1(t)$ with $x_1(0)=108$','Interpreter','latex';
%  str2='$\chi(t)$','Interpreter','latex';
%  str3='SFTPPF $\tilde \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3);
%  xlabel('time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');



