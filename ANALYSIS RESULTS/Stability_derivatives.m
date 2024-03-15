close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';
%name_file_f06 = 'full_long.f06';
%name_file_f06 = 'test_fusoliera.f06';

subcases = 1;
SD = get_stability_derivatives(name_file_f06, subcases);

%% PLOTS
velocity_vector=[15];

line_width = 2;
fontsize_label = 17;
fontsize_legend = 13;



% CZ_alpha
C_Z_alpha_rigid(:,1)=SD.anglea(3,2,:);
C_Z_alpha_elastic(:,1)=SD.anglea(3,4,:);

figure
plot(velocity_vector,C_Z_alpha_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_Z_alpha_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{Z_{\alpha}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -5.15;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -4.96;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

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

figure
plot(velocity_vector,C_M_alpha_rigid,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,C_M_alpha_elastic,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel('$C_{M_{\alpha}}$','Interpreter','latex','FontSize', fontsize_label)

XFLR5 = -0.453;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = -0.463;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

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
SD.anglea       =  zeros(6,6,subcases);
SD.el           =  zeros(6,6,subcases);
SD.pitch        =  zeros(6,6,subcases);
SD.urdd3        =  zeros(6,6,subcases);
SD.ru           =  zeros(6,6,subcases);
SD.urdd5        =  zeros(6,6,subcases);
while ~feof(file)
    for n = 1:subcases
        currentLine = fgetl(file);
        if length(currentLine)>30
    
            if currentLine(1:23) == '    REF. COEFF.      CX'
                scambiato = circshift(1:subcases, 0);
                SD.ref_coeff(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    RA               CX'
                scambiato = circshift(1:subcases, 1);
                SD.ra(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
    
            if currentLine(1:23) == '    ANGLEA           CX'
                scambiato = circshift(1:subcases, 2);
                SD.anglea(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    EL               CX'
                scambiato = circshift(1:subcases, 3);
                SD.el(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    PITCH            CX'
                scambiato = circshift(1:subcases, 4);
                SD.pitch(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    URDD3            CX'
                scambiato = circshift(1:subcases, 5);
                SD.urdd3(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    RU               CX'
                scambiato = circshift(1:subcases, 6);
                SD.ru(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    URDD5            CX'
                scambiato = circshift(1:subcases, 7);
                SD.urdd5(:,:,scambiato(n)) = get_matrix(currentLine,file);
            end

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

        % if j ~= 6
        currentLine = fgetl(file);
        % end
    end
end





