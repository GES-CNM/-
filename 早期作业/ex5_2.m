clc;clear all;close all;
n0=[1000 1500 2000 2500 3000 3500 3800 4000]
Ttq=[135.53 147.10 152.98 156.91 147.10 138.27 133.37 125.53]
plot(n0,Ttq,'color','g')
hold on
n=600:5:4000
y1=interp1(n0,Ttq,n,'spline','extrap')
plot(n,y1)
hold on
Tq=-19.313+295.27*(n/1000)-166.44*(n/1000).^2+40.874*(n/1000).^3-3.8445*(n/1000).^4
plot(n,Tq)
xlabel('����ת��(r/min)')
ylabel('����ת��(Nm)')
legend('ԭ������','�������','����������')