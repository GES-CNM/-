clc;
clear all;
close all;
syms x y;
n=600:200:4000;
m0=2000;
m1=1800;
m2=3880;
r=0.367;
nt=0.85;
f=0.013;
CdA=2.77;
i0=5.83;
If=0.218;
Iw1=1.798;
Iw2=3.598;
ig=[5.56 2.769 1.644 1 0.793];
L=3.2;
g=9.8;
a=1.947;
hg=0.9;
Ttq=-19.313+295.27.*(n./1000)-165.44.*(n/1000).^2+40.874.*(n/1000).^3-3.8445.*(n/1000).^4;
Ft1=Ttq*ig(1)*i0*nt/r;
Ft2=Ttq*ig(2)*i0*nt/r;
Ft3=Ttq*ig(3)*i0*nt/r;
Ft4=Ttq*ig(4)*i0*nt/r;
Ft5=Ttq*ig(5)*i0*nt/r;
U1=0.377*r*n./(ig(1).*i0);
U2=0.377*r*n./(ig(2).*i0);
U3=0.377*r*n./(ig(3).*i0);
U4=0.377*r*n./(ig(4).*i0);
U5=0.377*r*n./(ig(5).*i0);
uf=linspace(0,max(U5),200);
Ff=m2*g*f+CdA*U1.^2/21.15;
alpha=asin((Ft1-Ff)./(m2*g))
plot(U1,alpha)
imax=max(tan(alpha))
xlabel("车速(Km/H)")
ylabel("爬坡度（deg）")
title("爬坡度曲线")