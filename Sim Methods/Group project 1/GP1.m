
function eqns = f(Q1,Q2,Q3,dP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project #1
% Philip Melton, student
% ME 2543--Simulations Methods
% Spring 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem Number: 1
% Naming variables
L1=10; L2=10; L3=10; % length in ft
D1 = 2/12; D2 = 2/12; D3 = 2/12; % diameter in ft
e1 = 0.00085; e2 = 0.00085; e3 =0.00085; % just a constant
p = 32.1740487*1.94; %density in lbm/ft^3
u = 2.05e-5; % viscosity lbf*s/ft^2
Q = 750/448.831169; % flow rate ft^3/s
syms Q1 Q2 Q3 dP
eqn1=Q1+Q2+Q3-Q;
V = @(QQ,D) QQ/(3.16145*(D^2)/4);
V1 = V(subs(Q1),D1); 
V2 = V(subs(Q2),D2); 
V3 = V(subs(Q3),D3);

Reynolds = @(p,V,D,u) p*V*D/u;
Re1 = Reynolds(p,V1,D1,u);
Re2 = Reynolds(p,V2,D2,u); 
Re3 = Reynolds(p,V3,D3,u);

if Re1<=23000
    f1 = 64/Re1;
else
    f01 = 0.25*(log10((e1/D1)/3.7+5.74/(Re1^0.9)))^-2;
    f1^(-1/2)==-2*log10((e1/D1)/3.7+2.51*(Re1*f01^(1/2)));
end
if double(Re2)<=23000
    f2 = 64/Re2;
else
    f02 = 0.25*(log10((e2/D2)/3.7+5.74/(Re2^0.9)))^-2;
    f2^(-1/2)==-2*log10((e2/D2)/3.7+2.51*(Re2*f02^(1/2)));
end
if double(Re3)<=23000
    f3 = 64/Re3;
else
    f03 = 0.25*(log10((e3/D3)/3.7+5.74/(Re3^0.9)))^-2;
    f3^(-1/2)==-2*log10((e3/D3)/3.7+2.51*(Re3*f03^(1/2)));
end

eqn2=dP/p - f1*(L1/D1)*(V1^2/2);
eqn3=dP/p - f2*(L2/D2)*(V2^2/2);
eqn4=dP/p - f3*(L3/D3)*(V3^2/2);

eqns = [eqn1 eqn2 eqn3 eqn4];
end

