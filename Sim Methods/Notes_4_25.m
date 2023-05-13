clc; clear; close all;
c=[1e6 1.380649e-23 718];
sol=ode45(@GasCompODE,[0 20], [.1 .0001 300])
function [output]=GasCompODE(t,y,const)
%output(1)=TPrime, output(2)=y1Prime=xPrime
%output=[Tdot;y1dot;y2dot]
output=[-(const(1)*const(2))/const(3)*y(2);
    y(2);
    0];
end