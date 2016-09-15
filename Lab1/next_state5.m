function next_state = next_state5(state,alpha,beta,dt)
    nch = size(state,2);
    p01 = rand(1,nch);
    alphadt = repmat(alpha,1,nch)*dt;
    betadt = repmat(beta,1,nch)*dt;
    next_state1 = (p01<alphadt) .* (state==0);
    next_state0 = (p01<betadt) .* (state==1);
    next_state = state + next_state1 - next_state0;
end

