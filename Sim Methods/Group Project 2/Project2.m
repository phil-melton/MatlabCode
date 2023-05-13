% Project 2
% t=theta
syms P(theta) T(theta) V(theta) M(theta) x(theta) Wout(theta)
gam=1.4;
R=.287; % kJ/kg/K
r=8.4; %unitless
P1=101.3; %Kpa
l= .12; %m
S=.08; %m
V0=50*100^(-3); %m^3
b = .09; %m
T1= 300; %K
thetas=3*pi/2; %rad
thetab=pi; %rad
qin=2.8e6; %J/kg
Tw=300; %K
E=S/2/l; %unitless
%% 1.
hbar=0; %W/(m^2K)
C=0;%s^-1
V1=volume(pi);
M0=P1*V1/R/T1; %kg
%% test
V=@(t) (V0*(1+(r-1)/E*(1+E*(1-cos(t))-sqrt(1-E^2*(sin(t))^2))));
Vp=diff(V,t);
dVdt=matlabFunction(Vp);

%% functions
function V=volume(t)
    V0=50*100^(-3); %m^3
    r=8.4; %unitless
    S=.08; %m
    l=.12; %m
    E=S/2/l; %unitles;
    V=(V0*(1+(r-1)/E*(1+E*(1-cos(t))-sqrt(1-E^2*(sin(t))^2))));
end

