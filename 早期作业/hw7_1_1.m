clc;clear all;close all;
f0=1.5;
zeta=0.25;
gama=9;
miu=10;
fs=3;
zetas=0.25;
u=20;
Gqn0=2.56*10^-4;
yita0=0.1;
deltaf=0.2;
N=180;
a0=1e-6
%幅频特性
f=deltaf*[0:N];
a1=f/f0;
a1s=f/fs;
Wf=0*f;
delta=((1-a1.^2).*(1+gama-1/miu*a1.^2)-1).^2+4*zeta^2*a1.^2.*(gama-(1/miu+1)*a1.^2).^2;
z1q=gama*sqrt(((1-a1.^2).^2+4*zeta^2*a1.^2)./delta);
z2z1=sqrt((1+4*zeta^2*a1.^2)./((1-a1.^2).^2+4*zeta^2*a1.^2));
pz2=sqrt((1+(2*zetas*a1s).^2)./((1-a1s.^2).^2+(2*zetas*a1s).^2));
% subplot(2,2,1)
% plot(f,z1q)
% title('幅频特性|z1/q|')
% xlabel('激振频率f/Hz')
% ylabel('|z1/q|')
% subplot(2,2,2)
% plot(f,z2z1)
% title('幅频特性|z2/z1|')
% xlabel('激振频率f/Hz')
% ylabel('|z2/z1|')
% subplot(2,2,3)
% plot(f,pz2)
% title('幅频特性|p/z2|')
% xlabel('激振频率f/Hz')
% ylabel('|p/z2|')
% 均方根值
z2q=gama*sqrt((1+4*zeta^2*a1.^2)./delta);
pq=pz2.*z2q;
Gqf=4*pi^2*sqrt(Gqn0*yita0^2*u)*f;
Gz1f=z1q.*Gqf;
Gz2f=z2q.*Gqf;
Gaf=pq.*Gqf;
% subplot(2,2,1)
% plot(f,Gz1f)
% title('均方根值√Gz1(f)')
% xlabel('激振频率f/Hz')
% ylabel('√Gz1(f)')
% subplot(2,2,2)
% plot(f,Gz2f)
% title('均方根值√Gz2(f)')
% xlabel('激振频率f/Hz')
% ylabel('√Gz2(f)')
% subplot(2,2,3)
% plot(f,Gaf)
% title('均方根值√Ga(f)')
% xlabel('激振频率f/Hz')
% ylabel('√Ga(f)')
% 计算sigma参数和aw与Law
sigmaq=sqrt(trapz(f,Gqf.^2))
sigmaz1=sqrt(trapz(f,Gz1f.^2))
sigmaz2=sqrt(trapz(f,Gz2f.^2))
sigmaa=sqrt(trapz(f,Gaf.^2))
for i=1:(N+1)
    if f(i)<=2
        Wf(i)=0.5;
    elseif f(i)<=4
        Wf(i)=f(i)/4;
    elseif f(i)<=12.5
        Wf(i)=1;
    else 
        Wf(i)=12.5/f(i);
    end
end
kk=Wf.^2.*Gaf.^2;
aw=sqrt(trapz(f,kk))
Law=20*log10(aw/a0)
%题目2，fs变量
fs_1=[1.5:0.005:6]
for M=1:length(fs_1)
    fs1=fs_1(M);
    a1s1=f/fs1
    delta_1=((1-a1.^2).*(1+gama-1/miu*a1.^2)-1).^2+4*zeta^2*a1.^2.*(gama-(1/miu+1)*a1.^2).^2;
    pz2_1=sqrt((1+(2*zetas*a1s1).^2)./((1-a1s1.^2).^2+(2*zetas*a1s1).^2));
    z2q_1=gama*sqrt((1+4*zeta^2*a1.^2)./delta_1);
    pq_1=pz2_1.*z2q_1;
    Gqf_1=4*pi^2*sqrt(Gqn0*yita0^2*u)*f;
    Gaf_1=pq_1.*Gqf_1;
    kk_1=Wf.^2.*Gaf_1.^2;
    aw_1(M)=sqrt(trapz(f,kk_1));
end
Law1=20*log10(aw_1/a0);
subplot(1,2,1)
plot(fs_1,aw_1)
title('fs对aw的影响'),xlabel('fs'),ylabel('aw/m·s^-2')
subplot(1,2,2)
plot(fs_1,Law1)
title('fs对Law的影响'),xlabel('fs'),ylabel('Law/dB')
%题目2,zetas变量
zetas1=[0.125:0.005:0.5];
for j=1:length(zetas1)
    zeta_0=zetas1(j);
    delta_0=((1-a1.^2).*(1+gama-1/miu*a1.^2)-1).^2+4*zeta_0^2*a1.^2.*(gama-(1/miu+1)*a1.^2).^2;
    pz2_0=sqrt((1+(2*zetas*a1s).^2)./((1-a1s.^2).^2+(2*zetas*a1s).^2));
    z2q_0=gama*sqrt((1+4*zeta_0^2*a1.^2)./delta_0);
    pq_0=pz2_0.*z2q_0;
    Gqf_0=4*pi^2*sqrt(Gqn0*yita0^2*u)*f;
    Gaf_0=pq_0.*Gqf_0;
    kk_0=Wf.^2.*Gaf_0.^2;
    aw_0(j)=sqrt(trapz(f,kk_0));
end
Law0=20*log10(aw_0/a0);
% subplot(1,2,1)
% plot(zetas1,aw_0)
% title('ζs对aw的影响'),xlabel('阻尼比ζs'),ylabel('aw/m·s^-2')
% subplot(1,2,2)
% plot(zetas1,Law0)
% title('ζs对Law的影响'),xlabel('阻尼比ζs'),ylabel('Law/dB')




