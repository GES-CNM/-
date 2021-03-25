clear;clc
x=linspace(0,4*pi,400)
t=x+pi/2
fx=x/(2*pi)*360
y=(-390.*sin(t))/(225.*cos(t).^2+676);
plot(fx,y);
title('转向机构运动关系');
xlabel('θ角转动角度');ylabel('v');