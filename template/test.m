clear all
close all
clc

u0 = 1;
r = 1;
s = 1;
t0 = 0;
T = 10;
dt = 1;

f = @(u) r*u;
g = @(u) s*u;

[t, u] = EulerMaruyama(u0, t0, dt, T, f, g);
plot(t,u,'+-')
hold on
randn("seed", 2023);
real = @(u) u0*exp((r-0.5*s^2)*t+s*sqrt(t)*randn(1));
plot(t, real(t), 'o-')
[t, u] = thetaEulerMaruyama(u0, t0, dt, T, f, g, 1);
plot(t,u,'s-')
hold off
legend("Euler-Maruyama", "Analytical Solution", "Theta-Euler-Maruyama")
