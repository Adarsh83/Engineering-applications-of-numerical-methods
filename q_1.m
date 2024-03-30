data = importdata('trees.dat')
b = data;
% Calculate covariance matrix and eigenvalues/eigenvectors
C = b.' * b;
[V, D] = eig(C);
% Calculate the equation of the first line
m1 = V(2,1)/V(1,1);
x = linspace(-10, 10, 2);
y = m1 * x;
% Calculate the angle alpha1
alpha1 = atan(m1) * 180/pi;
% Calculate the equation of the second line
m2 = V(2,2)/V(1,2);
y2 = m2 * x;
% Calculate the angle alpha2
alpha2 = atan(m2) * 180/pi;
% Plot the results
scatter(b(:,1), b(:,2), 'filled');
hold on;
plot(x, y, 'r', 'LineWidth', 2);
plot(x, y2, 'g', 'LineWidth', 2);
hold off;
legend('Trees', ['Fastest Escape (Angle = ' num2str(alpha1) ')'], ['Slowest Escape (Angle = ' num2str(alpha2) ')']);
xlabel('x');
ylabel('y');
title('Forest Trees and Escape Routes');
