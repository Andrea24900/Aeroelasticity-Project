clear all
%   This script creates a GENEL bulk entry for MSC NASTRAN

%   The first section is dedicated to writing input data

EID=10000; %element ID number

%   indicate number of grid points
number_grid_points=6;

%   insert UIi,CIi data points with the following synthax:

% UI1=1; %GRID point number (ex. 1)
% CI1=3; %Unconstrained DOF (ex. 3 for vertical traslation)

UI_CI_vector=[ 2, 3;
                3, 3;
                4, 3;
                5, 3;
                6, 3;
                7, 3];

%... indicate as many UI,CI couples as needed

%   insert Z flexibility matrix, lower triangular part (Z is symmetric)
%   Z=[Z11, ... ;
%      Z21,Z22,...;
%      Z31,Z32,Z33,...;
%      Z41,Z42,Z43,Z44,...;...]

%define entire Z matrix in Matlab, possibily from input data
column1=[2.829709;
7.040148;
1.125059e1;
1.546103e1;
1.967147e1;
2.388191e1];

column2=[7.040148;
2.250116e1;
3.934292e1;
5.618467e1;
7.302641e1;
8.986817e1];

column3=[1.125059e1;
3.934292e1;
7.585614e1;
1.137501e2;
1.516440e2;
1.895380e2];

column4=[1.546103e1;
5.618467e1;
1.137501e2;
1.797364e2;
2.471034e2;
3.144704e2];

column5=[1.967147e1;
7.302641e1;
1.516440e2;
2.471034e2;
3.509836e2;
4.562445e2];

column6=[2.388191e1;
8.986817e1;
1.895380e2;
3.144704e2;
4.562445e2;
6.064396e2];



Z_flexibility_matrix=[column1 column2 column3 column4 column5 column6];

Z_lower=tril(Z_flexibility_matrix);

%   Opening GENEL.bdf
filename=fopen("GENEL.DAT",'w');

%   Write field variables as indicated in BULK data entry 

%line 1
field1="GENEL";
field2=string(EID);
field3="";
field4=string(UI_CI_vector(1,1));
field5=string(UI_CI_vector(1,2));
field6=string(UI_CI_vector(2,1));
field7=string(UI_CI_vector(2,2));
field8=string(UI_CI_vector(3,1));
field9=string(UI_CI_vector(3,2));
field10="+";
line1=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line1(i)=fielder(line1(i),i);
end
fprintf(filename,'%s',line1);
fprintf(filename,'\n');

%line 2
field1="+";
field2=string(UI_CI_vector(4,1));
field3=string(UI_CI_vector(4,2));
field4=string(UI_CI_vector(5,1));
field5=string(UI_CI_vector(5,2));
field6=string(UI_CI_vector(6,1));
field7=string(UI_CI_vector(6,2));
field8="";
field9="";
field10="+";
line2=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line2(i)=fielder(line2(i),i);
end
fprintf(filename,'%s',line2);
fprintf(filename,'\n');


%line 3: introduction of Z
field1="+";
field2="Z";
field3=string(Z_lower(1,1));
field4=string(Z_lower(2,1));
field5=string(Z_lower(3,1));
field6=string(Z_lower(4,1));
field7=string(Z_lower(5,1));
field8=string(Z_lower(6,1));
field9=string(Z_lower(2,2));
field10="+";
line3=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line3(i)=fielder(line3(i),i);
end
fprintf(filename,'%s',line3);
fprintf(filename,'\n');

%line 4 
field1="+";
field2=string(Z_lower(3,2));
field3=string(Z_lower(4,2));
field4=string(Z_lower(5,2));
field5=string(Z_lower(6,2));
field6=string(Z_lower(3,3));
field7=string(Z_lower(4,3));
field8=string(Z_lower(5,3));
field9=string(Z_lower(6,3));
field10="+";
line4=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line4(i)=fielder(line4(i),i);
end
fprintf(filename,'%s',line4);
fprintf(filename,'\n');

%line 5
field1="+";
field2=string(Z_lower(4,4));
field3=string(Z_lower(5,4));
field4=string(Z_lower(6,4));
field5=string(Z_lower(5,5));
field6=string(Z_lower(6,5));
field7=string(Z_lower(6,6));
field8="";
field9="";
field10="";
line5=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line5(i)=fielder(line5(i),i);
end
fprintf(filename,'%s',line5);
fprintf(filename,'\n');

%close file
fclose('all')