function j = reaction_rate_2( S )
    Km = 10e-6;
    V = 60e-10;
    Sigma = S/Km;
    j = V*Sigma / (Sigma + 1);

end

