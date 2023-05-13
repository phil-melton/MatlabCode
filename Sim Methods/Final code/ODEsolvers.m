clc;clear;close all;
% initial conditions
x(1) = 0; y1(1) = 0; y2(1) = 0;
% step size 
h = .2;
%% Improvd Euler method
for n = 1:50  
    x(n+1)=x(n)+h;
    k1 = h*f(x(n),y1(n));
    k2 = h*f(x(n+1),y1(n)+k1);
    y1(n+1) = y1(n)+0.5*(k1+k2);
end
%% Euler Method
for n = 1:50  
    x(n+1)=x(n)+h;
    y2(n+1) = y2(n)+h*f(x(n),y2(n));
end
plot(x,y1)
hold on
plot(x,y2)
legend('Improved Euler','Euler')
xlabel('X')
ylabel('Y')
%% dsolve
syms y(x)
Dy=diff(y)
ODEa=diff(y,x)+0.2*y==0;
ODEb=diff(y,x)==(y+x)^2;
ODEc=diff(y,x)-x*y^2==0;
ODE3=diff(y,x,2)+1/4*y==0;

% setting conditions
conda=y(0)==5;
condb=y(0)==0;
condc=y(0)==1;
cond3=[y(0)==1;
    Dy(0)==0];
% finding equations
Solna=dsolve(ODEa,conda)
Solnb=dsolve(ODEb,condb)
Solnc=dsolve(ODEc,condc)
Soln3=dsolve(ODE3,cond3)

%% define f prime
function y_prime = f(x,y)
y_prime = x+y;
end