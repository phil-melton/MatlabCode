%Program Newton-Raphson
% Solves for the root of a vector function f(x) using an initialguess
% xinit using the Newton-Raphson method. Requires being ableto evaluate
% f(x) and the Jacobian J(x) = [df1/dx1, df1/dx2, ...; df2/dx1,...].
% The function f and the variable x are vectors of length N.
%
% Contains functions:
% >myf vector function f(x)
% >myJ matrix function J(x)
%
% Newton's method in N variables:
% (f(x) - 0) ~= J * (x - xroot)
% => xnew = xold - inv(J)*f(xold)
% Iterate until converged: ||xnew - xold|| / ||xnew|| <= tol
clear; clc; close all
%Define initial guess, x0
xnew = [10; 0.01]; %initial guess in meters
%Define tolerance (convergence criterion)
tol = 1e-8; %Converged when x changes by less than 10^-6percent
%Initialise iteration counter
niter = 0;
%Define relerr (to begin the loop it should be GREATER THAN tol, then in the
%loop it will be updated!CLASS ID #:ME 2543: SIM Methods for Mech. Eng. Exam #01 SPRING 2023
relerr = 1e-3; 
while (relerr > tol) %Loop until the residual error is <= thetolerance
 niter = niter + 1; %Keep track of number of iterations

 xold = xnew; %Store the existing value in xold

 %Evaluate f(xold) and J(xold)
 fold = myf(xold);
 J = myJ(xold);

 %Get updated estimate
 xnew = xold - J\fold;

 %Calculate relative error in convergence (estimated by theL2 norm of
 % the change in x over the L2 norm of x)
 relerr = norm(xnew - xold) / norm(xnew);

% %Debugging messages
% fprintf('Iter %6i: xnew = [%10.2e; %10.2e], f = [%10.2e;
%10.2e]\n',...
% niter,xnew,fold)
% %End debugging messages
end
%Print results to the screen
fprintf('Newton-Raphson example\n') %\n jumps to the next
line
fprintf('Solution converged in %i iterations.\n',niter)
fprintf('Root found:\n')
disp(xnew)
res = myf(xnew); %Calculate residual
fprintf('Function (residual):\n')
disp(res)
y=@myf;
fsolve(y,[10 0.01])
L = 19.3001;
D = 0.0495;
%===========================================================
function [f] = myf(x)
%Function myf(x)CLASS ID #:ME 2543: SIM Methods for Mech. Eng. Exam #01 SPRING 2023
% Returns the vector f to solve for pipe dimensions x = [L; D]
%
% Problem statement: Find pipe dimensions x = [L; D] such that:
% 913 kPa will cause glycerin at 20 deg C to flow at 4.67 L/s
% Darcy-Weisbach equation, laminar flow:
% (0.2854 N-m)*L/D^4 - 913000 Pa = 0
% The surface area of the pipe is 3 m^2
% pi*L*D - 3 m^2 = 0
f = [0.2835 * x(1) / (x(2)^4) - 913000;
 pi*x(1)*x(2) - 3];
end %function myf
%===========================================================
function [J] = myJ(x)
%Function myJ(x)
% Returns the Jacobian associated with the function myf(x)
% x(1)=L and x(2)=D
%Pre-allocation not necessary, but saves time and avoids warningmessages
J = zeros(2,2); %Pre-allocate memory for 2x2 matrix
J(1,1) = 0.2854 / (x(2)^4); %df1/dx1
J(1,2) = -4*0.2854*x(1) / (x(2)^5); %df1/dx2
J(2,1) = pi*x(2); %df2/dx1
J(2,2) = pi*x(1); %df2/dx2
end %function myJ
%= = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
%DEBUGGING TOOLS:
% F12 or click on "-" Set/clear breakpoint
% Code will pause at these locations
% F10 or Step Run next line
% F11 or Step In Jump into function code
% Ctrl+C Stop execution
% Useful for stopping infinite loops
% Hover over variable name Show current value of variable 