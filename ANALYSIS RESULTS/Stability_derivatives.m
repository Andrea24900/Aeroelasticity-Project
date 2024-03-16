close all; clearvars; clc;

% name_file_f06 = 'test_long_15_definitive_cases.f06';
% name_file_f06 = 'full_long.f06';
%name_file_f06 = 'test_fusoliera.f06';
%name_file_f06 = 'lat_dir_half_model.f06'; NON VA
% name_file_f06 = 'full_coupled.f06';
name_file_f06 = 'full_ld.f06';

subcases = 6;
SD = get_stability_derivatives(name_file_f06, subcases);

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

% CZ_deltaE
C_Z_deltaE_rigid(:,1)=SD.el(3,2,:);
C_Z_deltaE_elastic(:,1)=SD.el(3,4,:);
C_Z_deltaE_plot=standard_plot(C_Z_deltaE_rigid,C_Z_deltaE_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,2,...
    -0.321,-0.300,'CZ_el_vs_V.png','$C_{Z_{\delta_e}}$');

% CZ_q
C_Z_q_rigid(:,1)=SD.pitch(3,2,:);
C_Z_q_elastic(:,1)=SD.pitch(3,4,:);
C_Z_q_plot=standard_plot(C_Z_q_rigid,C_Z_q_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,3,...
    -7.32,-7.33,'CZ_q_vs_V.png','$C_{Z_q}$');


% CM_alpha
C_M_alpha_rigid(:,1)=SD.anglea(5,2,:);
C_M_alpha_elastic(:,1)=SD.anglea(5,4,:);
C_M_alpha_plot=standard_plot(C_M_alpha_rigid,C_M_alpha_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,4,...
    -0.453,-0.463,'CM_alpha_vs_V.png','$C_{\mathcal{M}_{\alpha}}$');

% CM_deltaE
C_M_deltaE_rigid(:,1)=SD.el(5,2,:);
C_M_deltaE_elastic(:,1)=SD.el(5,4,:);
C_M_deltaE_plot=standard_plot(C_M_deltaE_rigid,C_M_deltaE_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,5,...
    -1.24,-1.23,'CM_el_vs_V.png','$C_{\mathcal{M}_{\delta_e}}$');

% CM_q 
C_M_q_rigid(:,1)=SD.pitch(5,2,:);
C_M_q_elastic(:,1)=SD.pitch(5,4,:);
C_M_q_plot=standard_plot(C_M_q_rigid,C_M_q_elastic,...
    velocity_vector,line_width,fontsize_label,fontsize_legend,6,...
    -15.4,-16.2,'CM_q_vs_V.png','$C_{\mathcal{M}_q}$');


% CY_beta
C_Y_beta_rigid(:,1)=SD.sides(2,2,:);
C_Y_beta_elastic(:,1)=SD.sides(2,4,:);
C_Y_beta_plot=standard_plot(C_Y_beta_rigid,C_Y_beta_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,7, ...
       -0.175,-0.154,'CY_beta_vs_V.png','$C_{Y_{\beta}}$');

% CY_deltaR_
C_Y_deltaR_rigid(:,1)=SD.ru(2,2,:);
C_Y_deltaR_elastic(:,1)=SD.ru(2,4,:);
C_Y_deltaR_plot=standard_plot(C_Y_deltaR_rigid,C_Y_deltaR_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,8, ...
       0.0525,0.0766,'CY_deltaR_vs_V.png','$C_{Y_{\delta_r}}$');

% CY_deltaA_right
C_Y_deltaA_rigid(:,1)=SD.ra(2,2,:);
C_Y_deltaA_elastic(:,1)=SD.ra(2,4,:);
C_Y_deltaA_plot=standard_plot(C_Y_deltaA_rigid,C_Y_deltaA_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,10, ...
       -2.12e-3,8.19e-3,'CY_deltaA_vs_V.png','$C_{Y_{\delta_a}}$');

% CY_p
C_Y_p_rigid(:,1)=SD.roll(2,2,:);
C_Y_p_elastic(:,1)=SD.roll(2,4,:);
C_Y_p_plot=standard_plot(C_Y_p_rigid,C_Y_p_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,12, ...
       0.0313,0.0323,'CY_p_vs_V.png','$C_{Y_{p}}$');

% CY_r
C_Y_r_rigid(:,1)=SD.yaw(2,2,:);
C_Y_r_elastic(:,1)=SD.yaw(2,4,:);
C_Y_r_plot=standard_plot(C_Y_r_rigid,C_Y_r_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,13, ...
       0.157,0.158,'CY_r_vs_V.png','$C_{Y_{r}}$');



