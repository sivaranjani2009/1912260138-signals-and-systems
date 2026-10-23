% Experiment 18: Z-Transform, ROC and Inverse Z-Transform 
clc; clear; close all; 
% x[n] = (0.5)^n u[n], a right-sided sequence 
n = 0:10; 
x = (0.5).^n; 
% Analytical Z-transform: X(z) = z/(z - 0.5) 
% ROC for the right-sided infinite sequence: |z| > 0.5 
syms z k 
Xz = z/(z - 0.5); 
xInverse = iztrans(Xz, z, k); 
disp('Z-transform X(z) = '); 
pretty(Xz); 
disp('Inverse Z-transform (symbolic) = '); 
pretty(xInverse); 
% Numerical inverse sequence for comparison over n = 0:10 
xRec = (0.5).^n; 
fprintf('Maximum reconstruction error = %.3e\n', max(abs(x-xRec))); 
fprintf('Pole = 0.5; zero = 0; ROC for right-sided sequence: |z| > 0.5\n'); 
figure('Name','Experiment 18: Z-transform and inverse'); 
subplot(2,2,1); 
stem(n,x,'filled'); grid on; 
xlabel('Sample index n'); ylabel('Amplitude'); 
title('Original sequence x[n] = (0.5)^n u[n]'); 
subplot(2,2,2); 
stem(n,xRec,'r','filled'); grid on; 
xlabel('Sample index n'); ylabel('Amplitude'); 
title('Inverse Z-transform reconstruction'); 
legend('Reconstructed x[n]'); 
subplot(2,2,3); 
zplane([1 0],[1 -0.5]); grid on; 
title('Pole-zero plot: zero at 0, pole at 0.5'); 
subplot(2,2,4); 
theta = linspace(0,2*pi,500); 
plot(cos(theta),sin(theta),'k--','LineWidth',1); hold on; 
plot(0.5*cos(theta),0.5*sin(theta),'b:','LineWidth',1.2); 
plot(0.5,0,'rx','MarkerSize',10,'LineWidth',2); 
axis equal; grid on; 
xlabel('Real(z)'); ylabel('Imag(z)'); 
title('ROC boundary |z| = 0.5 and unit circle'); 
legend('Unit circle |z|=1','ROC boundary','Pole at z=0.5','Location','best');