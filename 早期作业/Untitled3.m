close all; clear all; clc; dbstop if error;

syms x

f=atan(30/52.*cos(x));

df1=diff(f,x,1)

df2=diff(f,x,2)