clc;clear all;close all;
u=30;tspan=[0 12];
tf1=0:3;tf2=[3.1,4:12];tf=[tf1 tf2];
delta=[zeros(1,length(tf1)),ones(1,length(tf2))*0.1];
ic=zeros(1,2);
[T,Y]=ode45(@(t,y)vehicle2dofmodel(t,y,tf,delta,u),tspan,ic)
subplot(2,2,1)
plot(tf,delta*180/pi)
xlabel('时间(s)')
ylabel('前轮角度(deg)')
subplot(2,2,2)
plot(T,Y(:,2)*180/pi)
xlabel('时间(s)')
ylabel('转向率(deg/s)')
subplot(2,2,3)
beta=Y(:,1)/u*180/pi;
plot(T,beta)
xlabel('时间(s)')
ylabel('β角度(deg)')