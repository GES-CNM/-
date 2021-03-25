clc;clear all;close all;
t=[0 20 40 60 80 100 120 140];
n=[0 15 25 -8 12 17 24 19];
t0=0:2:140;
y1=interp1(t,n,t0,'spline')
y2=interp1(t,n,t0,'nearest')
y3=interp1(t,n,t0,'linear')
y4=interp1(t,n,t0,'cubic')
figure
subplot(2,2,1);
plot(t,n);
hold on;
plot(t0,y1);
legend('ԭ������','spline')
title('spline');
subplot(2,2,2);
plot(t,n);
hold on;
plot(t0,y2);
legend('ԭ������','nearest')
title('nearest');
subplot(2,2,3);
plot(t,n);
hold on;
plot(t0,y3);
legend('ԭ������','linear')
title('linear');
subplot(2,2,4);
plot(t,n);
hold on;
plot(t0,y4);
legend('ԭ������','cubic')
title('cubic');