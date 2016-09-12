disp('GHK-current-eqn');

R = 8.314;  %joule/K/mol
T = 293; %K
F = 96480; %coulomb/mol

z = 1;

P_K  = 4    * 10^-9;
P_Na = 0.12 * 10^-9;
P_Cl = 0.40 * 10^-9;

Cin_K  = 400 * 10^-3;
Cin_Na =  50 * 10^-3;
Cin_Cl =  40 * 10^-3;

Cout_K  =  10 * 10^-3;
Cout_Na = 460 * 10^-3;
Cout_Cl =   5 * 10^-3;

function Im = current(V, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl)
    E = z * V * F / (R * T);

    if V == 0
        I_K = P_K*z*F * (Cin_K-Cout_K);
        I_Na = P_Na*z*F * (Cin_Na-Cout_Na);
        I_Cl = P_Cl*(-z)*F * (Cin_Cl-Cout_Cl);
    else
        I_K = P_K*z*F*E * (Cin_K-Cout_K*exp(-E)) ./(1-exp(-E));
        I_Na = P_Na*z*F*E * (Cin_Na-Cout_Na*exp(-E)) ./ (1-exp(-E));
        I_Cl = P_Cl*(-z)*F*(-E) * (Cin_Cl-Cout_Cl*exp(E)) ./ (1-exp(E));
    end
    Im = (I_K + I_Na + I_Cl);
    %[V,  I_K, I_Na,  I_Cl]*1000
end

Vm_a = [-0.080 : 0.005: 0.080];
Im_a = [];

for Vm = Vm_a
    
    Im = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl);
    
    Im_a = [ Im_a Im];   
end

plot(Vm_a*1000, Im_a*1000)
title('I-V of GHK')
xlabel('V (mV)')
ylabel('I (mA)')


