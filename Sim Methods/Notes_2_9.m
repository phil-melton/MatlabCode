%% Numeric Differentiation
y = @(x)sin(x);
fplot(y,[-2*pi 2*pi])
dy=@(x)cos(x)
hold on
fplot(dy,[-2*pi 2*pi])
legend('y','dy')
x1 = -2*pi:0.01:2*pi;
y1 = sin(x1);
%% Section
for i=1:length(x1)-1
dyf(i)=forwardDiff(y1(i:i+1),x1(i:i+1));
end
for i=1:length(x1)-1
dyb(i)=backwardDiff(y1(i:i+1),x1(i:i+1));
end
plot(x1,dyf)
plot(x1,dyb)
%% Functions
% forward difference
function dy = forwardDiff(y,x)
dy=(y(2)-y(1))/(x(2)-x(1))
end
function dy = backwardDiff(y,x)
dy=(y(1)-y(2))/(x(1)-x(2))
end