%% Variable descriptions
% Q = flow rate
% F = friction factor
% L = pipe Length
% D = pipe Diameter
% Vb = 'V bar' average velocity
% dP = Pressure imbalance
% p = liquid density
% E = surface roughness
% u = dynamic viscosity
% Re = Reynolds number
%% Setting Relationships
syms Q Q1 Q2 Q3
Q = Q1+Q2+Q3;
syms Re p Vb D u
Re = p*Vb*D/u;










%% Making functions