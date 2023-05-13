%% Quiz 3
% Author: Philip Melton
% Goal: show understanding
% Date: 2/7/23
syms x xmin xmax
% creating a function with 3 inputs that follows instructions
function f(x,xmin,xmax)
% outlining instructions
if x<xmin
    disp(xmin)
elseif x>xmax
    disp(xmax)
else disp(x)
end
end