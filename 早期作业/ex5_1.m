clc;clear all;close all;
subplot(2,2,1)
n=[1000 1500 2000 2500 3000 3500 3800 4000]
Ttq=[135.33 147.10 152.98 156.91 147.10 138.27 133.37 125.53]
plot(n,Ttq,'o','color','r')
hold on
N=600:10:4000;
y1=interp1(n,Ttq,N,'spline','extrap')
plot(N,y1)
hold on 
Tq=-19.313+295.27*(N/1000)-166.44*(N/1000).^2+40.874*(N/1000).^3-3.8445*(N/1000).^4
plot(N,Tq,'color','g')
xlabel('引擎转速')
ylabel('引擎转矩')
legend('原生折线','拟合曲线')

m=3880
g=9.8
G=m*g
ig=[5.56 2.769 1.644 1.00 0.793]
nT=0.85
r=0.367
f=0.013
CDA=2.77
i0=5.83
L=3.2
a=1.947
hg=0.9
If=0.218
Iw1=1.789
Iw2=3.598

Ft1=Tq*ig(1)*i0*nT/r;
Ft2=Tq*ig(2)*i0*nT/r;
Ft3=Tq*ig(3)*i0*nT/r;
Ft4=Tq*ig(4)*i0*nT/r;
Ft5=Tq*ig(5)*i0*nT/r;

ua1=0.377*r*N/ig(1)/i0;
ua2=0.377*r*N/ig(2)/i0;
ua3=0.377*r*N/ig(3)/i0;
ua4=0.377*r*N/ig(4)/i0;
ua5=0.377*r*N/ig(5)/i0;

Pe1=Ft1.*ua1/3600;
Pe2=Ft1.*ua2/3600;
Pe3=Ft1.*ua3/3600;
Pe4=Ft1.*ua4/3600;
Pe5=Ft1.*ua5/3600;

figure1=subplot(2,2,2)
plot(ua1,Ft1,ua2,Ft2,ua3,Ft3,ua4,Ft4,ua5,Ft5);
title('汽车驱动力-行驶阻力平衡图')
ylabel('ua(km/h)')
xlabel('FT/N')
legend(figure1,{'Ft1','Ft2','Ft3','Ft4','Ft5'})

figure2=subplot(2,2,3)
plot(ua1,Pe1,ua2,Pe2,ua3,Pe3,ua4,Pe4,ua5,Pe5);
title('汽车功率平衡图')
ylabel('ua(km/h)')
xlabel('P/kw')
legend(figure2,{'Pe1','Pe2','Pe3','Pe4','Pe5'})
grid on