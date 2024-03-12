close all; clearvars; clc;

S1 = load("spostamenti_lam1.mat"); S2 = load("spostamenti_lam2.mat"); S3 = load("spostamenti_lam3.mat"); S4 = load("spostamenti_lam4.mat");
T1 = load("torsioni_lam1.mat"); T2 = load("torsioni_lam2.mat"); T3 = load("torsioni_lam3.mat"); T4 = load("torsioni_lam4.mat");

S1 = S1.spostamenti_verticali; S2 = S2.spostamenti_verticali; S3 = S3.spostamenti_verticali; S4 = S4.spostamenti_verticali;
T1 = T1.torsioni; T2 = T2.torsioni; T3 = T3.torsioni; T4 = T4.torsioni;


x_nodi = [0 0.3275 0.6525 0.9125];
fontsize_label = 14;
fontsize_title = 12;
fontsize_legend = 12;
tiledlayout(3,2)
nexttile
plot(x_nodi, [0, S1(:,1)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, S2(:,1)'],'b','LineWidth',1.5)
plot(x_nodi, [0, S3(:,1)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, S4(:,1)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$s$ vertical disp.  $[m]$','Interpreter','latex','FontSize',fontsize_label)
title('F_1','FontSize',fontsize_title)

nexttile
plot(x_nodi, [0, T1(:,1)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, T2(:,1)'],'b','LineWidth',1.5)
plot(x_nodi, [0, T3(:,1)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, T4(:,1)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$\theta$ torsions  $[rad]$','Interpreter','latex','FontSize',fontsize_label)
title('M_1','FontSize',fontsize_title)

nexttile
plot(x_nodi, [0, S1(:,2)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, S2(:,2)'],'b','LineWidth',1.5)
plot(x_nodi, [0, S3(:,2)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, S4(:,2)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$s$ vertical disp.  $[m]$','Interpreter','latex','FontSize',fontsize_label)
title('F_2','FontSize',fontsize_title)

nexttile
plot(x_nodi, [0, T1(:,2)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, T2(:,2)'],'b','LineWidth',1.5)
plot(x_nodi, [0, T3(:,2)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, T4(:,2)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$\theta$ torsions  $[rad]$','Interpreter','latex','FontSize',fontsize_label)
title('M_2','FontSize',fontsize_title)

nexttile
plot(x_nodi, [0, S1(:,3)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, S2(:,3)'],'b','LineWidth',1.5)
plot(x_nodi, [0, S3(:,3)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, S4(:,3)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$s$ vertical disp.  $[m]$','Interpreter','latex','FontSize',fontsize_label)
title('F_3','FontSize',fontsize_title)

nexttile
plot(x_nodi, [0, T1(:,3)'],'r','LineWidth',1.5)
hold on
plot(x_nodi, [0, T2(:,3)'],'b','LineWidth',1.5)
plot(x_nodi, [0, T3(:,3)'],'color',[0 0.7 0],'LineWidth',1.5)
plot(x_nodi, [0, T4(:,3)'],'k','LineWidth',1.5)
xticks(x_nodi)
grid on
xlabel('$y$ along the spar  $[m]$','Interpreter','latex','FontSize',fontsize_label)
ylabel('$\theta$ torsions  $[rad]$','Interpreter','latex','FontSize',fontsize_label)
title('M_3','FontSize',fontsize_title)
legend('First laminate','Second laminate','Third laminate','Fourth laminate','fontsize',fontsize_legend)
