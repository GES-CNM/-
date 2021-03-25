clear all;close all;clc
fs=3;zeta=0.25;g=9.8;
u=20;Gqn0=2.56*10^(-4);n0=0.1;deltaf=0.2;N=180;
f0=1.5;zetas=0.25;gama=9;miu=10;
ff0=[0.25:0.05:3];sigmaz2_2=0*ff0;sigmafd_2=0*ff0;sigmaFd_G_2=0*ff0;
% 参数f0
M=length(ff0);
for i=1:M
f0_0=ff0(i);
f=deltaf*[0:N];a1=f/f0_0;a1s=f/fs;
delta=((1-a1.^2).*(1+gama-1/miu*a1.^2)-1).^2+4*zeta^2*a1.^2.*(gama-(1/miu+1)*a1.^2).^2;
z2_q=2*pi*f*gama.*sqrt((1+4*zeta^2*a1.^2)./delta);
fd_q=gama*a1.^2./(2*pi*f+eps)./sqrt(delta);
Fd_Gq=2*pi*f*gama/g.*sqrt(((a1.^2/(miu+1)-1).^2+4*zeta^2*a1.^2)./delta);
Gq_f=4*pi^2*Gqn0*n0^2*u;
Gz2f_3=z2_q.^2*Gq_f;
Gfd_qf_2=fd_q.^2*Gq_f;
GFd_Gf_2=Fd_Gq.^2*Gq_f;
sigmaz2_2(i)=sqrt(trapz(f,Gz2f_3));
sigmafd_2(i)=sqrt(trapz(f,Gfd_qf_2));
sigmaFd_G_2(i)=sqrt(trapz(f,GFd_Gf_2));
if  f0_0==1.5
sgmz2_1=sigmaz2_2(i);
sgmfd_1=sigmafd_2(i);
sgmFd_G_1=sigmaFd_G_2(i);
end
end
sz2_1=20*log10(sigmaz2_2/sgmz2_1);
sfd_1=20*log10(sigmafd_2/sgmfd_1);
sFd_G_1=20*log10(sigmaFd_G_2/sgmFd_G_1);
% plot(ff0,sz2,'r-',ff0,sfd,'g-.',ff0,sFd_G,'b.');
% title('三个响应量均方根值随f0变化的曲线');
% grid on
% legend('σz``','σfd','σFd/G')
% xlabel('f0/Hz');
% ylabel('dB');
% 参数ζ
zeta_1=[0.125:0.005:0.5];sigmaz2_1=0*zeta_1;sigmafd_1=0*zeta_1;sigmaFd_G_1=0*zeta_1;
M_1=length(zeta_1);
for i=1:M_1
zeta1=zeta_1(i);
f=deltaf*[0:N];a1_1=f/f0_0;a1s_3=f/fs;
delta_1=((1-a1_1.^2).*(1+gama-1/miu*a1_1.^2)-1).^2+4*zeta1^2*a1_1.^2.*(gama-(1/miu+1)*a1_1.^2).^2;
z2_q_1=2*pi*f*gama.*sqrt((1+4*zeta1^2*a1_1.^2)./delta_1);
fd_q_1=gama*a1_1.^2./(2*pi*f+eps)./sqrt(delta_1);
Fd_Gq_1=2*pi*f*gama/g.*sqrt(((a1_1.^2/(miu+1)-1).^2+4*zeta1^2*a1_1.^2)./delta_1);
Gq_f_1=4*pi^2*Gqn0*n0^2*u;
Gz2f_1=(z2_q_1).^2*Gq_f_1;
Gfd_qf_1=(fd_q_1).^2*Gq_f_1;
GFd_Gf_1=(Fd_Gq_1).^2*Gq_f_1;
sigmaz2_1(i)=sqrt(trapz(f,Gz2f_1));
sigmafd_1(i)=sqrt(trapz(f,Gfd_qf_1));
sigmaFd_G_1(i)=sqrt(trapz(f,GFd_Gf_1));
if  zeta1==0.25
sgmz2_1=sigmaz2_1(i);
sgmfd_1=sigmafd_1(i);
sgmFd_G_1=sigmaFd_G_1(i);
end
end
sz2_1=20*log10(sigmaz2_1/sgmz2_1);
sfd_1=20*log10(sigmafd_1/sgmfd_1);
sFd_G_1=20*log10(sigmaFd_G_1/sgmFd_G_1);
% plot(zeta_1,sz2_1,'r-',zeta_1,sfd_1,'b-.',zeta_1,sFd_G_1,'k--')
% title('三个响应量均方根值随ζ变化的曲线');
% grid on
% legend('σz``','σfd','σFd/G')
% xlabel('阻尼比ζ');
% ylabel('dB');

