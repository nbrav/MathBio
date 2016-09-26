function j = modulated_reversible_Hill( S,X,alpha, n, V_f ,K_m, K_x)


sigma = S/K_m;
theta = X/K_x;

j = V_f * sigma^n/(sigma^n +  (1+theta^n)/(1+alpha*theta^n)  );

end

