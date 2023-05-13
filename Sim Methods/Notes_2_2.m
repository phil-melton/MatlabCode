%% Interpolation
x1 = 9.5
x0 = 9
y0 = log(9)
y1 = log(9.5)

L0 = @(x)(x-x1)/(x0-x1)
L1 = @(x)(x-x0)/(x1-x0)

P1 = y0*L0(9.4)+y1*L1(9.4)

error=log(9.4)-P1
%% interpolation function
clear all;
close all;
clc

x = [9 9.5 11]
y = [log(9) log(9.5) log(11)]
interp1(x,y,[9.2 9.4],'spline')