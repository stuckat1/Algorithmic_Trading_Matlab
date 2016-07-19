%% Load data

importfile('BundDaily.xls')

%% Develop an exponential moving average indiciator
[lead,lag] = movavg(Close, 5,20,'e');
s = zeros(size(Close));
s(lead<=lag) = -1;
s(lead>lag)= 1;
r = [0; s(1:end-1).* diff(Close)];
w=cumsum(r);