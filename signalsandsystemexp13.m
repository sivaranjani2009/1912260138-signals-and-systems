clc; clear; close all; 
fm = 50;              % message (max) signal frequency, Hz 
T  = 0.06;             % observation window, s 
dt = 1e-5;             % fine grid to emulate CT signal 
t  = 0:dt:T; 
x  = cos(2*pi*fm*t);   % reference continuous-time signal 
fs_list = [0.5*fm, fm, 2*fm, 5*fm, 10*fm]; 
labels  = {'fs = 0.5 fm (aliased)','fs = fm (under-sampled)', ... 
'fs = 2 fm (Nyquist rate)','fs = 5 fm (over-sampled)','fs = 10 fm (over-sampled)'}; 
figure('Name','Sampling at Different Rates'); 
for k = 1:length(fs_list) 
fs = fs_list(k); 
n  = 0:1/fs:T; 
xn = cos(2*pi*fm*n); 
subplot(length(fs_list),1,k); 
plot(t,x,'b-','LineWidth',1); hold on; 
stem(n,xn,'r','filled'); 
title(labels{k}); xlabel('t (s)'); ylabel('x(t)'); 
end 
%% Reconstruction using ideal sinc interpolation + error vs sampling rate 
fprintf('Nyquist rate (2*fm) = %.2f Hz\n', 2*fm); 
err = zeros(size(fs_list)); 
for k = 1:length(fs_list) 
fs = fs_list(k); 
n  = 0:1/fs:T; 
xn = cos(2*pi*fm*n); 
x_recon = zeros(size(t)); 
for i = 1:length(n) 
x_recon = x_recon + xn(i)*sinc(fs*(t - n(i))); 
end 
err(k) = mean(abs(x - x_recon)); 
fprintf('fs = %6.1f Hz (fs/fm = %4.1f) -> mean reconstruction error = %.5f\n', fs, fs/fm, err(k)); 
end 
figure('Name','Reconstruction at fs = 10 fm'); 
fs = 10*fm; n = 0:1/fs:T; xn = cos(2*pi*fm*n); 
x_recon = zeros(size(t)); 
for i = 1:length(n) 
x_recon = x_recon + xn(i)*sinc(fs*(t - n(i))); 
end 
plot(t,x,'b','LineWidth',1.5); hold on; 
plot(t,x_recon,'r--','LineWidth',1.2); 
legend('Original x(t)','Reconstructed x(t)'); 
title('Sinc-Interpolated Reconstruction'); xlabel('t (s)'); ylabel('Amplitude'); grid on; 
figure('Name','Reconstruction Error vs Sampling Ratio'); 
semilogy(fs_list/fm, err, '-o','LineWidth',1.5); grid on; 
xlabel('f_s / f_m'); ylabel('Mean reconstruction error (log scale)'); 
title('Reconstruction Error vs Sampling-to-Signal Frequency Ratio'); 
