close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';

subcases = 6;
SD = get_stability_derivatives(name_file_f06, subcases);


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
                scambia = [1 2 3 4 5 6];
                SD.ref_coeff(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    RA               CX'
                scambia = [6 1 2 3 4 5];
                SD.ra(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
    
            if currentLine(1:23) == '    ANGLEA           CX'
                scambia = [5 6 1 2 3 4];
                SD.anglea(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    EL               CX'
                scambia = [4 5 6 1 2 3];
                SD.el(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    PITCH            CX'
                scambia = [3 4 5 6 1 2];
                SD.pitch(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    URDD3            CX'
                scambia = [2 3 4 5 6 1];
                SD.urdd3(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    RU               CX'
                scambia = [1 2 3 4 5 6];
                SD.ru(:,:,scambia(n)) = get_matrix(currentLine,file);
            end
            
            if currentLine(1:23) == '    URDD5            CX'
                scambia = [6 1 2 3 4 5];
                SD.urdd5(:,:,scambia(n)) = get_matrix(currentLine,file);
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

