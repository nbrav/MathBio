disp('GHK');
R = 8.314;  %joule/K/mmol
T = 293; %K
F = 96480; %coulomb/mol


P_K = 4 * 10^-9;
P_Na = 0.12 * 10^-9;
P_Cl = 0.40 * 10^-9;

Cout_K = 400;
Cout_Na = 50;
Cout_Cl = 40;

Cin_K = 10;
Cin_Na = 460;
Cin_Cl =  5;

num = P_K * Cout_K +  P_Na * Cout_Na  + P_Cl * Cin_Cl ;
den = P_K * Cin_K +  P_Na * Cin_Na  + P_Cl * Cout_Cl ;

Vrest = R * T * log(num/den) / F;

disp(Vrest*1000);

%GHK
%   67.4500