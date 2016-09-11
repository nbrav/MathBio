disp('GHK');
R = 8.314;  %joule/K/mmol
T = 293; %K
F = 96480; %coulomb/mol


P_K = 4 * 10^-9;
P_Na = 0; %0.12 * 10^-9;
P_Cl = 0; %0.40 * 10^-9;

Cin_K = 400;
Cin_Na = 50;
Cin_Cl = 40;

Cout_K = 10;
Cout_Na = 460;
Cout_Cl =  5;

num = P_K * Cout_K +  P_Na * Cout_Na  + P_Cl * Cin_Cl ;
den = P_K * Cin_K +  P_Na * Cin_Na  + P_Cl * Cout_Cl ;

Vrest = R * T * log(num/den) / F;

disp(Vrest*1000);

% Na non-zero 56.0322
% K non-zero -93.1397