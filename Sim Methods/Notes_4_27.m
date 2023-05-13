clc; clear; close all;
tspan=[0 240];
% intCond=[theta thetadot]
intCond=[0.1 .1];

[t,stat]=ode45(@(t,y)JetVibeODE(t,y),tspan,intCond);

plot(t,stat(:,1))
xlabel('Time')
ylabel('Theta')
function [outputArg]=JetVibeODE(t,inputArg)
%J_A=moment of inertia of jet about point A
%k=stiffness
%m=mass
%g=gravity
%L=lengh of beam

%theta=y1 theta_dot=y1d=y2 theta_ddot=y2d
J_A=10; k=1; m=5;g=9.81;L=0.5;d=0.02;
outputArg=[inputArg(2);
    -(k/J_A)*inputArg(1)-(d/J_A)*inputArg(2)-(m*g*L/J_A)*sin(inputArg(1))];

end