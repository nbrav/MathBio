membrane_thickness = 100; % Ang

%
R = 8.314;  %joule/K/mol
T = 293.0; %K
F = 96480.0; %coulomb/mol

z = 1;

P_K  = 4e-9;
P_Na = 0.12e-9;
P_Cl = 0.40e-9;

Cin_K  = 400.0;
Cin_Na =  50.0;
Cin_Cl =  40.0;

Cout_K  =  10.0;
Cout_Na = 460.0;
Cout_Cl =   5.0;

%current 
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

%Calculate capacitance
diameter_soma = 100 * 10^-6; % m
diameter_dentrite = 1 * 10^6; % m
cm = 0.01; %F/m2
Cm = 4 * pi * (diameter_soma/2)^2 * cm;

Gm = 0.5 * 10^-8;

Vm = -0.050; 
Vm_p = Vm;
Vrest = -0.06745;

dt = 0.0001;
t =  0.050;
timeline = [dt:dt:t];

Vm_a = [Vm];
Im_a = [];

for j = 1:length(timeline)
  Im = current(Vm_a(j),z,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    
  %if time < 0.01
  %  Im = current(Vm_p,1,F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    %elseif time < 0.015
  %  Im = current(Vm_p,1,F,R,T,4.00e-9,6.00e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    %elseif time < 0.025
    %  Im = current(Vm_p,1,F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    %elseif time < 0.030
    %  Im = current(Vm_p,1,F,R,T,40.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    %else
    %  Im = current(Vm_p,1,F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    %end

  Vm = Vm_a(j) + Im*dt/cm ;

  %For plots
  Vm_a = [Vm_a Vm];
  Im_a = [Im_a Im]; 
end

plot([0,timeline], Vm_a)

