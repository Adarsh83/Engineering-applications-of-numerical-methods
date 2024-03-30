% Define constants
R = 10;
C = 0.0001;
L = 0.01;
V0 = 10;
% Define frequencies
w1 = 0.5/sqrt(L*C);
w2 = 1/sqrt(L*C);
w3 = 2/sqrt(L*C);
% Define time interval
tspan = [0, 40*L/R];
% Define initial conditions
y0 = [0; 0];
% Define differential equation
odefun = @(t, y) [y(2); (V0/L)*cos(w1*t) - (R/L)*y(2) - (1/(L*C))*y(1)];
% Solve using ode45 for w1
[t1, y1] = ode45(odefun, tspan, y0);
% Redefine differential equation for w2
odefun = @(t, y) [y(2); (V0/L)*cos(w2*t) - (R/L)*y(2) - (1/(L*C))*y(1)];
% Solve using ode45 for w2
[t2, y2] = ode45(odefun, tspan, y0);
% Redefine differential equation for w3
odefun = @(t, y) [y(2); (V0/L)*cos(w3*t) - (R/L)*y(2) - (1/(L*C))*y(1)];
% Solve using ode45 for w3
[t3, y3] = ode45(odefun, tspan, y0);
% Plot results
plot(t1, y1(:,1), 'LineWidth', 2, 'DisplayName', 'w = 0.5/sqrt(LC)');
hold on
plot(t2, y2(:,1), 'LineWidth', 2, 'DisplayName', 'w = 1/sqrt(LC)');
plot(t3, y3(:,1), 'LineWidth', 2, 'DisplayName', 'w = 2/sqrt(LC)');
xlabel('Time');
ylabel('Current');
legend('Location', 'best');
title('Current in RLC circuit with V0 = 10V and different values of ω');
