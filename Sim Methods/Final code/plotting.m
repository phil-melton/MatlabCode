clc;close all;clear;
figure()
x = 0:0.8:10;
y = x.^2;
% plot(x,y,'--sg')
plot(x,y,'Color','r','LineStyle',':','LineWidth',2,'Marker','*','MarkerEdgeColor','none','MarkerSize',22,'MarkerFaceColor',[0.6350 0.0780 0.1840])
yf = @(x) x^2;
hold on;
fplot(yf,[0 10],'LineWidth',1,'Color',[0.4660 0.6740 0.1880],'LineStyle','-.')
axis square
grid on
%%
figure()
subplot(1,2,1)
theta = 0:0.1:10*pi;
x = cos(theta)+0.5*rand;
y = sin(theta)+0.5*rand;
z = theta+0.5*rand;
xf = @(theta) cos(theta);
yf = @(theta) sin(theta);
zf = @(theta) theta;
% plot3(x,y,z)
scatter3(x,y,z,'Marker','+')
hold on
subplot(1,2,2)
fplot3(xf,yf,zf,[0 10*pi],'Marker','o')
%% Histogram
figure()
grade = 100*rand(32,1);
histogram(grade,[0 10 20 30 40 50 60 70 80 90 100],'FaceColor','r')
%% Polar Plot
theta = 0:0.01:2*pi;
rho = sin(theta);
polarplot(theta,rho)

%% Contour
figure()
x = -20:2.2:20;
y = -20:2.2:20;
[X,Y] = meshgrid(x,y);
Z = X.^2+Y.^2-2*X.*Y;
Zf = @(x,y)x.^2+y.^2-3;
% fcontour(Zf)
% contour3(X,Y,Z)
mesh(X,Y,Z)
colorbar

%% Vector Fields
% dy1 = -x+y;
% dy2 = -x-y;
figure()
[X,Y] = meshgrid(-10:10,-10:10);
U = -X+Y;
V = X+Y;
quiver(X,Y,U,V)