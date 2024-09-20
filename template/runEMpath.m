function [RMS, t, u, tref, uref] = runEMpath(u0, f, g, T, N, M, k)
  S = 0;
  Mstep = 1000;
  m0 = 1;
  for mm = 1:Mstep:M
    MM = min(Mstep, M-mm+1);
####    u00 = u0(mm:m0:+MM-1);
    randn("seed", 2023);
    [tref, uref] = EMpath(u0, f, g, T, N, MM, 1);
    randn("seed", 2023);
    [t, u] = EMpath(u0, f, g, T, N, MM, k);
    err = u(:,end)-uref(:,end);
    S = S + sum(sum(err.*err));
    m0 = m0 + MM;
  endfor
  RMS = sqrt(S./M);
endfunction

