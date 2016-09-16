% Na-m particle
function alpha = Na_m_calculate_alpha(V)
  if V == -0.035
    alpha = 10^3;
  else
    alpha = -10^5 * (V + 0.035) / (exp(-(V+0.035)/0.010) - 1) ;
  end
end

function beta = Na_m_calculate_beta(V)
  beta = 4000 * exp(-(V+0.060)/0.018); 	
end

% Na-h particle
function alpha = Na_h_calculate_alpha(V)
    alpha = 12*exp(-V/0.020);
end

function beta = Na_h_calculate_beta(V)
  beta = 180/(exp(-(V+0.030)/0.010)+1); 	
end
