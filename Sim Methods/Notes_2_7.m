%% Question 1
x = 0:0.1:1
y = F1(x)
integrator(0.1,y)
%% Integral command
fun=@(x)exp(-x.^2);
A=integral(fun,0,1)

%% Simpson's Rule
Ar = integ(0.1,y)
%% Functions
function A=integrator(h,y)
A=h*((y(1)/2)+sum(y(2:end-1))+(y(end)/2));
end
function y=F1(x)
y=exp(-x.^2);
end
function Ar = integ(h,y)
SUM = (y(1)+y(end));
for i = 1:length(y)
    if mod(i,2)==0
        SUM=4*y(i)+SUM
    elseif mod(i,2)==1
        SUM=SUM+2*y(i);
    end
end
Ar = h/3*SUM
end