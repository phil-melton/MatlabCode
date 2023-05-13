x = 0:1:10;
norm(x);
while norm(x)>4
    x=sqrt(x);
end
disp(x)
norm(x)
f=@(y)0.2+25.*y+3.*y.^2;
integral(f,0,1)