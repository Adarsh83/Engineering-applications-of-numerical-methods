% Parameters
R = 10;          % resistance 
C = 0.0001;      % capacitance 
L = 0.01;        % inductance (H)
e = L/C;         % e parameter
omega = 2*pi*50; % frequency (rad/s)
Vo = 0;          % amplitude of applied voltage
% System of differential equations
f = @(t, y) [y(2); (Vo*omega/L)*cos(omega*t) - R/L*y(2) - 1/(L*C)*y(1)]*(L/e);
% Initial conditions
y0 = [1; 0];
% Time interval
tspan = [0, 40*L/R];
% Solve using ode45()
[t, y_ode45] = ode45(f, tspan, y0);
% Solve using forward Euler method
h = 0.001; % time step
N = round((tspan(2)-tspan(1))/h); % number of time steps
y_fe = zeros(N+1, 2);
y_fe(1,:) = y0;
for n = 1:N
    y_fe(n+1,:) = y_fe(n,:) + h*f(t(n), y_fe(n,:))';
end
t_fe = linspace(tspan(1), tspan(2), N+1);
% Solve using backward Euler method
y_be = zeros(N+1, 2);
y_be(1,:) = y0;
for n = 1:N
    y_be(n+1,:) = (y_be(n,:) + h*f(t(n+1), y_be(n+1,:))')/(1 + h*R/L);
end
t_be = linspace(tspan(1), tspan(2), N+1);
% Plot results
figure
subplot(2,1,1)
plot(t, y_ode45(:,1), t_fe, y_fe(:,1), t_be, y_be(:,1))
xlabel('t')
ylabel('I(t)')
legend('ode45', 'forward Euler', 'backward Euler')
title('Current vs Time')
subplot(2,1,2)
plot(t, y_ode45(:,2), t_fe, y_fe(:,2), t_be, y_be(:,2))
xlabel('t')
ylabel('I''(t)')
legend('ode45', 'forward Euler', 'backward Euler')
title('Rate of Change of Current vs Time')