% 参数γ
gama2=[4:0.01:19];sigmaz2_2=0*gama2;sigmafd_2=0*gama2;sigmaFd_G_2=0*gama2;
M_2=length(gama2);
for i=1:M_2
gama_2=gama2(i);
f=deltaf*[0:N];a1_2=f/f0;a1s_3=f/fs;
delta=((1-a1_2.^2).*(1+gama_2-1/miu*a1_2.^2)-1).^2+4*zeta^2*a1_2.^2.*(gama_2-(1/miu+1)*a1_2.^2).^2;
z2_q_2=2*pi*f*gama_2.*sqrt((1+4*zeta^2*a1_2.^2)./delta);
fd_q_2=gama_2*a1_2.^2./(2*pi*f+eps)./sqrt(delta);
Fd_Gq_2=2*pi*f*gama_2/g.*sqrt(((a1_2.^2/(miu+1)-1).^2+4*zeta^2*a1_2.^2)./delta);
Gq_f_3=4*pi^2*Gqn0*n0^2*u;
Gz2f_3=(z2_q_2).^2*Gq_f_3;
Gfd_qf_2=(fd_q_2).^2*Gq_f_3;
GFd_Gf_2=(Fd_Gq_2).^2*Gq_f_3;
sigmaz2_2(i)=sqrt(trapz(f,Gz2f_3));
sigmafd_2(i)=sqrt(trapz(f,Gfd_qf_2));
sigmaFd_G_2(i)=sqrt(trapz(f,GFd_Gf_2));
	if  gama_2==9
            sgmz2_2=sigmaz2_2(i);
            sgmfd_2=sigmafd_2(i);
            sgmFd_G_2=sigmaFd_G_2(i);
    end
end
sz2_2=20*log10(sigmaz2_2/sgmz2_2);
sfd_2=20*log10(sigmafd_2/sgmfd_2);
sFd_G_2=20*log10(sigmaFd_G_2/sgmFd_G_2);
% plot(gama2,sz2_2,'r-',gama2,sfd_2,'b-.',gama2,sFd_G_2,'k--');
% title('三个响应量均方根值随γ变化的曲线');
% grid on
% legend('σz``','σfd','σFd/G')
% xlabel('轮胎和悬架的刚度比γ');
% ylabel('dB');

% 参数μ
miu3=[5:0.1:20];sigmaz2_3=0*miu3;sigmafd_3=0*miu3;sigmaFd_G_3=0*miu3;
M=length(miu3);
for i=1:M
miu_3=miu3(i);
f=deltaf*[0:N];a1_3=f/f0;a1s_3=f/fs;
delta=((1-a1_3.^2).*(1+gama-1/miu_3*a1_3.^2)-1).^2+4*zeta^2*a1_3.^2.*(gama-(1/miu_3+1)*a1_3.^2).^2;
z2_q_3=2*pi*f*gama.*sqrt((1+4*zeta^2*a1_3.^2)./delta);
fd_q_3=gama*a1_3.^2./(2*pi*f+eps)./sqrt(delta);
Fd_Gq_3=2*pi*f*gama/g.*sqrt(((a1_3.^2/(miu_3+1)-1).^2+4*zeta^2*a1_3.^2)./delta);
Gq_f_3=4*pi^2*Gqn0*n0^2*u;
Gz2f_3=(z2_q_3).^2*Gq_f_3;
Gfd_qf_3=(fd_q_3).^2*Gq_f_3;
GFd_Gf_3=(Fd_Gq_3).^2*Gq_f_3;
sigmaz2_3(i)=sqrt(trapz(f,Gz2f_3));
sigmafd_3(i)=sqrt(trapz(f,Gfd_qf_3));
sigmaFd_G_3(i)=sqrt(trapz(f,GFd_Gf_3));
if  miu_3==10
sgmz2_3=sigmaz2_3(i);
sgmfd_3=sigmafd_3(i);
sgmFd_G_3=sigmaFd_G_3(i);
end
end
sz2_3=20*log10(sigmaz2_3/sgmz2_3);
sfd_3=20*log10(sigmafd_3/sgmfd_3);
sFd_G_3=20*log10(sigmaFd_G_3/sgmFd_G_3);
plot(miu3,sz2_3,'r-',miu3,sfd_3,'b-.',miu3,sFd_G_3,'k--');
title('三个响应量均方根值随μ变化的曲线');
grid on
legend('σz``','σfd','σFd/G')
xlabel('车身车轮部分质量比μ');
ylabel('dB');


