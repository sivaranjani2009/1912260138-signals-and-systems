clc; clear; close all; 
% Experiment 10: Zero-input, zero-state, impulse response and convolution 
% System: dy(t)/dt + 2y(t) = x(t) 
num = 1; 
den = [1 2]; 
sys = tf(num, den); 
disp('Transfer function:'); 
sys; 
disp('Pole:'); 
disp(pole(sys)); 
t = 0:0.01:5; 
dt = t(2) - t(1); 
h = exp(-2*t);                 % Impulse response for t >= 0 
x_step = ones(size(t));     
% Impulse response 
figure; 
impulse(sys, t); 
grid on; 
   % Unit-step input 
title('Impulse Response h(t)'); 
xlabel('Time (s)'); ylabel('h(t)'); 
% Zero-input response: y(0-) = 1, x(t) = 0 
y_zi = exp(-2*t); 
figure; 
plot(t, y_zi, 'LineWidth', 1.5); 
grid on; 
title('Zero-Input Response'); 
xlabel('Time (s)'); ylabel('y_{zi}(t)'); 
% Zero-state response to unit step, with zero initial conditions 
[y_zs, tout] = step(sys, t); 
y_zs = squeeze(y_zs); 
figure; 
plot(tout, y_zs, 'LineWidth', 1.5); 
grid on; 
title('Zero-State Response to Unit Step'); 
xlabel('Time (s)'); ylabel('y_{zs}(t)'); 
% Numerical convolution approximation: 
% y_zs(t) = integral from 0 to t of x(tau)h(t-tau) d(tau) 
y_conv_full = conv(x_step, h) * dt; 
y_conv = y_conv_full(1:length(t)); 
% Trapezoidal endpoint correction for the sampled convolution integral 
y_conv = y_conv - 0.5*dt*(x_step(1)*h + x_step.*h(1)); 
% Total response for y(0-) = 1 and x(t) = u(t) 
y_total = y_zi + y_zs(:).'; 
figure; 
plot(t, y_zi, t, y_zs(:).', t, y_total, 'LineWidth', 1.3); 
grid on; 
legend('Zero-input', 'Zero-state', 'Total response', 'Location', 'best'); 
title('Comparison of Response Components'); 
xlabel('Time (s)'); ylabel('Response'); 
% Compare convolution result with MATLAB lsim zero-state response 
y_lsim = lsim(sys, x_step, t); 
figure; 
plot(t, y_conv, '--', t, y_lsim(:).', '-'); 
grid on; 
legend('Convolution approximation', 'lsim zero-state response', ... 
'Location', 'best'); 
title('Convolution Verification'); 
xlabel('Time (s)'); ylabel('y_{zs}(t)');