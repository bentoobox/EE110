
n = 0:50;
x = randn(1, 51);  

Xsub_e = (x + x(51-n)) / 2;  % Even component
Xsub_o = (x - x(51-n)) / 2;  % Odd component

% 2) Downsample x[n] by a factor of 2 
x_2n = x(1:2:51);

x_5n = x(1:5:51);

% 4) Compute the sum of every 5 consecutive 
x_sum = zeros(1, 47);
for i = 5:50
    x_sum(i - 4) = sum(x(i-4:i));  % Corrected indexing to sum 5 elements
end

% 5) Compute the autocorrelation of x[n]
x_conv = conv(x, fliplr(x));
x_conv = x_conv(51:101);  % Extract the relevant portion

% Plot 
figure;

subplot(3, 2, 1);
plot(n, x);
title('Original sequence x[n]');

subplot(3, 2, 2);
plot(n, Xsub_e);
title('Even component Xsub\_e[n]');

subplot(3, 2, 3);
plot(n, Xsub_o);
title('Odd component Xsub\_o[n]');

subplot(3, 2, 4);
plot(0:length(x_2n)-1, x_2n);  % Adjusted n-axis for x[2n]
title('x[2n]');

subplot(3, 2, 5);
plot(0:length(x_5n)-1, x_5n);  % Adjusted n-axis for x[5n]
title('x[5n]');

subplot(3, 2, 6);
plot(4:50, x_sum);  % Adjusted n-axis for the sum
title('Sum of 5 consecutive elements');

figure;
plot(51:101, x_conv);
title('Autocorrelation of x[n]');
