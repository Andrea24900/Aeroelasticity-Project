close all; clearvars; clc;


fid = fopen('tutti_i_carichi.f06', 'r');


spostamenti_verticali = zeros(3,3);
torsioni = zeros(3,3);

a = 0; b = 0; c = 0; d = 0; e = 0; f = 0;
while ~feof(fid)
    currentLine = fgetl(fid);
    if length(currentLine)>36
            if currentLine(1:26) == '         12001      G     '
                a = a+1;
                if a<=3
                    spostamenti_verticali(1,a) = str2double(currentLine(43:54));
                end
                if a>=4
                    torsioni(1,a-3) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12002      G     '
                b = b+1;
                if b<=3
                    spostamenti_verticali(2,b) = str2double(currentLine(43:54));
                end
                if b>=4
                    torsioni(2,b-3) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12003      G     '
                c = c+1;
                if c<=3
                    spostamenti_verticali(3,c) = str2double(currentLine(43:54));
                end
                if c>=4
                    torsioni(3,c-3) = str2double(currentLine(103:114));
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
stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = ['               Z',converti(spostamenti_verticali(1,1)),converti(spostamenti_verticali(2,1)),converti(spostamenti_verticali(3,1)),...
    converti(spostamenti_verticali(2,2)),converti(spostamenti_verticali(3,2)),converti(spostamenti_verticali(3,3))];


fprintf(fileID, '%s\n', stringa1);
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);
fprintf(fileID, '%s\n', stringa5);


stringa1 = 'GENEL        200               2       5       3       5       4       5';
stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = ['               Z',converti(torsioni(1,1)),converti(torsioni(2,1)),converti(torsioni(3,1)),...
    converti(torsioni(2,2)),converti(torsioni(3,2)),converti(torsioni(3,3))];


fprintf(fileID, '%s\n', stringa1);
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);
fprintf(fileID, '%s\n', stringa5);

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


