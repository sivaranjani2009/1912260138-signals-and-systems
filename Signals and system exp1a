 % Experiment 1: Generation of Continuous-Time Signals 
 clc; clear; close all; 
 t = -1:0.001:1; 
 A = 2; f0 = 5; a = 1; 
 imp = double(abs(t)<0.0005); 
 step = double(t>=0); 
 ramp = t.*step; 
 expSig = exp(-a*t).*step; 
 sinSig = A*sin(2*pi*f0*t); 
 figure; 
 subplot(3,2,1); plot(t,imp); grid on; title('Unit Impulse'); xlabel('t'); ylabel('Amplitude'); 
 subplot(3,2,2); plot(t,step); grid on; title('Unit Step'); xlabel('t'); ylabel('Amplitude'); 
 subplot(3,2,3); plot(t,ramp); grid on; title('Ramp'); xlabel('t'); ylabel('Amplitude'); 
 subplot(3,2,4); plot(t,expSig); grid on; title('Exponential'); xlabel('t'); ylabel('Amplitude'); 
 subplot(3,2,5); plot(t,sinSig); grid on; title('Sinusoidal'); xlabel('t'); ylabel('Amplitude'); 