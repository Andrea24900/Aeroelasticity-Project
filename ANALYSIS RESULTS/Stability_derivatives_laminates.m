close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';
%name_file_f06 = 'full_long.f06';
%name_file_f06 = 'test_fusoliera.f06';
name_file_f06_2 = 'long_lam_2.f06';
name_file_f06_3 = 'long_lam_3.f06';
name_file_f06_4 = 'long_lam_4.f06';

subcases = 6;

SD = get_stability_derivatives(name_file_f06, 6);
SD_2 = get_stability_derivatives(name_file_f06_2, subcases);
SD_3 = get_stability_derivatives(name_file_f06_3, subcases);
SD_4 = get_stability_derivatives(name_file_f06_4, subcases);

%% PLOTS
velocity_vector=[11,13,15,17,19,22];
velocity_vector_cases=velocity_vector;

line_width = 2;
fontsize_label = 17;
fontsize_legend = 13;



% CZ_alpha
C_Z_alpha_rigid(:,1)=SD.anglea(3,2,:);
C_Z_alpha_elastic(:,1)=SD.anglea(3,4,:);

C_Z_alpha_lam2(:,1)=SD_2.anglea(3,4,:);
C_Z_alpha_lam3(:,1)=SD_3.anglea(3,4,:);
C_Z_alpha_lam4(:,1)=SD_4.anglea(3,4,:);

figure
plot(velocity_vector,C_Z_alpha_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_Z_alpha_elastic,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam2,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam3,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam4,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{Z_{\alpha}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -5.15;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -4.96;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic Lam. 1}','\textit{Elastic Lam. 2}',...
    '\textit{Elastic Lam. 3}','\textit{Elastic Lam. 4}',...
    'interpreter','latex','fontsize',fontsize_legend,'location','best')

filename = 'CZ_alpha_vs_V.png';
saveas(gcf,filename);

% CZ_deltaE
C_Z_deltaE_rigid(:,1)=SD.el(3,2,:);
C_Z_deltaE_elastic(:,1)=SD.el(3,4,:);

figure
plot(velocity_vector,C_Z_deltaE_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_Z_deltaE_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{Z_{\delta_e}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -0.321;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -0.300;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

filename = 'CZ_el_vs_V.png';
saveas(gcf,filename);

% CZ_q
C_Z_q_rigid(:,1)=SD.pitch(3,2,:);
C_Z_q_elastic(:,1)=SD.pitch(3,4,:);

figure
plot(velocity_vector,C_Z_q_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_Z_q_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{Z_q}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -7.32;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -7.33;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

filename = 'CZ_q_vs_V.png';
saveas(gcf,filename);

% CM_alpha
C_M_alpha_rigid(:,1)=SD.anglea(5,2,:);
C_M_alpha_elastic(:,1)=SD.anglea(5,4,:);

C_Z_alpha_lam2(:,1)=SD_2.anglea(5,4,:);
C_Z_alpha_lam3(:,1)=SD_3.anglea(5,4,:);
C_Z_alpha_lam4(:,1)=SD_4.anglea(5,4,:);

figure
plot(velocity_vector,C_M_alpha_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_M_alpha_elastic,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam2,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam3,'*-','LineWidth', line_width)
plot(velocity_vector_cases,C_Z_alpha_lam4,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{M_{\alpha}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -0.453;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -0.463;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic Lam. 1}','\textit{Elastic Lam. 2}',...
    '\textit{Elastic Lam. 3}','\textit{Elastic Lam. 4}',...
    'interpreter','latex','fontsize',fontsize_legend,'location','best')


filename = 'CM_alpha_vs_V.png';
saveas(gcf,filename);

% CM_deltaE
C_M_deltaE_rigid(:,1)=SD.el(5,2,:);
C_M_deltaE_elastic(:,1)=SD.el(5,4,:);

figure
plot(velocity_vector,C_M_deltaE_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_M_deltaE_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{M_{\delta_e}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -1.24;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -1.23;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

filename = 'CM_el_vs_V.png';
saveas(gcf,filename);

% CM_q 
C_M_q_rigid(:,1)=SD.pitch(5,2,:);
C_M_q_elastic(:,1)=SD.pitch(5,4,:);

figure
plot(velocity_vector,C_M_q_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_M_q_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{M_q}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -15.4;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -16.2;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

filename = 'CM_q_vs_V.png';
saveas(gcf,filename);




%% Functions - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function SD = get_stability_derivatives(name_file_f06, subcases)

file = fopen(name_file_f06, 'r');

SD.ref_coeff    =  zeros(6,6,subcases);
SD.ra           =  zeros(6,6,subcases);
SD.la           =  zeros(6,6,subcases);
SD.anglea       =  zeros(6,6,subcases);
SD.el           =  zeros(6,6,subcases);
SD.pitch        =  zeros(6,6,subcases);
SD.urdd3        =  zeros(6,6,subcases);
SD.ru           =  zeros(6,6,subcases);
SD.lu           =  zeros(6,6,subcases);
SD.urdd5        =  zeros(6,6,subcases);
SD.sides        =  zeros(6,6,subcases);
SD.roll         =  zeros(6,6,subcases);
SD.yaw          =  zeros(6,6,subcases);
SD.urdd2        =  zeros(6,6,subcases);
SD.urdd4        =  zeros(6,6,subcases);
SD.urdd6        =  zeros(6,6,subcases);

n = 1;
while ~feof(file) && n<=subcases

        currentLine = fgetl(file);
        if length(currentLine)>30
    
            if     currentLine(1:23) == '    REF. COEFF.      CX'
                SD.ref_coeff(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    RA               CX'
                SD.ra(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    EL               CX'
                SD.el(:,:,n) = get_matrix(currentLine,file);
                
            elseif currentLine(1:23) == '    ANGLEA           CX'
                SD.anglea(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    PITCH            CX'
                SD.pitch(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD3            CX'
                SD.urdd3(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    RU               CX'
                SD.ru(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD5            CX'
                SD.urdd5(:,:,n) = get_matrix(currentLine,file);
                n = n+1;
            elseif currentLine(1:23) == '    LA               CX'
            SD.la(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    LU               CX'
            SD.lu(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    SIDES            CX'
            SD.sides(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    ROLL             CX'
            SD.roll(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    YAW              CX'
            SD.yaw(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD2            CX'
            SD.urdd2(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD4            CX'
            SD.urdd4(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD6            CX'
            SD.urdd6(:,:,n) = get_matrix(currentLine,file);
            
            end
        end

    end


fclose(file);
end


function matrix = get_matrix(currentLine,file)
    matrix = zeros(6,6);
    for j = 1:6
        for i = 1:6
        matrix(j,i) = str2double(currentLine(32+16*(i-1)+floor((i-1)/2):44+16*(i-1)+floor((i-1)/2)));
        end
        if j < 6
            currentLine = fgetl(file);
        end
    end
end