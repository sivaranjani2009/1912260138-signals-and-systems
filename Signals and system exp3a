% Experiment 3: Energy and Power Analysis 
clc; clear; close all; 

dt = 0.001; 
t = 0:dt:5; 

xE = exp(-t); 
xP = sin(2*pi*5*t); 

E_num = trapz(t,abs(xE).^2); 

T0 = 1/5; 
idx = t <= 2; 
P_num = (1/(t(find(idx,1,'last'))-t(1))) * ... 
    trapz(t(idx),abs(xP(idx)).^2); 

figure; 
subplot(2,1,1); 
plot(t,xE); grid on; 
title('Energy Signal e^{-t}u(t)'); 
xlabel('Time (s)'); ylabel('Amplitude'); 

subplot(2,1,2); 
plot(t,xP); grid on; 
title('Power Signal sin(2pi5t)'); 
xlabel('Time (s)'); ylabel('Amplitude'); 

fprintf('Numerical energy = %g\n',E_num); 
fprintf('Numerical average power = %g\n',P_num); 