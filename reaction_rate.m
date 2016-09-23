function j = reaction_rate( S , X )
%{
global Km
    global Kx
    global n
    global alpha
    global V
%}
    Km = 8e-3;
    Kx = 3e-6;
    n = 2.5;
    alpha = 316.2278;
    V = 1/1800;
    
    Sigma = S/Km;
    Sai = X/Kx;
    j = V*(Sigma^n) / ((Sigma^n) + ((1 + Sai^n)/(1 + alpha*(Sai^n))));

end

