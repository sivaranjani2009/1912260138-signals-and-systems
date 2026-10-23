clc; clear; close all; 
Fs = 1000; 
t = 0:1/Fs:2-1/Fs; 
% Non-stationary input: linear chirp from 50 Hz to 300 Hz plus a transient 
x = chirp(t,50,t(end),300,'linear'); 
burst = zeros(size(t)); 
idx = (t >= 0.8) & (t <= 1.0); 
burst(idx) = 0.8*sin(2*pi*150*t(idx)); 
x = x + burst; 
% STFT / spectrogram 
win = hann(128,'periodic'); 
noverlap = 112; 
nfft = 512; 
[S,F,Tstft] = spectrogram(x,win,noverlap,nfft,Fs); 
figure('Name','Experiment 20: STFT and wavelet analysis'); 
subplot(3,1,1); 
plot(t,x); grid on; 
xlabel('Time (s)'); ylabel('Amplitude'); 
title('Input: Chirp with 150 Hz transient'); 
subplot(3,1,2); 
imagesc(Tstft,F,20*log10(abs(S)+eps)); axis xy; 
ylim([0 400]); colorbar; 
xlabel('Time (s)'); ylabel('Frequency (Hz)'); 
title('STFT Magnitude Spectrogram (dB)'); 
% Continuous wavelet transform; requires Wavelet Toolbox 
subplot(3,1,3); 
[wt,fCWT] = cwt(x,Fs); 
imagesc(t,fCWT,abs(wt)); axis xy; 
ylim([0 400]); colorbar; 
xlabel('Time (s)'); ylabel('Frequency (Hz)'); 
title('CWT Magnitude Scalogram'); 
% Report settings used for reproducibility 
fprintf('Sampling frequency = %d Hz\n',Fs); 
fprintf('STFT window = %d samples; overlap = %d samples; FFT length = %d\n', ... 
length(win),noverlap,nfft); 
fprintf('Input contains a chirp from 50 Hz to 300 Hz and a 150 Hz burst from 0.8 to 1.0 s.\n'); 
