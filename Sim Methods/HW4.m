%Author: Philip Melton
%Goal: Integration and derivatives
%Date: 2/7/23
clear all;
close all;
clc;

%% Question 1
x = 0:0.1:1;
y = F1(x);
integrator(0.1,y)
%% Question 2
%% Question 3
f2=@(x)1/4.*pi.*x.^4.*cos(x.*pi/4)
ans3=integral(f2,0,2)
%% Question 4
% x alread defined
y4 = F1(x);
ans4=int(0.1,y4)
%% Question 5
x5=0:.1:1
y5=F5(x5)
Int5=integ(0.1,y5)
%% Question 6
x6 = 0:.2:.8;
f6=@(x)x.^4;
df6=@(x)4.*x.^3;
ans6=df6(x6);
df2=ans6(1,3)

%% Question 7

%% Functions
function A=integrator(h,y)
A=h*((y(1)/2)+sum(y(2:end-1))+(y(end)/2));
end
function y=F1(x)
y=exp(-x.^2);
end
function Int4 = int(h4,y)
Int4 = h4*((y(1)/2)+sum(y(2:end-1)+y(end)/2));
end
function y5 = F5(x5)
y5 = x5.^2
end
function Int5 = integ(h5,y5)
SUM = (y5(1)+y5(end));
for i=1:length(y5)
    if mod(i,2)==0
        SUM=4*y5(i)+SUM
    elseif mod(i,2)==1
        SUM=2*y5(i)+SUM
    end
    Int5 = h5/2*SUM
end
end