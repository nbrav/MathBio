function j = flux(S,X)
  global Vf
  Km = 8e-3;
  sigma = S/Km;
  Vf = 1;
  j = Vf * sigma ./ (1 + sigma);
end

function j = new_flux(S,X)

  % calculate n
  n = 2.5;

  % calculate alpha
  Km = 8e-3;
  sigma = 0.8e-3/Km;
  alpha = 1/sigma^n;

  % calculate Kx
  Kx = 3e-6;

  %calculate Vf
  Vf = 100/180e3;

  sigma = S/Km;
  xi = X/Kx;
  j = Vf*(sigma^n)/(sigma^n + ((1+xi^n)/(1+alpha*xi^n)));

end

% calculate X
%sigma = 8e-3/Km;
Kx = 3e-6;
%1 - sigma^n
%xi = ((1 - sigma^n)/(alpha*sigma^2 - 1))^(1/n);
%X = xi * Kx;
X = 1e-6;

S_a = 0:0.001:0.050;
j_a = [];
for S = S_a
  j_a = [j_a new_flux(S,X)];
end

%plot(S_a, j_a/Vf)
