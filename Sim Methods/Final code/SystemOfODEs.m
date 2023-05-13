clc;clear;close all;
% initial conditions
% y_0 = [y(0) y_prime(0)];
y = [3; -2.5];
% step size 
h = .2;
% Improvd Euler method
% for n = 1:50  
%     x(n+1)=x(n)+h;
%     k1 = h*f(x(n),y1(n));
%     k2 = h*f(x(n+1),y1(n)+k1);
%     y1(n+1) = y1(n)+0.5*(k1+k2);
% end
% Euler Method
x(1) = 0;
for n = 1:50  
    x(n+1) = x(n)+h;
    y(1:2,n+1) = y(1:2,n)+h*f(y);
end
% % Runge-Kutta Method
% for n = 1:50
%     x(n+1)=x(n)+h;
%     k1 = h*f(x(n),y3(n));
%     k2 = h*f(x(n)+0.5*h,y3(n)+0.5*k1);
%     k3 = h*f(x(n)+0.5*h,y3(n)+0.5*k2);
%     k4 = h*f(x(n)+h,y3(n)+k3);
%     y3(n+1) = y3(n)+(1/6)*(k1+2*k2+2*k3+k4);
% end
% % Adams-Bashforth Method
% for n = 1:3
%     x(n+1)=x(n)+h;
%     k1 = h*f(x(n),y4(n));
%     k2 = h*f(x(n)+0.5*h,y4(n)+0.5*k1);
%     k3 = h*f(x(n)+0.5*h,y4(n)+0.5*k2);
%     k4 = h*f(x(n)+h,y4(n)+k3);
%     y4(n+1) = y4(n)+(1/6)*(k1+2*k2+2*k3+k4);
% end
% for n = 4:50
%     y4(n+1) = y4(n)+(h/24)*(55*f(x(n),y4(n))-59*f(x(n-1),y4(n-1))+37*f(x(n-2),y4(n-2))-9*f(x(n-3),y4(n-3)));
% end
plot(x,y(1,:))
hold on
plot(x,y(2,:))
% plot(x,y3)
% plot(x,y4)
legend('y','y_prime')
% legend('Improved Euler','Euler','RK45','Adams-Bashforth')
xlabel('X')
ylabel('Y')
% define f prime
function y_prime = f(y)
%y1 = y(1) y2 = y(2)
y_prime = [y(2);
           -2*y(2)-0.75*y(1)];
end