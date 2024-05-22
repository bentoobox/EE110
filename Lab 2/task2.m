clc;
clear all;
close all;

% problem a
x = rand(100,1); % create a random sequence x(n) using this command
for i = 1:1:100
    x(i+100) = 0; % padding x(n) with zeros beyond required n =99;
end
n=(0:1:99)'; % define n = 0,1,2,3 ...99
h = 0.9.^n; % define h(n)
y = conv(x, h); % find the convolution of x(n and h(n).
figure;
plot(y(1:199), '-o'); grid on;
xlabel('n'); ylabel('output of y(n)'); 
title('h[n] = 0.9 n u[n] Problem a - Task 1');

% problem b
yf(1)=0; % initialize y(-1) with 0.
for i=2:1:200
    yf(i)=0.9*yf(i-1)+x(i); % Find the convolution sum using y(n) = 0.9y(n-1)+x(n)
end
figure;
plot(yf, '-o'); grid on;
xlabel('n'); ylabel('output of y(n)'); 
title('y(n) = 0.9y(n-1) + x(n) Problem b - Task 1');
