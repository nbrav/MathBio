function j = modulated_reversible_Hill2( S_1,S_2)


% fact 1
K_m = 8e-3;                                  % [mM]

% fact 2
K_x = 3e-6; 

% fact 4
n = 2.5;

% fact 5
V_f = 100/(180);                       % [mM/s] limiting rate



S_3 = 0.8e-3;                                  % [mM]
sigma = S_3/K_m; 
theta = S_2/K_x;
alpha = 1/sigma^n;


sigma = S_1/K_m;

j = V_f * sigma^n/(sigma^n +  (1+theta^n)/(1+alpha*theta^n)  );

end
