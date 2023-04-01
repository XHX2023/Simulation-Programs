% %Í¼14¡ª¡ª¡ª¡ª¡ª¡ª×ø±ê×ÖÌå19
%  figure('Units','centimeter','Position',[2 2 24 18]);
%  subplot(2,2,1)
%  plot(t,e11_1,'k--','lineWidth',2);
%  hold on;
%  plot(t,XX_1,'r-','lineWidth',2);
%  hold on;
%  plot(t,deta_2*rhoo1_1,'b-.','lineWidth',1.8);
%  hold on;
%  plot(t,-deta_1*rhoo1_1,'b--','lineWidth',1.8);
%  hold on;
%  ylim([-5.2,10.2]);
%  str1='$e_1(t)$ with $x_1(0)=106$','Interpreter','latex';
%  str2='$\chi(t)$ with $x_1(0)=106$','Interpreter','latex';
%  str3='$\delta_2 \tilde \rho(t)$','Interpreter','latex';
%  str4='$- \delta_1 \tilde \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');
%  
%  subplot(2,2,2)
%  plot(t,e11_2,'k--','lineWidth',2);
%  hold on;
%  plot(t,XX_2,'r-','lineWidth',2);
%  hold on;
%  plot(t,deta_2*rhoo_2,'b-.','lineWidth',1.8);
%  hold on;
%  plot(t,-deta_1*rhoo_2,'b--','lineWidth',1.8);
%  hold on;
%  ylim([-5.2,10.2]);
%  hold on;
%  xlim([0,3]);
%  str1='$e_1(t)$ with $x_1(0)=106$','Interpreter','latex';
%  str2='$\chi(t)$ with $x_1(0)=106$','Interpreter','latex';
%  str3='$\delta_2 \rho(t)$','Interpreter','latex';
%  str4='$- \delta_1 \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');
%  
%  subplot(2,2,3)
%  plot(t,e11_3,'k--','lineWidth',2);
%  hold on;
%  plot(t,XX_3,'r-','lineWidth',2);
%  hold on;
%  plot(t,deta_2*rhoo_3,'b-.','lineWidth',1.8);
%  hold on;
%  plot(t,-deta_1*rhoo_3,'b--','lineWidth',1.8);
%  hold on;
%  ylim([-5.2,10.2]);
%  str1='$e_1(t)$ with $x_1(0)=110$','Interpreter','latex';
%  str2='$\chi(t)$ with $x_1(0)=110$','Interpreter','latex';
%  str3='$\delta_2 \tilde \rho(t)$','Interpreter','latex';
%  str4='$- \delta_1 \tilde \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');
%   
%  subplot(2,2,4)
%  plot(t,e11_4,'k--','lineWidth',2);
%  hold on;
%  plot(t,XX_4,'r-','lineWidth',2);
%  hold on;
%  plot(t,deta_2*rhoo_4,'b-.','lineWidth',1.8);
%  hold on;
%  plot(t,-deta_1*rhoo_4,'b--','lineWidth',1.8);
%  hold on;
%  ylim([-5.2,10.2]);
%  hold on;
%  xlim([0,3]);
%  str1='$e_1(t)$ with $x_1(0)=110$','Interpreter','latex';
%  str2='$\chi(t)$ with $x_1(0)=110$','Interpreter','latex';
%  str3='$\delta_2 \rho(t)$','Interpreter','latex';
%  str4='$- \delta_1 \rho(t)$','Interpreter','latex';
%  legend(str1,str2,str3,str4);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$e_1(t)$ (packets)','FontName','Times New Roman','Interpreter','latex');



% %Í¼15¡ª¡ª¡ª¡ª¡ª¡ª×ø±ê×ÖÌå19
%  figure('Units','centimeter','Position',[2 2 24 18]);
%  subplot(2,2,1)
%  plot(t,uu_1,'r-','lineWidth',2);
%  ylim([-0.2,1.5]);
%  str1='$u(t)$ with $x_1(0)=106$','Interpreter','latex';
%  legend(str1);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$u(t)$ under $\tilde \rho(t)$','FontName','Times New Roman','Interpreter','latex');
%  
%  subplot(2,2,2)
%  plot(t,uu_2,'r-','lineWidth',2);
%  ylim([-0.2,1.5]);
%  str1='$u(t)$ with $x_1(0)=106$','Interpreter','latex';
%  legend(str1);
%  hold on;
%  xlim([0,3]);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$u(t)$ under $\rho(t)$','FontName','Times New Roman','Interpreter','latex');
%  
%  subplot(2,2,3)
%  plot(t,uu_3,'r-','lineWidth',2);
%  ylim([-0.2,1.5]);
%  str1='$u(t)$ with $x_1(0)=110$','Interpreter','latex';
%  legend(str1);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$u(t)$ under $\tilde \rho(t)$','FontName','Times New Roman','Interpreter','latex');
%   
%  subplot(2,2,4)
%  plot(t,uu_4,'r-','lineWidth',2);
%  ylim([-0.2,1.5]);
%  str1='$u(t)$ with $x_1(0)=110$','Interpreter','latex';
%  legend(str1);
%  hold on;
%  xlim([0,3]);
%  xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
%  ylabel('$u(t)$ under $\rho(t)$','FontName','Times New Roman','Interpreter','latex');



%Í¼16¡ª¡ª¡ª¡ª¡ª¡ª×ÖÌå8
figure('Units','centimeter','Position',[5 5 8 9]);
subplot(2,1,1)
plot(t,x_3(5,:),'r--','lineWidth',0.8);
hold on;
plot(t,x_3(6,:),'b-.','lineWidth',0.8);
hold on;
plot(t,XX7_3(1,:),'-','Color',[0.929411764705882 0.694117647058824 0.125490196078431],'lineWidth',0.8);
xlim([0 10]);
ylim([0 1.2]);
xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('Non-negative signals','FontName','Times New Roman');
str1='${\eta_1}(t)$ ','Interpreter','latex';
str2='${\eta_2}(t)$ ','Interpreter','latex';
str3='${\eta_3}(t)$ ','Interpreter','latex';
legend(str1,str2,str3,'location','SouthEast');
set(gca,'XTick',0:2:10);
set(gca,'YTick',0:0.2:1.2);

subplot(2,1,2)
plot(t,rhoo_3,'--r','lineWidth',0.8);
hold on;
plot(t,rhoo1_3,'-.b','lineWidth',0.8);
xlim([0 10]);
ylim([-0.2 10]);
xlabel('Time (sec)','FontName','Times New Roman','Interpreter','latex');
ylabel('PPFs','FontName','Times New Roman','Interpreter','latex');
str1='SFTPF $\tilde \rho (t)$','Interpreter','latex';
str2='FTPF $\rho (t)$','Interpreter','latex';
legend(str1,str2,'location','SouthEast');
set(gca,'XTick',0:2:10);
set(gca,'YTick',0:2:10);
