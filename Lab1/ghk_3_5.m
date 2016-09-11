disp('GHK-current-eqn');

R = 8.314;  %joule/K/mmol
T = 293; %K
F = 96480; %coulomb/mol

z = 1;

P_K = 4 * 10^-9;
P_Na = 0.12 * 10^-9;
P_Cl = 0.40 * 10^-9;

Cin_K = 400;
Cin_Na = 50;
Cin_Cl = 40;

Cout_K = 10;
Cout_Na = 460;
Cout_Cl =  5;

Vm_a = [-0.080 : 0.0050: 0.080];
Im_a = [];

function Im = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl)
    E = z * Vm * F / (R * T);

    if Vm == 0
        I_K = P_K*z*F .* (Cin_K-Cout_K);
        I_Na = P_Na*z*F .* (Cin_Na-Cout_Na);
        I_Cl = P_Cl*(-z)*F .* (Cin_Cl-Cout_Cl);
    else
        I_K = P_K*z*F*E .* (Cin_K-Cout_K*exp(-E)) ./(1-exp(-E));
        I_Na = P_Na*z*F*E .* (Cin_Na-Cout_Na*exp(-E)) ./ (1-exp(-E));
        I_Cl = P_Cl*(-z)*F*(-E) .* (Cin_Cl-Cout_Cl*exp(E)) ./ (1-exp(E));
    end
    %[Vm*1000, I_K*1000, I_Na*1000, I_Cl*1000]
    Im = (I_K + I_Na + I_Cl);
end


for Vm = Vm_a
    
    E = z * Vm * F / (R * T);

    Im = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl);
    
    Im_a = [ Im_a Im];   
end

plot(Vm_a, Im_a)
title('I-V of GHK')
xlabel('V (mV)')
ylabel('I (mA)')


