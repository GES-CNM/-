clear;clc
x=linspace(0,4*pi,360)
t=x+pi/2
gx=x/(2*pi)*360
y=-(15.*sin(t))./(26*((225.*cos(t).^2)/676 + 1))
plot(gx,y);
title('ת������˶��ٶȹ�ϵ');
xlabel('�Ƚ�ת���Ƕ�');ylabel('�����ٶȦ�','y=-(15*sin(x))/(26*((225*cos(x)^2)/676 + 1))');