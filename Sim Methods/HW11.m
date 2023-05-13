%% projectile motion
clc; clear; close all;
v0=120;
theta=2;
y0=[0 v0*cosd(theta) 0 v0*sind(theta)];
sol=ode45(@myFunction,[0 20],y0);
for i=1:4
    plot(sol.x,sol.y(i,:))
    figure() 
end
%% ferry boat
clear; close all; clc;
y0=[0.01 0.01];
pos=ode45(@FCN,[0 10],y0);
plot(pos.y(1,:),pos.y(2,:))
title('x vs. y')
%% Piston
clear; close all; clc;
syms T0 x0 x S
N=1000000;
Cv=718;
k=1.380649*10^(-23);
% if T(x0)=0 then a=1
a=1;
V=@(x) S*x;
T=@(x)T0*(x0/x)^a;
p=N*k*T(x)/V(x);
dT=-N*k/Cv*T(x)*(x-x0)/x;
dQ=Cv*dT+p*diff(V,x);
%% functions
function dydt=myFunction(t,y)
    % dydt=[xdot1; xdot2; ydot1; ydot2]
    % y(1)=x1 y(2)=x2 y(3)=y1 y(4)=y2
    % m=mass; g=gravity; beta=air resistance
    m=.02;
    g=9.81;
    beta=0.016;

    dydt=[y(2);
    -(beta)/m*y(2);
    y(4);
    -g-(beta)/m*y(4)];
end

function dqdt=FCN(t,p)
    %dqdt=[dxdt; dydt]
    %p(1)=x p(2)=y
    vb= 14; %m/s
    vr=3.1; %m/s
    dqdt=[-vb*p(1)/sqrt(p(1)^2+p(2)^2);
        vr-vb*p(2)/norm(p)];
end