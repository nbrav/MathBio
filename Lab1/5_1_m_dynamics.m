function m_inf = Na_m_calculate_m_inf(V)
  alpha = Na_m_calculate_alpha(V);
  beta = Na_m_calculate_beta(V);
  m_inf = alpha / (alpha + beta);
end

function tau_m_inf = Na_m_calculate_tau_m_inf(V)
  alpha = Na_m_calculate_alpha(V);
  beta = Na_m_calculate_beta(V);
  tau_m_inf = 1 / (alpha + beta);
end

v_a = -0.080:0.010:0.080;
m_inf_a = [];
tau_m_inf_a = [];

for v = v_a
  m_inf = Na_m_calculate_m_inf(v);
  m_inf_a = [m_inf_a m_inf];
  
  tau_m_inf = Na_m_calculate_tau_m_inf(v);
  tau_m_inf_a = [tau_m_inf_a tau_m_inf];		
end

hold on;
plot(v_a, m_inf_a);
%plot(v_a, tau_m_inf_a);
hold off;

