clear;clc
x=linspace(0,4*pi,400)
t=cos(x+pi/2)
fx=x/(2*pi)*360
y=atan(30/52.*t)/(2*pi)*360;
plot(fx,y);
title('ת������˶���ϵ');
xlabel('�Ƚ�ת���Ƕ�');ylabel('���ڶ��Ƕ�');
axis([0 720 -45 45])