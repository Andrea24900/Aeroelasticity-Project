close all; clearvars; clc;


fid = fopen('laminazione_2.f06', 'r');

N = 3;
spostamenti_verticali = zeros(N,N);
torsioni = zeros(N,N);

a = zeros(N,1);
while ~feof(fid)
    currentLine = fgetl(fid);
    if length(currentLine)>36
            if currentLine(1:26) == '         12001      G     '
                a(1) = a(1)+1;
                if a(1)<=N
                    spostamenti_verticali(1,a(1)) = str2double(currentLine(43:54));
                end
                if a(1)>=N+1
                    torsioni(1,a(1)-N) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12002      G     '
                a(2) = a(2)+1;
                if a(2)<=N
                    spostamenti_verticali(2,a(2)) = str2double(currentLine(43:54));
                end
                if a(2)>=N+1
                    torsioni(2,a(2)-N) = str2double(currentLine(103:114));
                end
            end

            if currentLine(1:26) == '         12003      G     '
                a(3) = a(3)+1;
                if a(3)<=N
                    spostamenti_verticali(3,a(3)) = str2double(currentLine(43:54));
                end
                if a(3)>=N+1
                    torsioni(3,a(3)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12004      G     '
                a(4) = a(4)+1;
                if a(4)<=N
                    spostamenti_verticali(4,a(4)) = str2double(currentLine(43:54));
                end
                if a(4)>=N+1
                    torsioni(4,a(4)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12005      G     '
                a(5) = a(5)+1;
                if a(5)<=N
                    spostamenti_verticali(5,a(5)) = str2double(currentLine(43:54));
                end
                if a(5)>=N+1
                    torsioni(5,a(5)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12006      G     '
                a(6) = a(6)+1;
                if a(6)<=N
                    spostamenti_verticali(6,a(6)) = str2double(currentLine(43:54));
                end
                if a(6)>=N+1
                    torsioni(6,a(6)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12007      G     '
                a(7) = a(7)+1;
                if a(7)<=N
                    spostamenti_verticali(7,a(7)) = str2double(currentLine(43:54));
                end
                if a(7)>=N+1
                    torsioni(7,a(7)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12008      G     '
                a(8) = a(8)+1;
                if a(8)<=N
                    spostamenti_verticali(8,a(8)) = str2double(currentLine(43:54));
                end
                if a(8)>=N+1
                    torsioni(8,a(8)-N) = str2double(currentLine(103:114));
                end
            end
            if currentLine(1:26) == '         12009      G     '
                a(9) = a(9)+1;
                if a(9)<=N
                    spostamenti_verticali(9,a(9)) = str2double(currentLine(43:54));
                end
                if a(9)>=N+1
                    torsioni(9,a(9)-N) = str2double(currentLine(103:114));
                end
            end
    end
end
fclose(fid);

fileID = fopen('GENEL_generated.dat', 'w');

% Verifica se il file è stato aperto correttamente
if fileID == -1
    error('Impossibile aprire il file per la scrittura.');
end

stringa1 = 'GENEL        100               ';

stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = '               Z';

for j = 1:N
    if j == 1
    stringa1 = [stringa1,num2str(j+1),'       3'];
    else
    stringa1 = [stringa1,'       ',num2str(j+1),'       3'];
    end

    for i = j:N
        stringa5 = [stringa5,converti(spostamenti_verticali(i,j))];
    end
end
[stringa1,righe] = vai_a_capo_nodi(stringa1);
for i = 1:righe
fprintf(fileID, '%s\n', stringa1(i,:));
end
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);

[stringa5,righe] = vai_a_capo_spostamenti(stringa5);
for i = 1:righe
    fprintf(fileID, '%s\n', stringa5(i,:));
end
fprintf(fileID, '\n\n');


stringa1 = 'GENEL        200               ';

stringa3 = '$              UD               1       1       1       2       1       3';
stringa4 = '$               1       4       1       5       1       6';
stringa5 = '               Z';


for j = 1:N
    if j == 1
    stringa1 = [stringa1,num2str(j+1),'       5'];
    else
    stringa1 = [stringa1,'       ',num2str(j+1),'       5'];
    end

    for i = j:N
        stringa5 = [stringa5,converti(torsioni(i,j))];
    end
end
[stringa1,righe] = vai_a_capo_nodi(stringa1);
for i = 1:righe
fprintf(fileID, '%s\n', stringa1(i,:));
end
fprintf(fileID, '%s\n', stringa3);
fprintf(fileID, '%s\n', stringa4);

[stringa5,righe] = vai_a_capo_spostamenti(stringa5);
for i = 1:righe
    fprintf(fileID, '%s\n', stringa5(i,:));
end



fclose(fileID);


save("spostamenti_lam2.mat","spostamenti_verticali");
save("torsioni_lam2.mat","torsioni");



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

function [stringa_out,righe] = vai_a_capo_nodi(stringa_in)
if strlength(stringa_in) <= 72
    stringa_out = stringa_in;
    righe=1;
else
    
    spazi_finali = 136-strlength(stringa_in);
     vuoto = ' ';
    for j = 1:spazi_finali-1
        vuoto = [vuoto,' '];
    end
    stringa_out = [stringa_in(1:72);'        ',stringa_in(73:end),vuoto];
    righe = 2;
end
end

function [stringa_out,righe] = vai_a_capo_spostamenti(stringa_in)
if strlength(stringa_in) <= 72
    stringa_out = stringa_in;
    righe=1;
else
    esci = 0;
    stringa_out = stringa_in(1:72);
    a = 1;
    caratteri = strlength(stringa_in)-72;
    while esci == 0
        if caratteri<=64
            vuoto = ' ';
            for j = 1:64-caratteri-1
                vuoto = [vuoto,' '];
            end
        stringa_out = [stringa_out;'        ',stringa_in(73+64*(a-1):end),vuoto];
        esci = 1;
        righe = a+1;
        else
        stringa_out = [stringa_out;'        ',stringa_in(73+64*(a-1):(72+64*a) )];
        a = a+1;
        caratteri = caratteri-64;
    end

    end
    
end
end
