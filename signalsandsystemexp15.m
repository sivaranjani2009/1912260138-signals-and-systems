clc; clear; close all; 
N = 10;                    % rectangular pulse length 
n = 0:N-1; 
x = ones(1,N); 
w = linspace(-pi, pi, 1024);   % dense frequency grid (one period) 
X = zeros(size(w)); 
for k = 1:length(w) 
X(k) = sum(x .* exp(-1j*w(k)*n));   % direct DTFT summation 
end 
figure; 
subplot(2,1,1); plot(w/pi, abs(X)); xlabel('\omega / \pi'); ylabel('|X(e^{j\omega})|'); 
title('DTFT Magnitude Spectrum'); grid on; 
subplot(2,1,2); plot(w/pi, angle(X)); xlabel('\omega / \pi'); ylabel('\angle X(e^{j\omega})'); 
title('DTFT Phase Spectrum'); grid on; 
%% Periodicity check over 2 periods 
w2 = linspace(-2*pi, 2*pi, 2048); 
X2 = zeros(size(w2)); 
for k = 1:length(w2), X2(k) = sum(x .* exp(-1j*w2(k)*n)); end 
figure; plot(w2/pi, abs(X2)); xlabel('\omega / \pi'); ylabel('|X(e^{j\omega})|'); 
title('DTFT Magnitude over Two Periods (Periodicity = 2\pi)'); grid on; 
%% Time-shift property verification 
n0 = 3; 
x_shift = [zeros(1,n0), x]; 
n_shift = 0:length(x_shift)-1; 
Xs = zeros(size(w)); 
for k = 1:length(w), Xs(k) = sum(x_shift .* exp(-1j*w(k)*n_shift)); end 
mag_err = max(abs(abs(Xs) - abs(X))); 
phase_theory = -w*n0; 
phase_err = max(abs(mod(angle(Xs)-angle(X)-phase_theory+pi,2*pi)-pi)); 
fprintf('Time-shift property: max magnitude error = %.4g\n', mag_err); 
fprintf('Time-shift property: max phase-term error (rad) = %.4g\n', phase_err); 
%% Linearity property verification 
a = 2; b = -1; 
x1 = ones(1,5); x2 = [1 0.8 0.6 0.4 0.2 0 0 0]; 
n1 = 0:length(x1)-1; n2 = 0:length(x2)-1; 
xc = a*[x1 zeros(1,length(x2)-length(x1))] + b*x2; 
nc = 0:length(xc)-1; 
X1 = zeros(size(w)); X2v = zeros(size(w)); Xcomb = zeros(size(w)); 
for k = 1:length(w) 
X1(k)    = sum(x1 .* exp(-1j*w(k)*n1)); 
X2v(k)   = sum(x2 .* exp(-1j*w(k)*n2)); 
Xcomb(k) = sum(xc .* exp(-1j*w(k)*nc)); 
end 
lin_err = max(abs(Xcomb - (a*X1 + b*X2v))); 
fprintf('Linearity property: max complex error = %.4g\n', lin_err);