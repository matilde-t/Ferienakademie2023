clear all
close all
clc

u0 = 1;
r = -8;
s = 1;

f = @(u) r*u;
g = @(u) s*u;

T = 1;
N = 5000;
dtRef = T/N;
M = 5000;
kappa = [5];
for k = 1:length(kappa)
  [RMS(k)] = runEMpath(u0, f, g, T, N, M, kappa(k))
endfor

