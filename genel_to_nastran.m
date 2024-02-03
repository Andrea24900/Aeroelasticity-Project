clear all
%   This script creates a GENEL bulk entry for MSC NASTRAN

%   The first section is dedicated to writing input data

EID=10000; %element ID number

%   indicate number of grid points
number_grid_points=6;

%   insert UIi,CIi data points with the following synthax:

% UI1=1; %GRID point number (ex. 1)
% CI1=3; %Unconstrained DOF (ex. 3 for vertical traslation)

UI_CI_vector=[  1, 3; 
                2, 3;
                3, 3;
                4, 3;
                5, 3;
                6, 3];

%... indicate as many UI,CI couples as needed

%   insert Z flexibility matrix, lower triangular part (Z is symmetric)
%   Z=[Z11, ... ;
%      Z21,Z22,...;
%      Z31,Z32,Z33,...;
%      Z41,Z42,Z43,Z44,...;...]

%define entire Z matrix in Matlab, possibily from input data
column1=[1;2;3;4;5;6];
column2=[]
Z_flexibility_matrix=[1 2 3 4 5 6;
                      ]






%   Opening GENEL.bdf
filename=fopen("GENEL.bdf",'w');

%   Write field variables as indicated in BULK data entry 
field1="GENEL";
field2=string(EID);
field3="";
field4="3";
field5=string(CI);
field6="5";
field7="6";
field8="700";
field9="8";
field10="20";
line=[field1;field2;field3;field4;field5;field6;field7;field8;field9;field10];
for i=1:10
    line(i)=fielder(line(i),i);
end
fprintf(filename,'%s',line);
