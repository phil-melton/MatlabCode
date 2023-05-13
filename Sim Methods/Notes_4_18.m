%y1'=2y1-4y2 %y2'=y1-3y2 y1(0)=3, y2(0)=0, 10 steps
%% 1.
clc; clear all; close all;

option=odeset('InitialStep',0.1);

tspan=0:0.1:1;
% y0=[3 0];
% ans=[time;y1(0);y2(0);]
ans=[0;3;0];
for i=1:10
    sol=ode45(@myODE1,tspan(i:i+1),ans(2:3,end));
    ans(:,i+1)=[sol.x(end);sol.y(1:2,end)];
end
sol1=ode45(@myODE1,[0 1],[3 0]);
plot(ans(1,:),ans(2,:))
hold on
plot(sol1.x,sol1.y(1,:))
legend('step size=0.1','Adaptive step size')
title('y1 result')
figure()
plot(ans(1,:),ans(3,:))
hold on
plot(sol1.x,sol1.y(2,:))
legend('step size=0.1','Adaptive step size')
title('y2 result')
%% 3.
clc; clear all; close all;
x(1)=0;
h=0.2;
y=[1;0];
sol3=ode45(@myODE3,[0 1],[1 0]);
for n=1:5
    x(n+1)=x(n)+h;
    y(1:2,n+1)=y(1:2,n)+h*myODE3(0,y);
end
%% 5.
clc; clear; close all;
x(1)=0;
h=0.1;
y=[1;-2];
for n=1:5
    x(n+1)=x(n)+h;
    k1=h*myODE5(x(n),y(1:2,n));
    k2=h*myODE5(x(n+1),y(1:2,n)+k1);
    y(1:2,n+1)=y(1:2,n)+h*myODE3(0,y);
end
sol5=ode45(@myODE5,[0 .5],[1 -2]);
plot(sol5.x,sol5.y(1,:))
hold on
plot(x,y(1,:))
legend('ode45','improved Euler')
title('y')
figure()
plot(sol5.x,sol5.y(2,:))
hold on
plot(x,y(2,:))
legend('ode45','improved Euler')
title("y'")
%% functions
function diffy1=myODE1(t,y)
%y(1)=y1 y(2)=y2
diffy1(1,1)=2*y(1)-4*y(2);
diffy1(2,1)=y(1)-3*y(2);
end
function diffy3=myODE3(t,y)
%y1=y(1),y2=y(2)
%diffy3=[y'1; y'2]
diffy3=[y(2);
    -(1/4)*y(1)];
end
function diffy5=myODE5(x,y)
%y1=y(1),y2=y(2)
%diffy3=[y'1; y'2]
diffy5=[y(1)+x;
    y(2)];
end