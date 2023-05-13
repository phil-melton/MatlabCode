% 1/19/23
%% Matrices
A = [2 1 3; 5 8 4];
size(A)
B = [3 4 8; 9 10 15];
% gives maximum value in A
max(max(A))
%% Adding and multiplying
A+B
A*transpose(B)
%% standard matrices
zeros(3)
eye(3)
ones(3)
%% inverse
D = [1 2 3; 4 5 6; 7 8 9]
C = inv(D)
%% Multiplying by scalar
A.*2
% . makes it easier
%%
% creating function
y = @(x)x^2;
y(2)
syms x

%% creating array
x = 1:0.2:25
length(x)
%% conditional statements
d = 75
if d>90
    disp("A")
elseif d>80
    disp("B")
else
    display("retake the course")
end
%% Farenheit to Celsius

T = 20
if T>30
    disp("too hot")
elseif T>=20
    disp("nice temperature")
else
    disp("cold")
end
function C = TempConversion(F)
% Converst Farenheit to Celsius
C = (5/9)*(F-32)
end