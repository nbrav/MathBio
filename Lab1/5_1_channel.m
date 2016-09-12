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


%function m_inf = Na_m_calculate_m_inf(V)
%  alpha = calculate_alpha(V);
%  beta = calculate_beta(V);
%  m_inf = alpha / (alpha + beta);
%end

%function tau_m_inf = Na_m_calculate_tau_m_inf(V)
%  alpha = calculate_alpha(V);
%  beta = calculate_beta(V);
%  tau_m_inf = 1 / (alpha + beta);
%end

%v_a = -0.080:0.010:0.080;
%m_inf_a = [];
%tau_m_inf_a = [];

%for v = v_a
%  m_inf = calculate_m_inf(v);
%  m_inf_a = [m_inf_a m_inf];
%  
%  tau_m_inf = calculate_tau_m_inf(v);
%  tau_m_inf_a = [tau_m_inf_a tau_m_inf];		
%end

%hold on;
%plot(v_a, m_inf_a);
%plot(v_a, tau_m_inf_a);
%hold off;

