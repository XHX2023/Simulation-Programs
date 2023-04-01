 %%%%%%%%%%%%%%%%%%%%%%
 figure('Units','centimeter','Position',[2 2 24 18]);
 subplot(2,2,1)
 plot(t,e11_a,'k--','lineWidth',1.6);
 hold on;
 plot(t,XX_a,'r-','lineWidth',1.6);
 hold on;
 plot(t,deta_max_a*rhoo1_a,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,deta_max_a*rhoo_a,'b-.','lineWidth',1.6);
 hold on;
 plot(t,-deta_min_a*rhoo1_a,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,-deta_min_a*rhoo_a,'b-.','lineWidth',1.6);
 hold on;
 ylim([-1,1.5]);
 str1='$x(t)$','Interpreter','latex';
 str2='$\chi(t)$','Interpreter','latex';
 str3='$\rho(t)$','Interpreter','latex';
 str4='$\tilde \rho(t)$','Interpreter','latex';
 legend(str1,str2,str3,str4);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$x(t)$','FontName','Times New Roman','Interpreter','latex');
 
 subplot(2,2,2)
 plot(t,e11_b,'k--','lineWidth',1.6);
 hold on;
 plot(t,XX_b,'r-','lineWidth',1.6);
 hold on;
 plot(t,deta_max_b*rhoo1_b,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,deta_max_b*rhoo_b,'b-.','lineWidth',1.6);
 hold on;
 plot(t,-deta_min_b*rhoo1_b,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,-deta_min_b*rhoo_b,'b-.','lineWidth',1.6);
 hold on;
 ylim([-1,1.5]);
 str1='$x(t)$','Interpreter','latex';
 str2='$\chi(t)$','Interpreter','latex';
 str3='$\rho(t)$','Interpreter','latex';
 str4='$\tilde \rho(t)$','Interpreter','latex';
 legend(str1,str2,str3,str4);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$x(t)$','FontName','Times New Roman','Interpreter','latex');
 
 subplot(2,2,3)
 plot(t,e11_c,'k--','lineWidth',1.6);
 hold on;
 plot(t,XX_c,'r-','lineWidth',1.6);
 hold on;
 plot(t,deta_max_c*rhoo1_c,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,deta_max_c*rhoo_c,'b-.','lineWidth',1.6);
 hold on;
 plot(t,-deta_min_c*rhoo1_c,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,-deta_min_c*rhoo_c,'b-.','lineWidth',1.6);
 hold on;
 ylim([-1.5,1]);
 str1='$x(t)$','Interpreter','latex';
 str2='$\chi(t)$','Interpreter','latex';
 str3='$\rho(t)$','Interpreter','latex';
 str4='$\tilde \rho(t)$','Interpreter','latex';
 legend(str1,str2,str3,str4);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$x(t)$','FontName','Times New Roman','Interpreter','latex');
  
 subplot(2,2,4)
 plot(t,e11_d,'k--','lineWidth',1.6);
 hold on;
 plot(t,XX_d,'r-','lineWidth',1.6);
 hold on;
 plot(t,deta_max_d*rhoo1_d,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,deta_max_d*rhoo_d,'b-.','lineWidth',1.6);
 hold on;
 plot(t,-deta_min_d*rhoo1_d,'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,-deta_min_d*rhoo_d,'b-.','lineWidth',1.6);
 hold on;
 ylim([-1.5,1]);
 str1='$x(t)$','Interpreter','latex';
 str2='$\chi(t)$','Interpreter','latex';
 str3='$\rho(t)$','Interpreter','latex';
 str4='$\tilde \rho(t)$','Interpreter','latex';
 legend(str1,str2,str3,str4);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$x(t)$','FontName','Times New Roman','Interpreter','latex');