clc;clear all;
t=0:2/1800:20;
x=-6;y=0;
theta=0:2*pi/1800:2*pi;
Circle1=x+(sqrt(9.*t'.^2+18.*t'.*cos(pi.*t'*0.5)+9))*cos(theta);
Circle2=y+(sqrt(9.*t'.^2+18.*t'.*cos(pi.*t'*0.5)+9))*sin(theta);
plot(Circle1,Circle2,'m','Linewidth',1);
axis equal