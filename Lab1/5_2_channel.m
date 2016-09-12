function next_state = next_state(state,alpha,beta,dt)
  nch = size(state,2);
  p01 = rand(1,nch);
  alphadt = repmat(alpha,1,nch)*dt;
  betadt = repmat(beta,1,nch)*dt;
  next_state1 = (p01<alphadt) .* (state==0);
  next_state0 = (p01<betadt) .* (state==1);
  next_state = state + next_state1 - next_state0;
end

dt = 0.0001;
t  = 0.0500;

state = 0;
Vm_a = -0.080:0.010:0.080;

state_a_2 = [];

for Vm = Vm_a
  state_a_1 = [];
  for time = 0:dt:t

    % Na-m
    Na_m_alpha = Na_m_calculate_alpha(Vm);
    Na_m_beta  = Na_m_calculate_beta(Vm);
    state_m1 = next_state(state, Na_m_alpha, Na_m_beta, dt);
    state_m2 = next_state(state, Na_m_alpha, Na_m_beta, dt);
    state_m3 = next_state(state, Na_m_alpha, Na_m_beta, dt);

    % Na-h
    Na_h_alpha = Na_h_calculate_alpha(Vm);
    Na_h_beta  = Na_h_calculate_beta(Vm);
    state_h = next_state(state, Na_h_alpha, Na_h_beta, dt);
    
    % Na - m3h
    state = state_m1 * state_m2 * state_m3 * state_h;
    
    state_a_1 = [state_a_1 state];    
  end
  state_a_1
  state_a_2 = [state_a_2; state_a_1] ;
end

