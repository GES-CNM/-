clc;clear all;close all
u=0:0.001:40;
L=3.048;
k=0.0024;
xian1=(u./L)./(1+k.*u.^2);
plot(u,xian1)
xlabel('����ua��m/s��')
ylabel('��̬��ڽ��ٶ������r/��')