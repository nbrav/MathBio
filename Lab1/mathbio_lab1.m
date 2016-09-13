%=====The Goldman-Hodgkin-Katz equation=====
F = 96480;  %Coulomb/mol
R = 8.314;  %Joule/Kelvin/mol
T = 293; %Kelvin

P_K = 4.00e-9; 
P_Na = 0.12e-9;
P_Cl = 0.40e-9; %permeability

Cin_K = 400;
Cin_Na = 50;
Cin_Cl = 40;
Cout_K = 10;
Cout_Na = 460;
Cout_Cl = 5;    %concentration

num = P_K*Cout_K + P_Na*Cout_Na + P_Cl*Cin_Cl;
deno = P_K*Cin_K + P_Na*Cin_Na + P_Cl*Cout_Cl;
Vrest = R*T/F*log(num/deno);
display(Vrest); 
%Vrest = -0.0674V = -67.4mV

Vrest_exchange = R*T/F*log(deno/num);
display(Vrest_exchange);
%Vrest_exchange = 0.0674V = 67.4mV

Vrest_K = R*T/F*log(Cout_K/Cin_K);
display(Vrest_K);
%Vrest_K = -0.0931V = -93.1mV

Vrest_Na = R*T/F*log(Cout_Na/Cin_Na);
display(Vrest_Na);
%Vrest_Na = 0.0560V = 56.0mV

Vm_x = -0.080:0.005:0.080;
Im_y = [];
for Vm = Vm_x
    Im = current(Vm,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
    Im_y = [Im_y Im];
end

Im_70 = current(-0.070,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
Im_0 = current(0,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
display(Im_70);
display(Im_0);
%plot(Vm_x,Im_y);
%Im_70 = -0.0088A/m2 = -8.8mA/m2
%Im_0 = 0.1444A/m2 = 144.4mA/m2




%======A spherical membrane compartment=====
S = 4*pi*(50e-6)^2;
Im_50 = -current(-0.050,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl)*S;
Gm_50 = Im_50/(-0.050 - (-0.0674));
display(Im_50);
display(Gm_50);
%Im_50 = 5.4147e-09A
%Gm_50 = 3.1119e-07

Cm = 0.01;
Vm_t = -0.050;
j = 1;
for t = 0.0001:0.0001:0.05
    Vm_tem = Vm_t(j) + 0.0001*(current(Vm_t(j),F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    Vm_t = [Vm_t Vm_tem];
    j = j + 1;
end
%display(Vm_t);
plot(0:0.0001:0.05,Vm_t);


%Im = -current(-0.050,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
%Gm = Im/(-0.050 - (-0.0674));
%display(Gm);
%{
for t = 0.0001:0.0001:0.0005
   Vm_tem = Vm_t(i) гн 0.0001*Im(i)/Cm;
   Vm_t = [Vm_t Vm_tem];
   i = i + 1;
   Im_tem =Cm*(Vm_t(i) - Vm_t(i-1))/0.0001 гл current(Vm_t(i-1),F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl);
   Im = [Im Im_tem];
end
%}
%display(Im);


%{
i = 2;
Tau = 0;
for t = 0.0001:0.0001:0.005
    Tau = [Tau -t/log(Vm_t(i))];
    i = i + 1;
end
tt = 0.000:0.0001:0.005;
%plot(tt,Tau);
%}

i = 1;
Vm_t_change = -0.050;
for t = 0.0001:0.0001:0.05
    if t < 0.01
        Vm_tem = Vm_t_change(i) + 0.0001*(current(Vm_t_change(i),F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    elseif t < 0.015
        Vm_tem = Vm_t_change(i) + 0.0001*(current(Vm_t_change(i),F,R,T,4.00e-9,6.00e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    elseif t < 0.025
        Vm_tem = Vm_t_change(i) + 0.0001*(current(Vm_t_change(i),F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    elseif t < 0.030
        Vm_tem = Vm_t_change(i) + 0.0001*(current(Vm_t_change(i),F,R,T,40.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    else
        Vm_tem = Vm_t_change(i) + 0.0001*(current(Vm_t_change(i),F,R,T,4.00e-9,0.12e-9,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl))/Cm;
    end
    Vm_t_change = [Vm_t_change Vm_tem];
    i = i + 1;
end

display(Vm_t_change);
%plot(0:0.0001:0.05,Vm_t_change);




%======Stochastic, voltage dependent ion channels======

