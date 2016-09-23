function D = system_level_low( T,S )
    D = [((0.6e-6) - reaction_rate(S(1),S(2))) ; (reaction_rate(S(1),S(2))-reaction_rate_2(S(2)))];

end

