clc; clear; close all;

x=0:.01:10; y=x.^2;
plot(x,y,'--g')

xf=@(theta)cos(theta);
yf=@(theta)sin(theta);
zf=@(theta)theta;
fplot3(xf,yf,zf)

%% histogram
grade=100*rand(32,1);
histogram(grade,10)

%% countour
x=-2:.02:2;
y=-2:.02:2;
[X,Y]=meshgrid(x,y);
Z=X^2+Y^2;
contourf(X,Y,Z,'ShowText','on')
%% Vector fields
clc; clear; close all;
% dy1=-x+y;
% dy2=-x-y;

[X,Y]=meshgrid(-10:10,-10:10);
U=-X+Y;
V=-X-Y;
quiver(X,Y,U,V)
