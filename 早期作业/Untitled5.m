clear;clc
x=linspace(0,4*pi,360)
t=x+pi/2
gx=x/(2*pi)*360
y=- (15.*cos(t))./(26.*((225.*cos(t).^2)./676 + 1)) - (3375.*cos(t).*sin(t).^2)/(8788.*((225.*cos(t).^2)./676 + 1).^2)
plot(gx,y);
title('ת������˶����ٶȹ�ϵ');
xlabel('�Ƚ�ת���Ƕ�');ylabel('���Ǽ��ٶ�a');