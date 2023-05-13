%% Author: Philip Melton
%% Goal: Use interpolation to solve problems
%% Date: 2/1/2023
close all;
clear all;
clc;

%% Question 1
% defining variables
syms x
x1 = 9.5;
x0 = 9;
y0 = log(9);
y1 = log(9.5);
% defining operations
LL0 = @(x)(x-x1)/(x0-x1);
LL1 = @(x)(x-x0)/(x1-x0);
% creating function
P1 = y0*LL0(9.2)+y1*LL1(9.2)
ans1 = P1
% finding error
error1 = log(9.2)-P1

%% Question 2
%Have to make new functions
x2 = 11;
y2 = log(11);
% creating functions
L0 = @(x) ((x-x1)*(x-x2))/((x0-x1)*(x0-x2));
L1 = @(x) ((x-x0)*(x-x2))/((x1-x0)*(x1-x2));
L2 = @(x) ((x-x0)*(x-x1))/((x2-x0)*(x2-x1));
%Solving
ans2 = y0*L0(9.2)+y1*L1(9.2)+y2*L2(9.2)

%% Question 3
% redefining variables
close all;
clear all;
x0 = 0
x1 = 0.5
y0 = exp(-0)
y1 = exp(-0.5)
% using previously created linear interpolation
LL0 = @(x)(x-x1)/(x0-x1);
LL1 = @(x)(x-x0)/(x1-x0);
% answer for .25 and .75
ans25 = y0*LL0(.25)+y1*LL1(.25)
ans75 = y0*LL0(.75)+y1*LL1(.75)
error25 = exp(-.25)-ans25
error75 = exp(-.75)-ans75
% changing x0 and x1
close all;
clear all;
x0 = 0.5
x1 = 1
y0 = exp(-0.5)
y1 = exp(-1)
% using previously created linear interpolation
LL0 = @(x)(x-x1)/(x0-x1);
LL1 = @(x)(x-x0)/(x1-x0);
% answer for .25 and .75
ans25 = y0*LL0(.25)+y1*LL1(.25)
ans75 = y0*LL0(.75)+y1*LL1(.75)
error25 = exp(-.25)-ans25
error75 = exp(-.75)-ans75