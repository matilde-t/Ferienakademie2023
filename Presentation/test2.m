u0=1; T=10; N=40; d=1; m=1; theta=1;
r=8; sigma=3;
[t,u]=EulerMaruyamaTheta(u0,T,N,d,m,@(u)(r*u),@(u)(sigma*u),theta);
plot(t,u)
