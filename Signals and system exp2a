% Experiment 2(i): Amplitude and Time Scaling 
clc; clear; close all; 
t = -1:0.001:1; 
x = sin(2*pi*5*t); 
yA = 2*x; 
yC = sin(2*pi*5*(2*t)); 
yE = sin(2*pi*5*(t/2)); 
figure; 
subplot(2,2,1); plot(t,x); grid on; 
title('Original x(t)'); xlabel('Time (s)'); ylabel('Amplitude'); 
subplot(2,2,2); plot(t,yA); grid on; 
title('Amplitude Scaling: 2x(t)'); xlabel('Time (s)'); ylabel('Amplitude'); 
subplot(2,2,3); plot(t,yC); grid on; 
title('Time Compression: x(2t)'); xlabel('Time (s)'); ylabel('Amplitude'); 
subplot(2,2,4); plot(t,yE); grid on; 
title('Time Expansion: x(t/2)'); xlabel('Time (s)'); ylabel('Amplitude'); 