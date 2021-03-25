clc;clear all;
t=0:2/200:20;
xa=(6-3*t).*sin(pi*0.5*t);
ya=(6-3*t).*cos(pi*0.5*t)-3;
plot(xa,ya,0,50,50,0);
axis equal