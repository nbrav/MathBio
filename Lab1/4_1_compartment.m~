membrane_thickness = 100; % Ang

%Calculate capacitance
diameter_soma = 100 * 10^-6; % m
diameter_dentrite = 1 * 10^6; % m
cm = 0.01; %F/m2
Cm = 4 * pi * (diameter_soma/2)^2 * cm;

Vm = -0.050; 
Vm_p = Vm;
Vrest = -0.06745;

dt = 0.0001;
t =  0.050;
Vm_a = [];
Im_a = [];

%Calculate conductance
Ii = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl); 
Gm = Ii / (Vm - Vrest);
%Gm = 0.4 * 10^-8;

for time = 0:dt:t
  Im = Cm*(Vm-Vm_p)/dt + Gm*(Vm-Vrest);

  Vm_p = Vm;
  Vm = Vm + Im*dt/Cm ;

  %For plots
  Vm_a = [Vm_a Vm];
  Im_a = [Im_a Im]; 
end

plot(0:dt:t, Vm_a)

