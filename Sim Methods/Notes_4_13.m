% please just write code instead of doing so much board work in class
clc; clear all; close all;
syms y(x)
ODEa=diff(y,x)+0.2*y==0;
ODEb=diff(y,x)==(y+x)^2;
ODEc=diff(y,x)-x*y^2==0;
% setting conditions
conda=y(0)==5;
condb=y(0)==0;
condc=y(0)==1;
% finding equations
Solna=dsolve(ODEa,conda)
Solnb=dsolve(ODEb,condb)
Solnc=dsolve(ODEc,condc)
%% ODE45

tspan=[0 10];
y0=[.35502805 -.2588194];
sol=ode45(@myODE,tspan,y0);
plot(sol.x,sol.y(1,:))
hold on;
plot(sol.x,sol.y(2,:))
legend('y values', 'y prime values')
%% Class example
clc;clear;close all;
% initial conditions
%initial condition is [y(0) y'(0)]
y_0=[3 -2.5];
% step size 
h = .2;
% Improvd Euler method
% for n = 1:50  
%     x1(n+1)=x1(n)+h;
%     x2(n+1)=x2(n)+h;
%     k1 = h*f(x1(n),y1(n));
%     k2 = h*f(x1(n+1),y1(n)+k1);
%     k3 = h*f(x2(n),y2(n));
%     k4 = h*f(x2(n+1),y2(n)+k4);
%     y1(n+1) = y1(n)+0.5*(k1+k2);
%     y2(n+1) = y2(n)+0.5*(k3+k4);
% end
% Euler Method
x(1)=0;
for n = 1:50  
    x(n+1)=x(n)+h;
    y(1:2,n+1)=y(1:2,n)+h*f(y);
end
plot(x,y1)
hold on
plot(x,y2)
legend('Improved Euler','Euler')
xlabel('X')
ylabel('Y')
% define f prime
function y_prime = f(y)
%y1=y(1) %y2=y(2)
y_prime = [y(2);
    -2*y(2)-0.75*y(1)];
end
function dy=myODE(t,y)
%y_prime=y1'=y2 and y_Dprime=y2'
%dy(1)=y1' dy(2)=y2'
dy=[y(2);t*y(1)];
end
