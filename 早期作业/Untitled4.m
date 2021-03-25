clear;clc
x=linspace(0,4*pi,360)
t=x+pi/2
gx=x/(2*pi)*360
y=-(15.*sin(t))./(26*((225.*cos(t).^2)/676 + 1))
plot(gx,y);
title('转向机构运动速度关系');
xlabel('θ角转动角度');ylabel('α角速度ω','y=-(15*sin(x))/(26*((225*cos(x)^2)/676 + 1))');