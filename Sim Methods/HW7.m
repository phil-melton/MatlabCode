% Author :PHILIP MELTON
% Goal: solve problems
% Date: 3/27/2023
%% Question 3
% Ask the user to enter the dimensions of the matrix
m = input('Enter the number of rows in the matrix: ');
n = input('Enter the number of columns in the matrix: ');

% Initialize the matrix
A = zeros(m, n);

% Ask the user to enter each element of the matrix
for i = 1:m
    for j = 1:n
        A(i,j) = input(sprintf('Enter the element at row %d, column %d: ', i, j));
    end
end

% Calculate the maximum value of the matrix
max_val = A(1,1);
for i = 1:m
    for j = 1:n
        if A(i,j) > max_val
            max_val = A(i,j);
        end
    end
end

% Calculate the minimum value of the matrix
min_val = A(1,1);
for i = 1:m
    for j = 1:n
        if A(i,j) < min_val
            min_val = A(i,j);
        end
    end
end

% Calculate the average value of the matrix
sum_val = 0;
for i = 1:m
    for j = 1:n
        sum_val = sum_val+A(i,j);
    end
end
avg_val = sum_val/(m*n);

% Print the results
fprintf('The maximum value of the matrix is: %d\n', max_val);
fprintf('The minimum value of the matrix is: %d\n', min_val);
fprintf('The average value of the matrix is: %f\n', avg_val);
%% Question 8
clear; close all; clc;
a = input("Enter a number: ");
b = input("Enter another number: ");
if a < 0 && b < 0
 disp("Both numbers are negative.");
elseif a*b>0
 disp("Both numbers are non-negative.");
elseif a*b==0
    disp("One of the numbers is 0.")
else
 disp("At least one number is negative.");
end

%% SCARA robot
% first link
% l = length of arm; theta 1 = first angle
%x = l1*cos(theta1)+l2*cos(theta2)
%y = l1*sin(theta1)+l2*sin(theta2)
counter = 1;
for i = 0:0.01:2*pi
    for j = 0:0.01:2*pi
        sol(counter,:) = myfunc([10 i 5 j]);
        counter = counter+1;
    end
end

scatter(sol(:,1),sol(:,2))
legend('x','y')

%% Given angles
clear all; close all; clc
syms theta1 theta2
l1=10; l2=10;
eqs=[l1*cos(theta1)+l2*cos(theta2)-5;
    l1*sin(theta1)+l2*sin(theta2)-5];
J_eqs=jacobian(eqs,[theta1 theta2]);
eqs_func=matlabFunction(eqs);
J_eqs_func=matlabFunction(J_eqs);
x_old=[10 0.01];
err=norm(eqs_func(x_old(1),x_old(2)));
while err>1e-3
    x_new=x_old-inv(J_eqs_func(x_old(1),x_old(2)))*eqs_func(x_old(1),x_old(2));
    x_old=x_new;
err=norm(eqs_func(x_old(1),x_old(2)));
end
%% Linear interpolation
x = [-1.3 -.1 .2 1.3]; y=[.103 1.099 .808 1.897];
scatter(x,y)
P=polyfit(x,y,1)
yfit = P(1)*x+P(2)
hold on;
plot(x,yfit,'r-')
%% Function
function y = myfunc(x)
% x(1) = L = length of first length
% x(2) = theta 1 with respect to fixed coordinate system
x(1)=10;
y(1)=x(1)*cos(x(2))+x(3)*cos(x(4));
y(2)=x(1)*sin(x(2))+x(3)*sin(x(4));
end