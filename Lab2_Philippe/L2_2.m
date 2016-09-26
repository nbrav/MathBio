clear all
close all

%% set up ODE solver with first parameters

bv = [1e-3; 1e-6;0;0;0];              % [M] initial concentrations
finish = 2000;                  % [s] simulation time
options = odeset('AbsTol', 1e-12);
[T, Y] = ode15s(@lab_2_DGL, [0 finish], bv, options);


%% plot results
figure
hold on
grid on
plot(T,Y(:,2))
plot(T,Y(:,1))
legend('F6B','FBP')
xlabel('Time [s]')
ylabel('Concentration [M]')
title('Influx of 0.6e-6 M/s F6B')


% 
% figure
% hold on
% grid on
% plot(T,Y(:,3))
% plot(T,Y(:,4))
% plot(T,Y(:,5))
% legend('J1', 'J2', 'J3')



%% set up ODE solver with second parameters

bv = [1e-3; 1e-6;0;0;0];         % [M] initial concentrations
finish = 2000;                  % [s] simulation time
options = odeset('AbsTol', 1e-12);
[T, Y] = ode15s(@lab_2_DGL2, [0 finish], bv, options);


%% plot results
figure
hold on
grid on
plot(T,Y(:,2))
plot(T,Y(:,1))
legend('F6B','FBP')
xlabel('Time [s]')
ylabel('Concentration [M]')
title('Influx of 6e-6 M/s F6B')

% figure
% hold on
% grid on
% plot(T,Y(:,3))
% plot(T,Y(:,4))
% plot(T,Y(:,5))
% legend('J1', 'J2', 'J3')