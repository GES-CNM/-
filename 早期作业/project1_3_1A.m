clc;clear all;
t=0:2/100:20;
xb=3*t-6+3*cos(pi*0.5*t);
yb=3*sin(pi*0.5*t);
plot(xb,yb,0,5,xb,0);
axis equal