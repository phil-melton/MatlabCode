%% Author: Philip Melton
%% Goal: solve functions for HW 2
%% Date: 1/28/2023

clear all;
close all;
clc
%% Question 1
% seeing where intersection is
y1 = @(x)sin(x)
y2 = @(x)exp(-x)
fplot(y1,[0,10])
hold on
fplot(y2,[0,10])

y = @(x) sin(x)-exp(-x)
% solving function up to x==1 because smallest positive value will be shown
fsolve(y,1)
%% Question 2
clear all;
close all;
% Finding answer
poly = [1 0 0 -1 -0.12]
roots(poly)
% using iteration
f = @(x) x^4-x-0.12
g = @(x)x^4 -0.12
% guess
    x = 1;
while abs(f(x))>1e-6
    x_old = x
    x = g(x)
    if abs(x-x_old)>1
        disp("diverging")
        break;    
    end
end
fsolve(f,1)
fplot(f,[-1,2])

%% Question 3
% creating function
h = @(x) 7^(1/3)-x
% using fsolve to find answer
fsolve(h,2)

%% Question 4
clear all;
close all;
x = optimvar('x',2)
% making equations
eq1 = x(1)+2*x(2)-2 == 0
eq2 = (x(1))^2+4*(x(2))^2-4 == 0
% putting equations into problem
prob = eqnproblem;
prob.Equations.eq1 = eq1;
prob.Equations.eq2 = eq2;
% used to check problem
show(prob);

x0.x = [0 0];
% solving equation
[sol, fval, exitflag] = solve(prob,x0)
disp(sol.x)

%% Question 5
clear all;
close all;
x = optimvar('x',3)
% making equations
eq1 = (x(1))^2+2*(x(2))^2-x(2)-2*x(3) == 0
eq2 = (x(1))^2-8*(x(2))^2+10*x(3) == 0
eq3 = (x(1))^2 - 7*x(2)*x(3) == 0
% putting equations into problem
prob = eqnproblem;
prob.Equations.eq1 = eq1;
prob.Equations.eq2 = eq2;
prob.Equations.eq3 = eq3;
% checking if the equations are right
show(prob)

x0.x = [1 1 0];
% solving equation
% used [0 0 0] but the answer was just 0s
[sol, fval, exitflag] = solve(prob,x0)
disp(sol.x)

%% Question 6
clear all;
close all;
x = optimvar('x',3)
% making equations
% x(1) = u; x(2) = v; x(3) = w
eq1 = (x(1)-1)^2+(x(2)-1)^2+(x(3))^2 == 1
eq2 =  (x(1)-1)^2+(x(2))^2+(x(3)-1)^2== 1
eq3 = (x(1))^2-(x(2)-1)^2+(x(3)-1)^2 == 1
% putting equations into problem
prob = eqnproblem;
prob.Equations.eq1 = eq1;
prob.Equations.eq2 = eq2;
prob.Equations.eq3 = eq3;
% checking if the equations are right
show(prob);

x0.x = [1 1 0];
% solving equation
[sol, fval, exitflag] = solve(prob,x0)
disp(sol.x)

%% Test
clear all;
close all;
syms u v w
eq = [(u-1)^2+(v-1)^2+w^2==1;(u-1)^2+(v)^2+(w-1)^2==1;(u)^2+(v-1)^2+(w-1)^2==1];

