close all; clearvars; clc;


fid = fopen('tutti_i_carichi.f06', 'r');


spostamenti_verticali = zeros(6,6);
torsioni = zeros(6,6);

a = 0; b = 0; c = 0; d = 0; e = 0; f = 0;
while ~feof(fid)
    currentLine = fgetl(fid);
    if length(currentLine)>36
            if currentLine(1:26) == '         12001      G     '
                a = a+1;
                if a<=6
                    spostamenti_verticali(1,a) = str2double(currentLine(43:54));
                end
                if a>=7
                    torsioni(1,a-6) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12002      G     '
                b = b+1;
                if b<=6
                    spostamenti_verticali(2,b) = str2double(currentLine(43:54));
                end
                if b>=7
                    torsioni(2,b-6) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12003      G     '
                c = c+1;
                if c<=6
                    spostamenti_verticali(3,c) = str2double(currentLine(43:54));
                end
                if c>=7
                    torsioni(3,c-6) = str2double(currentLine(103:114));
                end
            end
            
            if currentLine(1:26) == '         12004      G     '
                d = d+1;
                if d<=6
                    spostamenti_verticali(4,d) = str2double(currentLine(43:54));
                end
                if d>=7
                    torsioni(4,d-6) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12005      G     '
                e = e+1;
                if e<=6
                    spostamenti_verticali(5,e) = str2double(currentLine(43:54));
                end
                if e>=7
                    torsioni(5,e-6) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12006      G     '
                f = f+1;
                if f<=6
                    spostamenti_verticali(6,f) = str2double(currentLine(43:54));
                end
                if f>=7
                    torsioni(6,f-6) = str2double(currentLine(103:114));
                end
            end
    end
end

fileID = fopen('GENEL_generated.txt', 'w');

% Verifica se il file è stato aperto correttamente
if fileID == -1
    error('Impossibile aprire il file per la scrittura.');
end
stringa1 = 'GENEL        100               2       3       3       3       4       3';
stringa2 = '               5       3       6       3       7       3';
stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = ['               Z',converti(spostamenti_verticali(1,1)),converti(spostamenti_verticali(2,1)),converti(spostamenti_verticali(3,1)),...
    converti(spostamenti_verticali(4,1)),converti(spostamenti_verticali(5,1)),converti(spostamenti_verticali(6,1)),converti(spostamenti_verticali(2,2))];
stringa6 = ['        ',converti(spostamenti_verticali(3,2)),converti(spostamenti_verticali(4,2)),...
    converti(spostamenti_verticali(5,2)),converti(spostamenti_verticali(6,2)),...
    converti(spostamenti_verticali(3,3)),converti(spostamenti_verticali(4,3)),...
    converti(spostamenti_verticali(5,3)),converti(spostamenti_verticali(6,3))];
stringa7 = ['        ',converti(spostamenti_verticali(4,4)),converti(spostamenti_verticali(5,4)),...
    converti(spostamenti_verticali(6,4)),converti(spostamenti_verticali(5,5)),...
    converti(spostamenti_verticali(6,5)),converti(spostamenti_verticali(6,6))];

fprintf(fileID, '%s\n', stringa1);
fprintf(fileID, '%s\n', stringa2);
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);
fprintf(fileID, '%s\n', stringa5);
fprintf(fileID, '%s\n', stringa6);
fprintf(fileID, '%s\n\n\n', stringa7);


stringa1 = 'GENEL        200               2       5       3       5       4       5';
stringa2 = '               5       5       6       5       7       5';
stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = ['               Z',converti(torsioni(1,1)),converti(torsioni(2,1)),converti(torsioni(3,1)),...
    converti(torsioni(4,1)),converti(torsioni(5,1)),converti(torsioni(6,1)),converti(torsioni(2,2))];
stringa6 = ['        ',converti(torsioni(3,2)),converti(torsioni(4,2)),...
    converti(torsioni(5,2)),converti(torsioni(6,2)),...
    converti(torsioni(3,3)),converti(torsioni(4,3)),...
    converti(torsioni(5,3)),converti(torsioni(6,3))];
stringa7 = ['        ',converti(torsioni(4,4)),converti(torsioni(5,4)),...
    converti(torsioni(6,4)),converti(torsioni(5,5)),...
    converti(torsioni(6,5)),converti(torsioni(6,6))];


fprintf(fileID, '%s\n', stringa1);
fprintf(fileID, '%s\n', stringa2);
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);
fprintf(fileID, '%s\n', stringa5);
fprintf(fileID, '%s\n', stringa6);
fprintf(fileID, '%s\n\n\n', stringa7);

fclose(fileID);


function stringa = converti(numero)

posizione = 0;
while floor(numero) == 0
    posizione = posizione +1;
    numero = numero*10;
end

stringa_numero = num2str(numero);
for i = 1:6-length(stringa_numero)
stringa_numero = [stringa_numero,'0'];
end
stringa = [stringa_numero,'-',num2str(posizione)];
end


