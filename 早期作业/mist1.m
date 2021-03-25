clc;clear all;close all
faiz=[0:0.01:2*pi]
gama=2*(1+sin(faiz))
polar(faiz,gama)
xlabel("faizֵ")
ylabel("gamaֵ")