surname = 'A'; % Replace with your own first letter of surname
% Import the data from file
data = importdata('TimeSeries.dat');
% Calculate the length of the time series
n = length(data);
% Calculate the time interval
id = [1 0 3 8 3 8 4 9 7]; % Replace with your own ID
a = id(mod(n, 3)+1);
% Calculate the first derivative using finite differences
if strcmpi('A', surname) || strcmpi('B', surname) || strcmpi('C', surname) || strcmpi('D', surname) || strcmpi('E', surname) || strcmpi('F', surname) || strcmpi('G', surname) || strcmpi('H', surname)
    % Use first-order forward differences
    s0 = diff([data; data(end)]);
elseif strcmpi('I', surname) || strcmpi('J', surname) || strcmpi('K', surname) || strcmpi('L', surname) || strcmpi('M', surname) || strcmpi('N', surname) || strcmpi('O', surname) || strcmpi('P', surname)
    % Use first-order backward differences
    s0 = diff([data(1); data]);
else
    % Use central differences
    s0 = diff([data(1); data; data(end)]) / 2;
end
% Plot the detrended data as a function of time
t = 1:n;
s_detrended = data - t' - s0;
plot(t, s_detrended);
xlabel('Time');
ylabel('Detrended Data');
% Find the maximal value of the first derivative and the corresponding value of time
[max_s0, max_idx] = max(s0);
max_time = max_idx + 1;
fprintf('Maximal first derivative: %f\n', max_s0);
fprintf('Corresponding time: %d\n', max_time);
