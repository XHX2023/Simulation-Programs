 %%%%%%%%%%%%%%%%%%%%%%
 figure('Units','centimeter','Position',[2 2 24 18]);
 subplot(2,2,1)
 plot([0,3],[18,18],'-.','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot([0,3],[-18,-18],'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,vv_a,'r-','lineWidth',1.6);
 hold on;
 ylim([-20,20]);
%  str1='$u(t)$ with $x(0)=0.5$','Interpreter','latex';
%  str2='$v_{\rm{max}}=18$','Interpreter','latex';
%  str3='$v_{\rm{min}}=-18$','Interpreter','latex';
%  legend(str1,str2,str3);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$u(t)$ with $x(0)=0.5$','FontName','Times New Roman','Interpreter','latex');
 
 subplot(2,2,2)
 plot([0,3],[18,18],'-.','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot([0,3],[-18,-18],'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,vv_b,'r-','lineWidth',1.6);
 hold on;
 ylim([-20,20]);
%  str1='$u(t)$ with $x(0)=1.25$','Interpreter','latex';
%  str2='$v_{\rm{max}}=18$','Interpreter','latex';
%  str3='$v_{\rm{min}}=-18$','Interpreter','latex';
%  legend(str1,str2,str3);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$u(t)$ with $x(0)=1.25$','FontName','Times New Roman','Interpreter','latex');
 
 subplot(2,2,3)
 plot([0,3],[18,18],'-.','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot([0,3],[-18,-18],'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,vv_c,'r-','lineWidth',1.6);
 hold on;
 ylim([-20,20]);
%  str1='$u(t)$ with $x(0)=-0.5$','Interpreter','latex';
%  str2='$v_{\rm{max}}=18$','Interpreter','latex';
%  str3='$v_{\rm{min}}=-18$','Interpreter','latex';
%  legend(str1,str2,str3);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$u(t)$ with $x(0)=-0.5$','FontName','Times New Roman','Interpreter','latex');
  
 subplot(2,2,4)
 plot([0,3],[18,18],'-.','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot([0,3],[-18,-18],'--','lineWidth',1.6,'Color',[0.466666666666667 0.674509803921569 0.188235294117647]);
 hold on;
 plot(t,vv_d,'r-','lineWidth',1.6);
 hold on;
 ylim([-20,20]);
%  str1='$u(t)$ with $x(0)=-1.25$','Interpreter','latex';
%  str2='$v_{\rm{max}}=18$','Interpreter','latex';
%  str3='$v_{\rm{min}}=-18$','Interpreter','latex';
%  legend(str1,str2,str3);
 xlabel('$t$/s','FontName','Times New Roman','Interpreter','latex');
 ylabel('$u(t)$ with $x(0)=-1.25$','FontName','Times New Roman','Interpreter','latex');