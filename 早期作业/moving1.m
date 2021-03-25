clear;clc
x=linspace(0,4*pi,400)
t=cos(x+pi/2)
fx=x/(2*pi)*360
y=atan(30/52.*t)/(2*pi)*360;
plot(fx,y);
title('转向机构运动关系');
xlabel('θ角转动角度');ylabel('α摆动角度');
axis([0 720 -45 45])