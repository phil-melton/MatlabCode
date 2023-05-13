clc;clear;close all;

%% ODE45 Question 3 y''+1/4y=0,y(0)=1,y'(0)=0
q = ode45(@myF,[0 1],[1 0]);

%% Euler Method
x(1) = 0;
h = 0.01;
% initial conditions
% y_0 = [y(0) y_prime(0)];
y = [1; 0];
for n = 1:100  
    x(n+1) = x(n)+h;
    y(1:2,n+1) = y(1:2,n)+h*myF(0,y);
end
%% plot
plot(q.x,q.y(1,:))
hold on
plot(x,y(1,:),'-o')
legend('ode45','Euler Method')
title('y')
figure()
plot(q.x,q.y(2,:))
hold on
plot(x,y(2,:),'-o')
legend('ode45','Euler Method')
title('y_prime')
%% ODE45 Question 5 y''-y=x, y(0)=1, y'(0)=-2 h=0.1
solution = ode45(@myFunc,[0 1],[1 -2]);
%% Improvd Euler method
h = 0.1;
x(1) = 0;
% initial conditions
% y_0 = [y(0) y_prime(0)];
y = [1; -2];
for n = 1:10 
    x(n+1)=x(n)+h;
    k1 = h*myFunc(x(n),y(1:2,n));
    k2 = h*myFunc(x(n+1),y(1:2,n)+k1);
    y(1:2,n+1) = y(1:2,n)+0.5*(k1+k2);
end
plot(solution.x,solution.y(1,:))
hold on 
plot(x,y(1,:),'-o')
legend('ode45','Improved Euler Method')
title('y')
figure()
plot(solution.x,solution.y(2,:))
hold on 
plot(x,y(2,:),'-o')
legend('ode45','Improved Euler Method')
title('y_{prime}')
function dydx = myFunc(x,y)
%y1 y''= y(1), y2 y = y(2)
%dydx = [y'1;y'2];
dydx = [y(1)+x;
        y(2)];
end
function dydt = myF(t,y)
%y1 = y'' y(1), y2 = y y(2)
%dydt = [y'1;y'2];
dydt = [y(2);
        -(1/4)*y(1)];
end