% CL_beta
C_L_beta_rigid(:,1)=SD.sides(4,2,:);
C_L_beta_elastic(:,1)=SD.sides(4,4,:);
C_L_beta_plot=standard_plot(C_L_beta_rigid,C_L_beta_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,14, ...
       -1.3e-3,-6.92e-3,'CL_beta_vs_V.png','$C_{\mathcal{L}_{\beta}}$');

% CL_deltaR_
C_L_deltaR_rigid(:,1)=SD.ru(4,2,:);
C_L_deltaR_elastic(:,1)=SD.ru(4,4,:);
C_L_deltaR_plot=standard_plot(C_L_deltaR_rigid,C_L_deltaR_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,15, ...
       9.86e-4,2.54e-3,'CL_deltaR_vs_V.png','$C_{\mathcal{L}_{\delta_r}}$');

% CL_deltaA_right
C_L_deltaA_rigid(:,1)=SD.ra(4,2,:);
C_L_deltaA_elastic(:,1)=SD.ra(4,4,:);
C_L_deltaA_plot=standard_plot(C_L_deltaA_rigid,C_L_deltaA_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,16, ...
       0.147,0.127,'CL_deltaA_vs_V.png','$C_{\mathcal{L}_{\delta_a}}$');

% CL_p
C_L_p_rigid(:,1)=SD.roll(4,2,:);
C_L_p_elastic(:,1)=SD.roll(4,4,:);
C_L_p_plot=standard_plot(C_L_p_rigid,C_L_p_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,17, ...
       -0.566,-0.544,'CL_p_vs_V.png','$C_{\mathcal{L}_{p}}$');

% CL_r
C_L_r_rigid(:,1)=SD.yaw(4,2,:);
C_L_r_elastic(:,1)=SD.yaw(4,4,:);
C_L_r_plot=standard_plot(C_L_r_rigid,C_L_r_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,18, ...
       0.173,0.170,'CL_r_vs_V.png','$C_{\mathcal{L}_{r}}$');


% CN_beta
C_N_beta_rigid(:,1)=SD.sides(6,2,:);
C_N_beta_elastic(:,1)=SD.sides(6,4,:);
C_N_beta_plot=standard_plot(C_N_beta_rigid,C_N_beta_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,19, ...
       0.0769,0.0799,'CN_beta_vs_V.png','$C_{\mathcal{N}_{\beta}}$');

% CN_deltaR_
C_N_deltaR_rigid(:,1)=SD.ru(6,2,:);
C_N_deltaR_elastic(:,1)=SD.ru(6,4,:);
C_N_deltaR_plot=standard_plot(C_N_deltaR_rigid,C_N_deltaR_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,20, ...
       -0.0364,-0.0240,'CN_deltaR_vs_V.png','$C_{\mathcal{N}_{\delta_r}}$');

% CN_deltaA_right
C_N_deltaA_rigid(:,1)=SD.ra(6,2,:);
C_N_deltaA_elastic(:,1)=SD.ra(6,4,:);
C_N_deltaA_plot=standard_plot(C_N_deltaA_rigid,C_N_deltaA_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,21, ...
       9.36e-4,-5.32e-3,'CN_deltaA_vs_V.png','$C_{\mathcal{N}_{\delta_a}}$');

% CN_p
C_N_p_rigid(:,1)=SD.roll(6,2,:);
C_N_p_elastic(:,1)=SD.roll(6,4,:);
C_N_p_plot=standard_plot(C_N_p_rigid,C_N_p_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,22, ...
       -0.0978,0.0799,'CN_p_vs_V.png','$C_{\mathcal{N}_{p}}$');

% CN_r
C_N_r_rigid(:,1)=SD.yaw(6,2,:);
C_N_r_elastic(:,1)=SD.yaw(6,4,:);
C_N_r_plot=standard_plot(C_N_r_rigid,C_N_r_elastic,...
        velocity_vector,line_width,fontsize_label,fontsize_legend,23, ...
       -0.0677,-0.0780,'CN_r_vs_V.png','$C_{\mathcal{N}_{r}}$');




%%
Stability_derivative = ["CZ";"CZ";"CM";"CM"];
Software = ["XFLR5"; "Open VSP"; "XFLR5"; "Open VSP"];
alpha = [(interp1(velocity_vector,C_Z_alpha_elastic,15) - (-5.15))/(-5.15),...
         (interp1(velocity_vector,C_Z_alpha_elastic,15) - (-4.96))/(-4.96),...
         (interp1(velocity_vector,C_M_alpha_elastic,15) - (-0.453))/(-0.453),...
         (interp1(velocity_vector,C_M_alpha_elastic,15) - (-0.463))/(-0.463)]'*100;
