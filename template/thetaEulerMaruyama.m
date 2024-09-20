function [t, u] = thetaEulerMaruyama(u0, t0, dt, T, f, g, theta)
  t = t0:dt:T;
  u = zeros(1, length(t));
  u(1) = u0;
  sqrtdt = sqrt(dt);
  randn("seed", 2023);
  for n=1:length(t)-1
    u_n = u(n);
    dW = sqrtdt*randn(1);
    a = @(u) u_n - u +((1-theta)*f(u_n)+theta*f(u))*dt+g(u_n)*dW;
    u(n+1) = fsolve(a, u_n);
  endfor
endfunction

