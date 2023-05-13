% Author: Philip Melton
% Goal: Demonstrate understanding 
% Date: 1/18/2023

close all;
clear all;
clc;

%% Question 1
x = 2;
y = 5;
% part a
ans_1a = (y*x^3)/(x-y)
% part b
ans_1b = (3*x)/(2*y)
% part c
ans_1c = (3/2)*x*y
% part d
ans_1d = (x^5)/(x^5-1)

%% Question 2
% part a
x = 3;
y = 6*x^3 + (4/x)
% part b
x = 7;
y = (x/4)*3
% part c
x = 9;
y = ((4*x)^2/25)
% part d
x = 4;
y = 2 * (sin(x)/5)
% part e
x = 30;
y = 7*x^(1/3) + 4*x^(0.58)

%% Question 3
a = 1.12
b = 2.34
c = 0.72
d = 0.81
f = 19.83

x = 1 + (a/b) + (c/(f^2))
s = (b-a)/(d-c)
r = 1/(a^(-1)+b^(-1)+c^(-1)+d^(-1))
y = a*b*(1/c)*((f^2)/2)

%% Question 4
% defining variables
n = 1;
V = 22.41;
T = 273.2;
R = 0.08206;
a = 6.49;
b = 0.0562;
% calculating pressure with van der Waals
P = (n*R*T)/(V-n*b)-(a*n^2)/(V^2)
% finding difference between ideal gas law and van der Waals
difference = 1-P
% removing the a and b values from the equation to see what causes more
% fluctuation
fluctuation_no_b = 1-(n*R*T)/(V-n*b)
fluctuation_no_a = 1-(n*R*T)/V-((a*n^2)/(V^2))
% removing b caused a larger fluctuation, so a causes more fluctuation

%% Question 5
% making array
x = 1:0.2:5;
y = 7*sin(4*x)
length(y)
third_value = find(y==3)
%% Question 6
% part a
ans_6a = exp((-2.1)^3)+3.47*log10(14)+287^(1/4)
% part b
ans_6b = (3.4^7)*log10(14)+287^(1/4)
% part c
ans_6c = (cos((4.12*pi)/6))^2
% part d
ans_6d = cos((4.12*pi)/6)^2

%% Question 7
% part a
ans_7a = 6*pi*atan(12.5)+4
% part b
ans_7b = 5*tan(3*asin(13/5))
% part c
ans_7c = 5*log(7)
% part d
ans_7d = 5*log10(7)

%% Question 9
disp("Energy released")
energy_released = (10^4.4)*(10^(1.5*7.6))-(10^4.4)*(10^(1.5*5.6))

%% Question 10
% declaring polynomial and then using roots function
polynomial = [13 182 -184 2503];
disp("Polynomial roots")
roots(polynomial)
%% Question 11
syms
A = 8;
W = 6;
L = (A-0.5*(W*2^(1/2)))/W
%% Question 12
% defining variables
syms c2
b1 = 180;
b2 = 165;
c1 = 115;
A1 = 120;
A2 = 100;
%finding a
a = (b1^2+c1^2-(2*b1*c1*cosd(A1)))^(1/2);
% c2^2-(2*b2*cosd(A2))+b2^2-a^2 = 0
c2 = roots([1,-2*b2*cosd(A2),b2^2-a^2])
%% Question 13
% creating A
A = [ 3 7 -4 12; -5 9 10 2; 6 13 8 11; 15 5 4 1];
% making v and w
v = A(:,2)
w = A(2,:)
%% Question 14
% making D
A = [3 -2 1; 6 8 -5; 7 9 10];
B = [6 9 -4; 7 5 3; -8 2 1];
C = [-7 -5 2; 10 6 1; 3 -9 8];
D = ones(3,3,3)
D(:,:,1)=A;
D(:,:,2)=B;
D(:,:,3)=C;
D
% finding maximums
max(max(D(:,:,1)))
max(max(D(:,:,2)))
max(max(D(:,:,3)))
max(max(D))
%% Question 15
% making data into matrix
work_data = [5 5.5 6.5 6 6.25; 40 43 37 50 45; 1000 1100 1000 1200 1100];
% a. money earned
earned = work_data(1,:).*work_data(2,:)
% b. total salary
salary = sum(earned)
% c. total widgets
widgets = sum(work_data(3,:))
% d. cost per widget
cost_per_widget = salary/widgets
% e. hours per widget
hours_per_widget = sum(work_data(2,:))./widgets
% f. efficiency
widgets_per_hour_per_worker = work_data(3,:)./work_data(2,:)
most_efficient = min(widgets_per_hour_per_worker)
least_efficient = max(widgets_per_hour_per_worker)
%% Question 16
syms w x y z c d
f = 1/sqrt(2*pi*c/x)
E = (x+w/(y+z))/(x+w/(y-z))
A = (exp((-c)/(2*x)))/(log(y)*sqrt(d*z))
S = (x*(2.15+0.35*y)^1.8)/(z*(1-x)^y)
%% Question 17
% part a
syms Ct C0 k t t_half
half_life = Ct == C0*exp(-k*t)

t = solve(half_life,t)
Ct = C0/2;
t_half = subs(t)
k = linspace(0.047,0.107);
t_half = subs(t_half)

plot(k,t_half)
xlabel('k')
ylabel('t_half')
% part b
clear all;

syms Ct a k t
Ct = (a/k)*(1-exp(-k*t))
a = 1;
t = 1;
C1 = subs(Ct)
k = linspace(0.047, 0.107) 
C1 = subs(C1)

plot(k,C1)
xlabel('k')
ylabel('C1')

%% Question 18
% creating vectors
F = [12 -5 4]; r = [-3 5 2]; n = [6 5 -7];
% using function
M(r,F,n);
%% Question 19
% creating vectors
A = [7 -3 7]; B = [-6 2 3]; C = [2 8 -8];
if cross(A,cross(B,C)) == B*(dot(A,C))-C*(dot(A,B))
    disp('Identity is verified')
else
    disp('Identity is not verified')
end
%% Question 20
% defininf functions as coefficient matrices
top = [14 -6 3 9]; bottom = [5 7 -4]
[quotient, remainder] = deconv(top,bottom)
    %% Functions
function Moment = M(R,f,N)
Moment = dot(cross(R,f),N)
end