delta_e = [(interp1(velocity_vector,C_Z_deltaE_elastic,15) - (-0.321))/(-0.321),...
         (interp1(velocity_vector,C_Z_deltaE_elastic,15) - (-0.300))/(-0.300),...
         (interp1(velocity_vector,C_M_deltaE_elastic,15) - (-1.24))/(-1.24),...
         (interp1(velocity_vector,C_M_deltaE_elastic,15) - (-1.23))/(-1.23)]'*100;
q =     [(interp1(velocity_vector,C_Z_q_elastic,15) - (-7.32))/(-7.32),...
         (interp1(velocity_vector,C_Z_q_elastic,15) - (-7.33))/(-7.33),...
         (interp1(velocity_vector,C_M_q_elastic,15) - (-15.4))/(-15.4),...
         (interp1(velocity_vector,C_M_q_elastic,15) - (-16.2))/(-16.2)]'*100;
LONG = table(Stability_derivative,Software,alpha,delta_e,q);
filename = 'confronto_con_software.xlsx';
writetable(LONG,filename,'Sheet',1,'Range','C2');


Stability_derivative = ["CY";"CY";"CL";"CL";"CN";"CN"];
Software = ["XFLR5"; "Open VSP"; "XFLR5"; "Open VSP"; "XFLR5"; "Open VSP"];
beta = [(C_Y_beta_elastic(3) - (-0.175))/(-0.175),...
         (interp1(velocity_vector,C_Y_beta_elastic,15) - (-0.154))/(-0.154),...
         (interp1(velocity_vector,C_L_beta_elastic,15) - (-1.3e-3))/(-1.3e-3),...
         (interp1(velocity_vector,C_L_beta_elastic,15) - (-6.92e-3))/(-6.92e-3),...
         (interp1(velocity_vector,C_N_beta_elastic,15) - (0.0769))/(0.0769),...
         (interp1(velocity_vector,C_N_beta_elastic,15) - (0.0799))/(0.0799)]'*100;
delta_r = [(C_Y_deltaR_elastic(3) - (0.0525))/(0.0525),...
         (interp1(velocity_vector,C_Y_deltaR_elastic,15) - (0.0766))/(0.0766),...
         (interp1(velocity_vector,C_L_deltaR_elastic,15) - (9.86e-4))/(-9.86e-4),...
         (interp1(velocity_vector,C_L_deltaR_elastic,15) - (2.54e-3))/(2.54e-3),...
         (interp1(velocity_vector,C_N_deltaR_elastic,15) - (-0.024))/(-0.024),...
         (interp1(velocity_vector,C_N_deltaR_elastic,15) - (-0.0364))/(-0.0364)]'*100;
delta_a = [(interp1(velocity_vector,C_Y_deltaA_elastic,15) - (-2.12e-3))/(-2.12e-3),...
         (interp1(velocity_vector,C_Y_deltaA_elastic,15) - (8.19e-3))/(8.19e-3),...
         (interp1(velocity_vector,C_L_deltaA_elastic,15) - (0.147))/(0.147),...
         (interp1(velocity_vector,C_L_deltaA_elastic,15) - (0.127))/(0.127),...
         (interp1(velocity_vector,C_N_deltaA_elastic,15) - (9.36e-4))/(9.36e-4),...
         (interp1(velocity_vector,C_N_deltaA_elastic,15) - (-5.32e-3))/(-5.32e-3)]'*100;
p = [(interp1(velocity_vector,C_Y_p_elastic,15) - (0.0313))/(0.0313),...
         (interp1(velocity_vector,C_Y_p_elastic,15) - (0.0323))/(0.0323),...
         (interp1(velocity_vector,C_L_p_elastic,15) - (-0.566))/(-0.566),...
         (interp1(velocity_vector,C_L_p_elastic,15) - (-0.544))/(-0.544),...
         (interp1(velocity_vector,C_N_p_elastic,15) - (-0.0978))/(-0.0978),...
         (interp1(velocity_vector,C_N_p_elastic,15) - (-0.0799))/(-0.0799)]'*100;
r = [(interp1(velocity_vector,C_Y_r_elastic,15) - (0.157))/(0.157),...
         (interp1(velocity_vector,C_Y_r_elastic,15) - (0.158))/(0.158),...
         (interp1(velocity_vector,C_L_r_elastic,15) - (0.173))/(0.173),...
         (interp1(velocity_vector,C_L_r_elastic,15) - (0.170))/(0.170),...
         (interp1(velocity_vector,C_N_r_elastic,15) - (-0.0677))/(-0.0677),...
         (interp1(velocity_vector,C_N_r_elastic,15) - (-0.0780))/(-0.0780)]'*100;

