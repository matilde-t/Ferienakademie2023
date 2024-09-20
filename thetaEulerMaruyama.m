function [t, u] = thetaEulerMaruyama(u0, t0, dt, T, f, g, theta)
  t = t0:dt:T;
  u = zeros(1, length(t));
  u(1) = u0;
  randn("seed", 202);
  sqrtdt = sqrt(dt);
  for n=1:length(t)-1
    dW = sqrtdt*randn(1);
    un = u(n);
    a = @(u) un-u+((1-theta)*f(un)+theta*f(u))*dt+g(un)*dW;
    u(n+1) = fsolve(a, u(n));
  endfor
endfunction
