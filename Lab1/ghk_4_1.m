membrane_thickness = 100; % Ang

%Calculate capacitance
diameter_soma = 100 * 10^-6; % m
cm = 0.01; %F/m2
Cm = 4 * exp(1) * (diameter_soma/2)^2 * cm;

Vm = -0.050; 
Vm_p = Vm;
Vrest = -0.06745;

%Calculate conductance
%Im = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl)/1000; %A
%Gm = Im / (Vm - Vrest)
%[Gm Im Vm Vrest] %WHY WRONG? TODO
Gm = 0.5 * 10^-8;

dt = 0.0001;
t =  0.50;
Vm_a = [];
Im_a = [];

for time = 0:dt:t
     %Im = current(Vm, z, R, T, F, P_K, P_Na, P_Cl, Cin_K, Cin_Na, Cin_Cl, Cout_K, Cout_Na, Cout_Cl);
    
     Im = Cm*(Vm-Vm_p)/dt + Gm*(Vm-Vrest);
     %[time*1000, Im, Vm]
     Vm_p = Vm;
     Vm = Vm - Im*dt/Cm ;
     Vm_a = [Vm_a Vm];
     Im_a = [Im_a Im]; 
end

plot(0:dt:t, Vm_a)

