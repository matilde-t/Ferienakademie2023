clear all
close all
clc

s = 3;
r = 8;
u0 = 10;
t0 = 0;
T = 1;
dt = .1;
theta = 0.5;

f = @(u) r*u;
g = @(u) s*u;

[t, u] = EulerMaruyama(u0, t0, dt, T, f, g);
plot(t, u, '-+');
hold on
randn("seed", 202);
analytical = @(t) u0*exp((r-0.5*s^2)*t+s*sqrt(t)*randn(1));
plot(t, analytical(t), '-o');
hold on
[t, u] = thetaEulerMaruyama(u0, t0, dt, T, f, g, theta);
plot(t, u, '-s');
hold off
legend("Euler Maruyama", "Analytical solution", "Theta Euler Maruyama")
