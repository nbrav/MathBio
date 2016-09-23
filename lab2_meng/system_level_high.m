function D = system_level_high( T,S )
    D = [((6e-6) - reaction_rate(S(1),S(1))) ; (reaction_rate(S(1),S(1))-reaction_rate_2(S(2)))];

end
