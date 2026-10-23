clc; clear; close all; 
% Continuous-Time LTI System: dy(t)/dt + 2y(t) = x(t) 
% Assume zero initial conditions: H(s) = Y(s)/X(s) = 1/(s + 2) 
num = 1; 
den = [1 2]; 
sys = tf(num, den); 
disp('Transfer function:'); 
sys; 
disp('Pole:'); 
disp(pole(sys)); 
disp('Zeros:'); 
disp(zero(sys)); 
t = 0:0.01:5; 
figure; 
impulse(sys, t); 
grid on; 
title('Impulse Response'); 
xlabel('Time (s)'); 
ylabel('h(t)'); 
figure; 
step(sys, t); 
grid on; 
title('Step Response'); 
xlabel('Time (s)'); 
ylabel('y(t)'); 
% Response to x(t) = sin(2t)u(t) 
x = sin(2*t); 
figure; 
lsim(sys, x, t); 
grid on; 
title('Response to sin(2t)u(t)'); 
xlabel('Time (s)'); 
ylabel('y(t)'); 
