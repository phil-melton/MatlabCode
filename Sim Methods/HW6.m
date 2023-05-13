% Author :PHILIP MELTON
% Goal: solve problems
% Date: 2/28/2023
clear all;
close all;
clc;
%% Question 1
T=0:0.2:10;
S = [6 1.21 -3.48 -7.96 -12.17 -16 -19.34 -22.11 -24.2 -25.5 -26 -25.5 -23.95 -21.24 -17.2 -12 -5.26 3 12.91 24.54 38 53.37 70.76 90.27 111.9 136 162.41 191.3 222.8 257.02 294 333.8 376.6 422.5 471.6 524 579.6 638.84 701.55 767.9 838 911.9 989.8 1071.71 1157.74 1248 1342.57 1441.56 1545.07 1653.18 1766];
V= diff(S)./diff(T);
syms t
y=2*t^3-24*t+6;
dy =diff(y,t);
f = matlabFunction(dy);
fplot(f,[0 10])
hold on
plot(T(1:50),V)
% v = 72 after 4 seconds
A=diff(V(1:50))./diff(T(1:50));
ddy = diff(dy,t);
g = matlabFunction(ddy);
fplot(g,[0 10]);
hold on
plot(T(1:49),A)
legend('analytical V','numerical V','analytical A','numerical A')
%% Question 2
clear all;
close all;
clc;

T=0:0.005:0.165;
V=[8 7.733 7.547 7.339 7.142 6.956 6.779 6.661 6.451 6.299 6.153 6.015 5.882 5.755 5.633 5.517 5.405 5.298 5.194 5.095 5 4.907 4.819 4.733 4.651 4.571 4.494 4.419 4.147 4.278 4.210 4.145 4.081 4.020];
length(V);
for i=1:1:(length(V))
    S(i)=trapz(T(1:i),V(1:i));
end
plot(S,T)
hold on 
plot(T,V)
legend('distance s', 'velocity v')
%% Question 3
%% Question 4
clear; close all; clc;
A = [1 2.3 -9 8.32 -10.7];
B = randi(11,[1 5]);
% Adding two vectors A and B
C = A+B;
D = 10*rand([1 5]);
% multiplying vector C and D element by element
E = C.*D;
%% Question 5
clear; close all; clc;
% Prompt user for input array
input_str = input("Enter a space-separated list of numbers: ", 's');
input_array = str2num(input_str);
% Bubble sort algorithm
n = length(input_array);
for i = 1:n
 for j = 1:n
 if input_array(j) > input_array(i)
 temp = input_array(j);
 input_array(j) = input_array(i);
 input_array(i) = temp;
 end
 end
end
% Display sorted array
disp("Sorted array:");
disp(input_array);
%% Question 6
clear; close all; clc;
n = input("Enter the number of Fibonacci terms: ");
fibonacci = zeros(1, n);
fibonacci(1) = 0;
fibonacci(2) = 1;
for i = 3:n
 fibonacci(i) = fibonacci(i-1)+fibonacci(i-2);
end
disp("The first " + n + " Fibonacci terms are:");
disp(fibonacci);
%% Question 7
clear; close all; clc;
a = -5;
b = 20;
if a + b == 15
 disp("The sum of a and b is 15.");
else
 disp("The sum of a and b is not 15.");
end
%% Question 8
clear; close all; clc;
a = input("Enter a number: ");
b = input("Enter another number: ");
if a < 0 && b < 0
 disp("Both numbers are negative.");
elseif a >= 0 && b >= 0
 disp("Both numbers are non-negative.");
else
 disp("At least one number is negative.");
end