LAT_DIR = table(Stability_derivative,Software,beta,delta_r,delta_a,p,r);
writetable(LAT_DIR,filename,'Sheet',1,'Range','C9');

%% Final table of results
Stability_derivative = ["CZ";"CZ";"CM";"CM"];
alpha = [interp1(velocity_vector,C_Z_alpha_elastic,15) ,...
         interp1(velocity_vector,C_Z_alpha_elastic,15) ,...
         interp1(velocity_vector,C_M_alpha_elastic,15) ,...
         interp1(velocity_vector,C_M_alpha_elastic,15) ]';
delta_e = [interp1(velocity_vector,C_Z_deltaE_elastic,15) ,...
         interp1(velocity_vector,C_Z_deltaE_elastic,15) ,...
         interp1(velocity_vector,C_M_deltaE_elastic,15) ,...
         interp1(velocity_vector,C_M_deltaE_elastic,15)]';
q =     [interp1(velocity_vector,C_Z_q_elastic,15) ,...
         interp1(velocity_vector,C_Z_q_elastic,15) ,...
         interp1(velocity_vector,C_M_q_elastic,15) ,...
         interp1(velocity_vector,C_M_q_elastic,15) ]';
LONG = table(Stability_derivative,alpha,delta_e,q);
filename = 'tabella finale.xlsx';
writetable(LONG,filename,'Sheet',1,'Range','C2');


Stability_derivative = ["CY";"CY";"CL";"CL";"CN";"CN"];
beta = [C_Y_beta_elastic(3) ,...
         interp1(velocity_vector,C_Y_beta_elastic,15) ,...
         interp1(velocity_vector,C_L_beta_elastic,15) ,...
         interp1(velocity_vector,C_L_beta_elastic,15) ,...
         interp1(velocity_vector,C_N_beta_elastic,15) ,...
         interp1(velocity_vector,C_N_beta_elastic,15) ]';
delta_r = [(C_Y_deltaR_elastic(3)),...
         interp1(velocity_vector,C_Y_deltaR_elastic,15) ,...
         interp1(velocity_vector,C_L_deltaR_elastic,15) ,...
         interp1(velocity_vector,C_L_deltaR_elastic,15) ,...
         interp1(velocity_vector,C_N_deltaR_elastic,15) ,...
         interp1(velocity_vector,C_N_deltaR_elastic,15) ]';
delta_a = [interp1(velocity_vector,C_Y_deltaA_elastic,15) ,...
         interp1(velocity_vector,C_Y_deltaA_elastic,15) ,...
         interp1(velocity_vector,C_L_deltaA_elastic,15) ,...
         interp1(velocity_vector,C_L_deltaA_elastic,15) ,...
         interp1(velocity_vector,C_N_deltaA_elastic,15) ,...
         interp1(velocity_vector,C_N_deltaA_elastic,15)]';
p = [interp1(velocity_vector,C_Y_p_elastic,15) ,...
        interp1(velocity_vector,C_Y_p_elastic,15) ,...
         interp1(velocity_vector,C_L_p_elastic,15) ,...
         interp1(velocity_vector,C_L_p_elastic,15) ,...
         interp1(velocity_vector,C_N_p_elastic,15) ,...
         interp1(velocity_vector,C_N_p_elastic,15) ]';
r = [interp1(velocity_vector,C_Y_r_elastic,15) ,...
         interp1(velocity_vector,C_Y_r_elastic,15) ,...
         interp1(velocity_vector,C_L_r_elastic,15) ,...
         interp1(velocity_vector,C_L_r_elastic,15) ,...
         interp1(velocity_vector,C_N_r_elastic,15) ,...
         interp1(velocity_vector,C_N_r_elastic,15)]';

LAT_DIR = table(Stability_derivative,beta,delta_r,delta_a,p,r);
writetable(LAT_DIR,filename,'Sheet',1,'Range','C9');
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
                n = n+1;
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

XFLR5 = XFLR5_value;
plot(15, XFLR5,'ob','LineWidth',1,'MarkerFaceColor','b','MarkerSize',4)
text(15 +0.2, XFLR5, '$\textit{XFLR5}$','Interpreter','latex','color','b','FontSize',13)
Open_VSP = Open_VSP_value;
plot(15, Open_VSP,'or','LineWidth',1,'MarkerFaceColor','r','MarkerSize',4)
text(15 +0.2, Open_VSP, '$\textit{Open VSP}$','Interpreter','latex','color','r','FontSize',13)

legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',fontsize_legend,'location','best')

saveas(gcf,filename);
end
