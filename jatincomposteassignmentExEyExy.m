% Name: Jatin Sharma
% Roll No : 23BME050

clc;
clear;
close all;

% Taking inputs from the user
EL  = input('Enter the value of Longitudinal Modulus EL (GPa): ');
ET  = input('Enter the value of Transverse Modulus ET (GPa): ');
GLT = input('Enter the value of Shear Modulus GLT (GPa): ');
VLT = input('Enter the value of Poisson Ratio VLT: ');


% Defining angle range by creating array
theta = 0:0.5:90;

% Converting degrees to radians using deg2rad function
Q = deg2rad(theta);

% Representing Trigonometric terms to store value
c = cos(Q);
s = sin(Q);

% Vectorized calculations (element wise operation)

% Ex
Ex = 1 ./ ( (c.^4)./EL + (s.^4)./ET + ((1/GLT) - (2*VLT/EL)).*(s.^2).*(c.^2) );

% Ey
Ey = 1 ./ ( (s.^4)./EL + (c.^4)./ET + ((1/GLT) - (2*VLT/EL)).*(s.^2).*(c.^2) );

% Gxy
Gxy = 1 ./ ( 4*(s.^2).*(c.^2).*((1/EL)+(1/ET)+(2*VLT/EL)) + ((c.^2 - s.^2).^2)./GLT );

% Plotting 
figure

tiledlayout(2,2)

% Ex plot
nexttile
plot(theta,Ex,'LineWidth',2)
xlabel('\theta (degrees)')
ylabel('E_x (GPa)')
title('E_x vs Fibre Orientation')
grid on

% Ey plot
nexttile
plot(theta,Ey,'LineWidth',2)
xlabel('\theta (degrees)')
ylabel('E_y (GPa)')
title('E_y vs Fibre Orientation')
grid on

% Gxy plot
nexttile
plot(theta,Gxy,'LineWidth',2)
xlabel('\theta (degrees)')
ylabel('G_{xy} (GPa)')
title('G_{xy} vs Fibre Orientation')
grid on

% Empty fourth tile
nexttile
axis off