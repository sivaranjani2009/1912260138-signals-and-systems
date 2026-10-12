% Experiment 2: Generation of Discrete-Time Signals 
clc; clear; close all; 
n = -20:20; 
A = 2; f0 = 0.1; a = 0.1; 
imp = double(n==0); 
step = double(n>=0); 
ramp = n.*step; 
expSig = (0.8).^n .* step; 
sinSig = A*sin(2*pi*f0*n); 
figure; 
subplot(3,2,1); stem(n,imp,'filled'); grid on; title('Unit Impulse'); 
subplot(3,2,2); stem(n,step,'filled'); grid on; title('Unit Step'); 
subplot(3,2,3); stem(n,ramp,'filled'); grid on; title('Ramp'); 
subplot(3,2,4); stem(n,expSig,'filled'); grid on; title('Exponential'); 
subplot(3,2,5); stem(n,sinSig,'filled'); grid on; title('Discrete Sinusoid'); 
xlabel('n');