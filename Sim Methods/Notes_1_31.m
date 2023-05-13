%% Quiz 2
syms w x y z

eq = [5*w+7*x-13*y+12*z+116==0; 57*w+13*x==2*z+528;w+3*y+9*z==142;2*x+5*y-19*z==9]
solve(eq)

v1=0:5:50
x=3

%% 2*sin(x) = x
clc;
clear all;
close all;
% Looking for intersection
f = @(x)2*sin(x)
g = @(x)x

fplot(f,[0,6])
hold on
fplot(g,[0,6])

y = @(x) 2*sin(x)-x
y_prime = @(x) 2*cos(x)-1

x = pi;
for i=1:100
    x = x-(y(x)/y_prime(x))
    % basically solves the problem 100 times and the answer approaches a
    % limit. The limit is the answer
end
y(x)

%% f(x) = x^3+x-1==0
clear all;
close all;

f=@(x)x^3+x-1
g=@(x)x^3+2*x-1
x=0.2
while abs(f(x))>1e-6
    x_old=x
    x=g(x)
    if abs(x-x_old)>1
        disp("diverging")
        break;    
    end
end
fsolve(f,0.1)

%% Interpolation
