clc; clear all; close all;

option=odeset('InitialStep',0.1);
%% 1.
clc; close all; clear;
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
%% 2.
clc; close all; clear;
tspan=0:0.2:1;
y0=[0 4];
sol2=ode45(@myODE2,tspan,y0);
plot(sol2.x,sol2.y(1,:))
title('y1')
figure()
plot(sol2.x,sol2.y(2,:))
title('y2')
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
%% 4.
clc; close all; clear;
tspan=0:0.1:.5;
y0=[2 0];
sol4=ode45(@myODE4,tspan,y0);
plot(sol4.x,sol4.y(1,:))
title('y1')
figure()
plot(sol4.x,sol4.y(2,:))
title('y2')
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
%% 6.
clc; close all; clear;
tspan=0:0.1:1;
y0=[2 2];
sol6=ode45(@myODE6,tspan,y0);
plot(sol6.x,sol6.y(1,:))
title('y1')
figure()
plot(sol6.x,sol6.y(2,:))
title('y2')
%% functions
function diffy1=myODE1(t,y)
%y(1)=y1 y(2)=y2
diffy1(1,1)=2*y(1)-4*y(2);
diffy1(2,1)=y(1)-3*y(2);
end
function diffy2=myODE2(t,y)
diffy2(1,1) = -y(1)+y(2);
diffy2(2,1)=-y(1)-y(2);
end
function diffy3=myODE3(t,y)
%y1=y(1),y2=y(2)
%diffy3=[y'1; y'2]
diffy3=[y(2);
    -(1/4)*y(1)];
end
function diffy4=myODE4(t,y)
diffy4(1,1)=-3*y(1)+y(2);
diffy4(2,1)=y(1)-3*y(2);
end
function diffy5=myODE5(x,y)
%y1=y(1),y2=y(2)
%diffy5=[y'1; y'2]
diffy5=[y(1)+x;
    y(2)];
end
function diffy6=myODE6(t,y)
diffy6=[y(1);
    -y(2)];
end