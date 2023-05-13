% Author: Philip Melton
% Goal: Show understanding
% Date: 4/3/2023

% I know I didn't really follow the instructions. 
% I got to a point in my work where I just wanted to see if I could make
% anything work.
%% 8.1
clc; clear all; close all;
A=[11 4 2; 2 -7 3; 5 10 11]; b=[50; 4; 41];
x=inv(A)*b;
%% 8.2
clear all; close all; clc
mA = input('Enter the number of rows in the matrix A: ');
nA= input('Enter the number of columns in the matrix A: ');
A = zeros(mA, nA);

% Ask the user to enter each element of the matrix
for iA = 1:mA
    for jA = 1:nA
        A(iA,jA) = input(sprintf('Enter the element at row %d, column %d: ', iA, jA));
    end
end

mb = input('Enter the number of rows in the matrix b: ');
nb = input('Enter the number of columns in the matrix b: ');
b = zeros(mb, nb);

% Ask the user to enter each element of the matrix
for ib = 1:mb
    for jb = 1:nb
        b(ib,jb) = input(sprintf('Enter the element at row %d, column %d: ', ib, jb));
    end
end

x=inv(A)*b
%x =
%
%  -16.5473
%  18.2737
%   16.5473
%  -26.5473
%    6.5473
%    5.0000
%  -23.2737
%   10.0000
%  -14.3304
%  -20.1556
% answer from inputting the truss matrix
%% 8.3
syms T1 T2 T3 T4 T5 T6 T7 R1 R2 R3
f1=input('Enter the value of f1 in KN: ');
f2=input('Enter the value of f2 in KN: ');
statics=[0.5*T1+T2-f1==0;
    0.866*T1+.433*f1+.5*f2==0;
    -.5*T1+.5*T3+T4+f1==0;
    0.866*T1+.866*T3==0;
    -T2-.5*T3+.5*T5+T6==0;
    .866*T3+.866*T5-f2==0;
    -T4-0.5*T5+0.5*T7==0;
    R1-T2-T1*cos(pi/3)==0;
    R2-T1*sin(pi/3)==0;
    R3-T7*sin(pi/3)==0;];

answersvpa=vpasolve(statics)
answerslin=linsolve(statics)
answersf=fsolve(statics,[1 1 1 1 1 1 1 1 1 1])
% linsolve doesnt work
% fsolve doesnt work
% vpasolve works great

%% 8.4
% Define the matrix and the right-hand side vector
clc; clear all; close all;
A = [-3 2 0 0 0; 1 -3 1 0 0; 0 1 -3 1 0; 0 0 1 -3 1; 0 0 0 2 3];
b = [1;1;1;1;2];
x0=[1;1;1;1;1];
itermax=20;
mat=zeros(5,6);
for i=1:5
    for j=1:5
    mat(i,j)=A(i,j);
    end
end
mat(1:5,6)=b(1:5)
GS=rref(mat);
x=GS(1:end,end);
