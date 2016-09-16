clear all;
source('5_alpha_beta.m')

function next_state = next_state(state,alpha,beta,dt)
  nch = size(state,2);
  p01 = rand(1,nch);
  alphadt = repmat(alpha,1,nch)*dt;
  betadt = repmat(beta,1,nch)*dt;
  next_state1 = (p01<alphadt) .* (state==0);
  next_state0 = (p01<betadt) .* (state==1);
  next_state = state + next_state1 - next_state0;
end

function freq = calc_freq(A,time)
  freq = sum(A)/time;
end

dt = 0.0001;
t  = 0.0500;
Vm_a = -0.080:0.010:0.080;
freq_a = [];

% For Na channel with m3h particles
state_m3 = [0, 0, 0];
state_h = [0];

hold all;
for Vm = Vm_a
  state_a = [];
  for time = dt:dt:t

    % Na-m
    Na_m_alpha = Na_m_calculate_alpha(Vm);
    Na_m_beta  = Na_m_calculate_beta(Vm);
    state_m3 = next_state(state_m3, Na_m_alpha, Na_m_beta, dt);

    % Na-h
    Na_h_alpha = Na_h_calculate_alpha(Vm);
    Na_h_beta  = Na_h_calculate_beta(Vm);
    state_h = next_state(state_h, Na_h_alpha, Na_h_beta, dt);
    
    % Na - m3h
    state = prod(state_m3) * state_h;
    
    state_a = [state_a state];    
  end
  freq_a = [freq_a calc_freq(state_a, 1)];
end
plot(Vm_a, freq_a)
