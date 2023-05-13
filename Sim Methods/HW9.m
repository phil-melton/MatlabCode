% Author: Philip Melton
% Goal: Show understanding
% Date: 4/3/2023
%% Friction function
clc; clear all; close all;
% under frict.m
Re=1e3;
frict(Re)
%% wind chill factor
clc; clear all; close all;
Tw=@(Ta,V) 13.2+0.6215.*Ta-11.37.*V.^0.16+0.3965.*Ta.*V.^0.16;

Temps=0:5:40; Velos=0:5:40;
% each column is for each different temperature, the rows are for
% velocities
for i=1:length(Temps)
    for j=1:length(Velos)
    Chill(i,j)=Tw(Temps(i),Velos(j));
    end
end
%% falling object
t=0:.01:15; y0=78;
y=grav(y0,t);
plot(t,y)
ylabel('height (m)'); xlabel('time (s)')
%% diff eq
clc; clear all; close all;
syms y(x)
ODEa=diff(y,x)+0.2*y==0;
ODEb=diff(y,x)==(y+x)^2;
ODEc=diff(y,x)-x*y^2==0;
% setting conditions
conda=y(0)==5;
condb=y(0)==0;
condc=y(0)==1;
% finding equations
Solna=dsolve(ODEa,conda)
Solnb=dsolve(ODEb,condb)
Solnc=dsolve(ODEc,condc)

function y=grav(y0,t)
y=y0-0.5*9.81*t.^2;
end
