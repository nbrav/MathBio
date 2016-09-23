clear all;
source('flux.m');

function Q = func(S)
  S1 = S(1);
  S2 = S(2);
  X = 1e-6;

  % calculate j3
  Vf = 60e-6;
  KmP = 10e-6;
  j3 = Vf*S2/(S2+KmP);

  N = [ 1,-1, 0;
        0, 1,-1];

  j = [0.6e-6; flux(S1,S2);  j3];
  
  Q = N*j;
end

tspan = [0:2000];
S0 = [1e-3;1e-6];
y = lsode('func',S0,tspan);

plot(tspan,y(:,1),'r');
plot(tspan,y(:,2),'k');
