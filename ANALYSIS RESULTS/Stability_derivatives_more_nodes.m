close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';

name_file_f06_more_nodes = 'half_long_more_nodes.f06';

subcases = 6;
SD = get_stability_derivatives(name_file_f06, subcases);
SD_more_nodes = get_stability_derivatives(name_file_f06_more_nodes, subcases);
%% PLOTS
velocity_vector=[11,13,15,17,19,22];
% velocity_vector=[15];

line_width = 2;
fontsize_label = 17;
fontsize_legend = 13;

%% PLOTS
% CZ_alpha
C_Z_alpha_rigid(:,1)=SD.anglea(3,2,:);
C_Z_alpha_elastic(:,1)=SD.anglea(3,4,:);
CZ_alpha_plot=standard_plot(C_Z_alpha_rigid,C_Z_alpha_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,1, ...
       -5.15,-4.96,'CZ_alpha_vs_V.png','$C_{Z_{\alpha}}$');
C_Z_alpha_rigid(:,1)=SD_more_nodes.anglea(3,2,:);
C_Z_alpha_elastic(:,1)=SD_more_nodes.anglea(3,4,:);
CZ_alpha_plot=standard_plot_nodes(C_Z_alpha_rigid,C_Z_alpha_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,1, ...
       -5.15,-4.96,'CZ_alpha_vs_V.png','$C_{Z_{\alpha}}$');
% legend('\textit{Rigid 3 nodes}','\textit{Elastic 3 nodes}',...
%     '\textit{Elastic 6 nodes}',...
%     'interpreter','latex','fontsize',fontsize_legend,'location','best')

% % CZ_deltaE
% C_Z_deltaE_rigid(:,1)=SD.el(3,2,:);
% C_Z_deltaE_elastic(:,1)=SD.el(3,4,:);
% C_Z_deltaE_plot=standard_plot(C_Z_deltaE_rigid,C_Z_deltaE_elastic,...
%     velocity_vector,line_width,fontsize_label,fontsize_legend,2,...
%     -0.321,-0.300,'CZ_el_vs_V.png','$C_{Z_{\delta_e}}$');
% 
% % CZ_q
% C_Z_q_rigid(:,1)=SD.pitch(3,2,:);
% C_Z_q_elastic(:,1)=SD.pitch(3,4,:);
% C_Z_q_plot=standard_plot(C_Z_q_rigid,C_Z_q_elastic,...
%     velocity_vector,line_width,fontsize_label,fontsize_legend,3,...
%     -7.32,-7.33,'CZ_q_vs_V.png','$C_{Z_q}$');


% CM_alpha
C_M_alpha_rigid(:,1)=SD.anglea(5,2,:);
C_M_alpha_elastic(:,1)=SD.anglea(5,4,:);
C_M_alpha_plot=standard_plot(C_M_alpha_rigid,C_M_alpha_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,2,...
    -0.453,-0.463,'CM_alpha_vs_V.png','$C_{\mathcal{M}_{\alpha}}$');


C_M_alpha_elastic(:,1)=SD_more_nodes.anglea(5,4,:);
CM_alpha_plot=standard_plot_nodes(C_M_alpha_rigid,C_M_alpha_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,2, ...
       -0.453,-0.463,'CM_alpha_vs_V.png','$C_{\mathcal{M}_{\alpha}}$');
% legend('\textit{Rigid 3 nodes}','\textit{Elastic 3 nodes}',...
%     '\textit{Elastic 6 nodes}',...
%     'interpreter','latex','fontsize',fontsize_legend,'location','best')
% % CM_deltaE
% C_M_deltaE_rigid(:,1)=SD.el(5,2,:);
% C_M_deltaE_elastic(:,1)=SD.el(5,4,:);
% C_M_deltaE_plot=standard_plot(C_M_deltaE_rigid,C_M_deltaE_elastic,...
%     velocity_vector,line_width,fontsize_label,fontsize_legend,5,...
%     -1.24,-1.23,'CM_el_vs_V.png','$C_{\mathcal{M}_{\delta_e}}$');
% 
% % CM_q 
% C_M_q_rigid(:,1)=SD.pitch(5,2,:);
% C_M_q_elastic(:,1)=SD.pitch(5,4,:);
% C_M_q_plot=standard_plot(C_M_q_rigid,C_M_q_elastic,...
%     velocity_vector,line_width,fontsize_label,fontsize_legend,6,...
%     -15.4,-16.2,'CM_q_vs_V.png','$C_{\mathcal{M}_q}$');





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
                SD.ra(:,:,n) = -get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    EL               CX'
                SD.el(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    ANGLEA           CX'
                SD.anglea(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    PITCH            CX'
                SD.pitch(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD3            CX'
                SD.urdd3(:,:,n) = get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    RU               CX'
                SD.ru(:,:,n) = -get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    URDD5            CX'
                SD.urdd5(:,:,n) = get_matrix(currentLine,file);
                n = n+1;
            elseif currentLine(1:23) == '    LA               CX'
            SD.la(:,:,n) = -get_matrix(currentLine,file);
            elseif currentLine(1:23) == '    LU               CX'
            SD.lu(:,:,n) = -get_matrix(currentLine,file);
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



function figure_label=standard_plot(rigid_derivative,elastic_derivative,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,number_figure, ...
        XFLR5_value,Open_VSP_value,filename,ylabel_text)



figure_label=figure(number_figure);

plot(velocity_vector,rigid_derivative,'*-','LineWidth', line_width)
axis padded
grid on
hold on
plot(velocity_vector,elastic_derivative,'*-','LineWidth', line_width)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize', fontsize_label)
ylabel(ylabel_text,'Interpreter','latex','FontSize', fontsize_label)

% XFLR5 = XFLR5_value;
% plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
% text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
% Open_VSP = Open_VSP_value;
% plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
% text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

%legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

saveas(gcf,filename);
end
function figure_label=standard_plot_nodes(rigid_derivative,elastic_derivative,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,number_figure, ...
        XFLR5_value,Open_VSP_value,filename,ylabel_text)



figure_label=figure(number_figure);


plot(velocity_vector,elastic_derivative,'*-','LineWidth', line_width)
% XFLR5 = XFLR5_value;
% plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
% text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
% Open_VSP = Open_VSP_value;
% plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
% text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)



legend('\textit{Rigid}','\textit{Elastic 3 nodes}','\textit{Elastic 6 nodes}',...
    'interpreter','latex','fontsize',fontsize_legend,'location','best')

saveas(gcf,filename);
end