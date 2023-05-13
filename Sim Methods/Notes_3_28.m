%% Exam 2: 1 debugging, 2 Least squares, 1 code development

clc; clear all; close all; 

F=[1 2 4 6 10 20];
s=[.3 .7 1.3 1.9 3.2 6.3];
p=polyfit(F,s,1);

scatter(F,s,'o')
xlabel('force'); ylabel('elongation')
y=@(x) p(1)*x+p(2);
hold on;
fplot(y,[0 25])

%% example 2
s=[140 220 310 410];
t=[9 10 11 12];

scatter(t,s)
xlabel('time')
ylabel('distance')

p=polyfit(t,s,1);
y1=@(x) p(1)*x+p(2);
hold on;
fplot(y1)

curveFitter(t,s)

% Use comments on exam