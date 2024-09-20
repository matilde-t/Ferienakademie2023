function [t, u] = EulerMaruyama(u0, t0, dt, T, f, g)
  t = t0:dt:T;
  u = zeros(1, length(t));
  u(1) = u0;
  sqrtdt = sqrt(dt);
  randn("seed", 2023);
  for n=1:length(t)-1
    u(n+1) = u(n)+f(u(n))*dt+g(u(n))*sqrtdt*randn(1);
  endfor
endfunction

