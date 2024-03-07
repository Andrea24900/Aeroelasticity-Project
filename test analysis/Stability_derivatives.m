close all; clearvars; clc;

name_file_f06 = 'test_long_15_definitive_cases.f06';

SD = get_stability_derivatives(name_file_f06);


%% Functions - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function SD = get_stability_derivatives(name_file_f06)

file = fopen(name_file_f06, 'r');

while ~feof(file)
    currentLine = fgetl(file);
    if length(currentLine)>30

        if currentLine(1:23) == '    REF. COEFF.      CX'
            SD.cx = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    RA               CX'
            SD.ra = get_matrix(currentLine,file);
        end

        if currentLine(1:23) == '    ANGLEA           CX'
            SD.anglea = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    EL               CX'
            SD.el = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    PITCH            CX'
            SD.pitch = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    URDD3            CX'
            SD.urdd3 = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    RU               CX'
            SD.ru = get_matrix(currentLine,file);
        end
        
        if currentLine(1:23) == '    URDD5            CX'
            SD.urdd5 = get_matrix(currentLine,file);
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

        if j ~= 6
        currentLine = fgetl(file);
        end
    end
end

