% PARAMETERS_PHYSICAL_ANTX
% 
% Script containing physical parameters of the ANT-X drone.
% This is useful to implement custom controllers.
% 
% Copyright ANT-X, 2020

%% Parameters definition

% Mass Properties
Mass    = 6.4; % [kg]
Inertia = [0.3724, 0.0004, 0.0083; ...
           0.0004, 0.7237, 0;                        
           0.0083, 0,      1.0868]; % [kg/m^2]         
        
% Reference data
RefSurfArea      = 0.5625;   % [m^2]
RefSurfAreaHTail = 0.06;     % [m^2]
RefSurfAreaVTail = 0.0173*2; % [m^2]
RefSurfAreaFus   = 0.0204 + 0.1147; % [m^2]
RefChord         = 0.25;     % [m]
RefSpan          = 2.25;     % [m]
RefAltitude      = 0;        % [m]
RefLatAndLong    = [45.5011656, 9.1550115]; % [deg]
RefPsiAngle      = 0;        % [deg]
RefDistCGWing    = [0.012; 0; 0];       % [m] AGGIORNARE
RefDistCGFus     = [0.005; 0; 0];       % [m] AGGIORNARE
RefDistCGHTail   = [-1.038; 0; 0];      % [m] AGGIORNARE
RefDistCGVTail   = [-1.038; 0; -0.087]; % [m] AGGIORNARE

% Load aerodynamic data
% AerodynamicData        = load(strcat('Data',filesep,'AerodynamicData',filesep,'AerodynamicDataComplete_Filtered.mat'));
AerodynamicData        = load(strcat('Data',filesep,'AerodynamicData',filesep,'AerodynamicDataComplete.mat'));
TabulatedCoefficients  = AerodynamicData.Coefficients;
TabulatedAirspeeds     = AerodynamicData.Airspeeds;
ViscousCDAirspeedTable = 11:0.5:22;
ViscousCDValuesTable   = [0.02370, 0.02345, 0.02322, 0.02300, 0.02279, ...
                          0.02259, 0.02240, 0.02222, 0.02205, 0.02188, ...
                          0.02172, 0.02157, 0.02143, 0.02129, 0.02115, ...
                          0.02102, 0.02090, 0.02078, 0.02066, 0.02055, ...
                          0.02044, 0.02033, 0.02023];
ZeroAoACoefficients   = [-0.0113157, 0.0000032, -0.7325419, ...
                         -0.0000005, 0.1153598, -0.0000012, ...
                          0.7325419, 0.0211261,  0.0000032, ...
                         -0.0000005, 0.1153598, -0.0000012];
                     
% Taken from https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.227.264&rep=rep1&type=pdf
CDFlatPlateWing   = 1.27; % From aspect ratio of 10 (real: 9)
CDFlatPlateHTail  = 1.22; % From aspect ratio of  (real: 7)
CDFlatPlateVTail  = 1.15; % From aspect ratio of  (real: 2)

% FWD Propulsive data
MomentArm_FWD  = 0.01;           % [m]
PropRadius_FWD = 0.0635;         % [m]
C_T_FWD        = 0.0163016;      % [-]
m_FWD          = 21.0405351;     % [rad]
q_FWD          = 533.0934756;    % [rad]
K_I_FWD        = 1.2291*10^(-9); % [A/((rad/s)^3)];
Tau_FWD        = [0.22, 1];      % [-]

% VTOL Propulsive data
PropRadius_VTOL = 0.1778/2;       % [m]
C_T_VTOL        = 0.018601;       % [-]
C_Q_VTOL        = 0.002406;       % [-]
m_VTOL          = 13.9767;        % [rad]
q_VTOL          = 605.5688;       % [rad]
AreaBlade_VTOL  = 0.002307;       % [m^2]
K_I_VTOL        = 6.4398*10^(-9); % [A/((rad/s)^3)];
Tau_VTOL        = [0.015, 1];     % [-]
a               = 2.712e-05;      % omega2throttle coeff (PlotMotorLogData)
b               = 0.000173;       % omega2throttle coeff (PlotMotorLogData)

% Lengths needed for the mixer matrix for the VTOL mode
l_f = 0.174; % [m]
l_r = 0.141; % [m]
l_1 = 0.485; % [m]
l_2 = 0.275; % [m]
l_3 = 0.210; % [m]
l_4 = 0.410; % [m]

%% PHISICAL PARAMETERS

%% Constants
%Environmental
env.gravity = 9.81;                                                         %[m*s^-2] Gravity acceleration  (serve nel position loop - acceleration feed-forward)
g=env.gravity;
env.air_density = 1.225;                                                    %[kg*m^-3] Air density

%% Parameters definition

%Mass and structural informations
drone.mass = Mass;                                                             %[kg] Body mass

%Propellers information
drone.thrust_coefficient = C_T_VTOL;                                         %[1] Thrust coefficent
drone.torque_coefficient = C_Q_VTOL;                                         %[1] Torque coefficen

drone.propeller_radius = PropRadius_VTOL;                                    %[m] Propeller radius
drone.propeller_area = pi * drone.propeller_radius^2;                         %[m^2] Disk area
drone.Kt = drone.thrust_coefficient * env.air_density * drone.propeller_area * drone.propeller_radius^2;
drone.Kq = drone.torque_coefficient * env.air_density * drone.propeller_area * drone.propeller_radius^3;
drone.sigma = drone.Kq / drone.Kt;

%% mixer matrix

K_T = drone.Kt;
K_Q = drone.Kq;

MixerMatrix = [-K_T,     -K_T,     -K_T,     -K_T,     -K_T,     -K_T,      -K_T,     -K_T; ...
               K_T*l_f,  K_T*l_f, -K_T*l_f, -K_T*l_f, -K_T*l_r, -K_T*l_r,   K_T*l_r,  K_T*l_r; ...
               K_T*l_1,  K_T*l_2,  K_T*l_1,  K_T*l_2, -K_T*l_3, -K_T*l_4,  -K_T*l_3, -K_T*l_4; ...
               -K_Q,     K_Q,     K_Q,      -K_Q,     K_Q,      -K_Q,       -K_Q,     K_Q];

T=MixerMatrix.';                               %matrice trasposta
INV=(MixerMatrix*T)\eye(size(MixerMatrix*T));
Pseudoinv=T*INV; 