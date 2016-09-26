function j = test_L2_1_simplified(S,X)

global Vf
Km = 8e-3;
sigma = S/Km;
Vf = 1;
j = Vf * sigma ./ (1 + sigma);

end

