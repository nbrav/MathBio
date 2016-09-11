function alpha = calculate_alpha(V)
	if V == -0.035
		alpha = 10^3;
	else
		alpha = -10^5 * (V + 0.035) / (exp(-(V+0.035)/0.010) - 1) ;
	end
end

function beta = calculate_beta(V)
	beta = 4000 * exp(-(V+0.060)/0.018); 	
end

function m_inf = calculate_m_inf(V)
	alpha = calculate_alpha(V);
	beta = calculate_beta(V);
	m_inf = alpha / (alpha + beta);
end

function tau_inf = calculate_tau_inf(V)
	alpha = calculate_alpha(V);
	beta = calculate_beta(V);
	tau_inf = 1 / (alpha + beta);
end

v_a = -0.080:0.010:0.080;
m_inf_a = [];
tau_inf_a = [];

for v = v_a
	m_inf = calculate_m_inf(v);
	m_inf_a = [m_inf_a m_inf];
	
	tau_inf = calculate_tau_inf(v);
	tau_inf_a = [tau_inf_a tau_inf];		
end

plot(v_a, tau_inf_a)
