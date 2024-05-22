% Generate random sequence x[n]
n = 0:50;
x = randn(1,51);  % Using randn for normally distributed random numbers

% 1) Even and odd components:
Xsub_e = (x + x(51-n))/2;
Xsub_o = (x - x(51-n))/2;

% 2) x[2n]
x_2n = x(1:2:51);

% 3) x[5n]
x_5n = x(1:5:51);

% 4) Sum of 5 consecutive elements
x_sum = zeros(1,47);
for i = 5:50
    x_sum(i - 4) = sum(x(i-4:i));  % Corrected indexing
end

% 5) Convolution of x[n] with itself (autocorrelation)
x_conv = conv(x, fliplr(x));
x_conv = x_conv(51:101);  % Extract relevant portion

% Plot everything together
figure;
subplot(3,2,1);
plot(n, x);
title('Original sequence x[n]');

subplot(3,2,2);
plot(n, Xsub_e);
title('Even component Xsub_e[n]');

subplot(3,2,3);
plot(n, Xsub_o);
title('Odd component Xsub_o[n]');

subplot(3,2,4);
plot(1:length(x_2n), x_2n);  % Adjusted n-axis for x[2n]
title('x[2n]');

subplot(3,2,5);
plot(1:length(x_5n), x_5n);  % Adjusted n-axis for x[5n]
title('x[5n]');

subplot(3,2,6);
plot(4:50, x_sum);  % Adjusted n-axis for sum
title('Sum of 5 consecutive elements');

figure;
plot(51:101, x_conv);
title('Autocorrelation of x[n]');
