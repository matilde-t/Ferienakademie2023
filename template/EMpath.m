function [t, u] = EMpath(u0, f, g, T, N, M, k)
  %% code to find M iid sample paths of the Euler-Maruyama approximation u_n to
  %% the solution u(t)
  %% M = number of samples, k = size of Brownian increments
  %% u(j,n+1) = u_j^n for n = 0,...,N and j = 1,...,M
  dtRef = T/N; % small step
  dt = k*dtRef; % big step
  NN = N/k; % number of big steps
  u = zeros(M, NN+1);
  t = zeros(1, NN+1);
  gdW = zeros(M,1);
  sqrtdtRef = sqrt(dtRef);
  u(:,1) = u0;
  for n = 1:NN+1
    t(n) = (n-1)*dt;
    dW = sqrtdtRef*sum(randn(M,k),2);
    for mm = 1:M
      gdW(mm) = g(u(mm,n)).*dW(mm);
    endfor
    u(:,n+1) = u(:,n)+dt*f(u(:,n))+gdW;
  endfor
endfunction


