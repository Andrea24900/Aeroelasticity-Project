close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';

subcases = 6;
SD = get_stability_derivatives(name_file_f06, subcases);

%% PLOTS
velocity_vector=[11;13;15;17;19;22];

%CL_alpha (CL=-CZ)
C_L_alpha_rigid(:,1)=-SD.anglea(3,2,:);
plot(velocity_vector,C_L_alpha_rigid,'*-','LineWidth',2)
axis padded
grid on
hold on
C_L_alpha_elastic(:,1)=-SD.anglea(3,4,:);
plot(velocity_vector,C_L_alpha_elastic,'*-','LineWidth',2)
xlabel('$V\,[m/s]$','Interpreter','latex','FontSize',13)
ylabel('$C_{L_{\alpha}}$','Interpreter','latex','FontSize',13)
legend('\textit{Rigid}','\textit{Elastic}','interpreter','latex','fontsize',13,'location','northwest')

%

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





