clc;clear all;close all
d=50
l=sqrt(2*d^2)
syms h
h1=sqrt(h^2+(l/2)^2)
s=h^2-(l*h1/2)
x=solve(s,h)
x1=eval(max(x))
h1_1=eval(max(sqrt(x.^2+(l/2)^2)))
a=h1_1/l
a1=(2^(1/2)*(5^(1/2) + 3)^(1/2))/4
A1=(sqrt(5)-1)/4
B1=(sqrt(5)-1)/2
C1=(sqrt(5)+1)/4
D1=(sqrt(5)+1)/2
if a1==A1
    qed='A'
else if a1==B1
        qed='B'
    else if a1==C1
            qed='C'
        else if a1==D1
                qed='D'
            end
        end
    end
end