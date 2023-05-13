f=@(x)x.^2.5+x==7
diff=@(x)2.*x+1==0
x=0:1:10
i=1;
while i<11
x(i+1)=x(i)-f(x(i))/diff(i)
    i=i+1
end
