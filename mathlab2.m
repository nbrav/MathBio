J_low = [];
J_mid = [];
J_high = [];

for i = 0:0.0001:0.013
   j = reaction_rate(i,0.00000000001);   
   J_low = [J_low j];
   j = reaction_rate(i,0.000001);   
   J_mid = [J_mid j];
   j = reaction_rate(i,0.1);   
   J_high = [J_high j];
end

%{
hold on;
plot(0:0.0001:0.013,J_low);
plot(0:0.0001:0.013,J_mid);
plot(0:0.0001:0.013,J_high);
%}

%******************************************%
display(reaction_rate_2(1));

options = odeset('AbsTol', 1e-12);
bv = [1e-3 ; 1e-6];
[T1, Y1] = ode15s('system_level_low', [0 2000], bv, options);
[T2, Y2] = ode15s('system_level_high', [0 2000], bv, options);
display(T);
display(Y*1000);
hold on;
plot(T1,Y1(:,1));
plot(T1,Y1(:,2));
plot(T2,Y2(:,1));
plot(T2,Y2(:,2));
xlabel('T(s)');
ylabel('S(M)');
zoom on;
