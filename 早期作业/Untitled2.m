clear;clc
x=linspace(0,4*pi,400)
t=x+pi/2
fx=x/(2*pi)*360
y=(-390.*sin(t))/(225.*cos(t).^2+676);
plot(fx,y);
title('ת������˶���ϵ');
xlabel('�Ƚ�ת���Ƕ�');ylabel('v');