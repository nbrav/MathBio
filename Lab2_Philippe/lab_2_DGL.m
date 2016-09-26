function S = lab_2_DGL( t, S )

% influx J1
j_1 = 0.6e-6;                      % F6P influx

% intermediate flux J2

j_2 = modulated_reversible_Hill2( S(1),S(2) );


% eflux J3
V_f = 60e-6;                       % limiting rate outflux
K_m = 10e-6;                       % Michaelsi Menten constant adolase-FBP

j_3 = V_f * S(2)/(S(2) + K_m);


S = [j_1 - j_2; j_2-j_3; j_1;j_2;j_3];


end

