% Experiment 11: Linearity and Time Invariance 
clc; clear; close all; 
t = -1:0.001:1; 
x1 = sin(2*pi*5*t); x2 = cos(2*pi*5*t); 
a = 2; b = 3; t0 = 0.2; 
T = @(x) 2*x; 
lhs = T(a*x1+b*x2); 
rhs = a*T(x1)+b*T(x2); 
linError = max(abs(lhs-rhs)); 
xDelay = sin(2*pi*5*(t-t0)); 
lhsTI = T(xDelay); 
rhsTI = T(x1); 
rhsTIshift = interp1(t,rhsTI,t-t0,'linear',0); 
tiError = max(abs(lhsTI-rhsTIshift)); 
figure; 
subplot(2,1,1); plot(t,lhs-rhs); grid on; title('Linearity Error'); 
subplot(2,1,2); plot(t,lhsTI-rhsTIshift); grid on; title('Time-Invariance Error'); 
fprintf('Linearity error = %g\n',linError); 
fprintf('Time-invariance error = %g\n',tiError); 