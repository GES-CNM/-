clc;clear all
m=1818.2
Iz=3885
L=3.048
a=1.463
b=1.585
k1=-62618
k2=-110185
k=0.0024
u=30.56
w=5.58
yibu=(-m*(a^2*k1+b^2*k2)-Iz*(k1+k2))/(2*L*sqrt(m*Iz*k1*k2*(1+k*u^2)))
t=atan(sqrt(1-yibu^2)/((-m*u*a/(L*k2))*w-yibu))/(w*sqrt(1-yibu^2))
sigma=atan(sqrt(1-yibu^2)/yibu)/(w*sqrt(1-yibu^2))+t