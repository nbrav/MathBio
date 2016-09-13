function Im = current(V,F,R,T,P_K,P_Na,P_Cl,Cin_K,Cin_Na,Cin_Cl,Cout_K,Cout_Na,Cout_Cl)
    Xi_K = 1*V*F/(R*T);
    Xi_Na = 1*V*F/(R*T);
    Xi_Cl = -1*V*F/(R*T);
    if V == 0
        I_K = P_K*1*F*(Cin_K - Cout_K);
        I_Na = P_Na*1*F*(Cin_Na - Cout_Na);
        I_Cl = P_Cl*(-1)*F*(Cin_Cl - Cout_Cl);
    else 
        I_K = P_K*1*F*Xi_K*((Cin_K - Cout_K*exp(-Xi_K))/1 - exp(-Xi_K));
        I_Na = P_Na*1*F*Xi_Na*((Cin_Na - Cout_Na*exp(-Xi_Na))/1 - exp(-Xi_Na));
        I_Cl = P_Cl*(-1)*F*Xi_Cl*((Cin_Cl - Cout_Cl*exp(-Xi_Cl))/1 - exp(-Xi_Cl));
    end
    Im = I_K + I_Na + I_Cl;
end
