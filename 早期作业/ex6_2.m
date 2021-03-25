clc;clear all;close all;
t=0:0.5:5;
[t,x]=ode45(@(t,x)myfun(t,x),[0 5],[0 0 0 0]);
plot(t,x(:,1),t,x(:,3))