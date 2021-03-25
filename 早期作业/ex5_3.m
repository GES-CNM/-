clc;clear all;close all;
x=-10:10;
y=-10:10;
z=x.^2+6.*x.*y+y.^2+6*x+2*y-1;
subplot(2,2,1)
plot3(x,y,z)
grid on
xlabel('x')
ylabel('y')
zlabel('z')

x1=-6:0.5:6
y1=-6:0.5:6
[x1,y1]=meshgrid(x,y)
z1=x1.^2+4.*x1.*y1+2*y1.^2
subplot(2,2,2)
mesh(x1,y1,z1)

A=[25 36 45 93]
subplot(2,2,3)
pie(A)