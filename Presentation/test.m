clear all
close all
clc

lambda=1; alpha=1; sigma=1;
u0=[0.5;0]; T=10; N=100;
[t, u]=vdp(u0, T, N, alpha, lambda, sigma);
plot(t,u, '+-')
legend("Q", "P")
