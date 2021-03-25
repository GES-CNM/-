clc;clear all;close all;format long
A = xlsread('BOM.xlsx','Sheet1','A2:Z2');
g=A(1);
Q=A(2);
Q0=A(3);
E=A(4);
S=A(5);
k=A(6);
nc=A(7);
Lf=A(8);
fa=A(9);
n=A(10);
n1=A(11);
fc=250/(nc^2);
Cs=Q/fc;
f0=Q0/Cs;
n0=(5*sqrt(10))/sqrt(f0);
fdup=0.8*fc;
Num1=rem(floor(fdup),10);
%向下取fd下且使其始终为5的倍数。
if Num1>=0 && Num1<=5
    fddown = floor(fdup)-Num1;
else if Num1>5 &&Num1<=9
        fddown = floor(fdup)-(Num1-5);
    end
end
%计算惯性矩JΣ
yita=n1/n;
h=[5 6 7 8 9 10 11];
b=[45;50;55;60;65;70;75;80;90;100];
delta=1.5/(1.04*(1+0.5*yita));
Jsigma=(delta*(Lf-0.5*S)^3*Cs)/(48*E);
Jsigma_dot=(n/12)*(b*h.^3);
sigmaC=(1/delta)*((6*E*h*fc)/(Lf-k*S)^2);
sigmaavg=(6*E*h)/(delta*(Lf-k*S)^2);
sigmamax=(6*E*h*(fc+fdup))/(delta*(Lf-k*S).^2);
%计算惯性矩的误差百分比
chaju=abs(Jsigma_dot-Jsigma)./Jsigma_dot;
index1=find(chaju<=0.05);
c=chaju(index1);
j1=[];
i1=[];
for i2=1:length(index1)    
    i1(i2)=rem(index1(i2),10);
    j1(i2)=ceil(index1(i2)/10);
    if i1(i2)==0
       i1(i2)=10;
    end    
end
h_allow=[];
b_allow=[];
index2=[];
%查看有多少个合适的数据
j0=1;
suitable=0;
% 查找合适的h值b值
for j = 1:length(j1)
    if sigmaC(j1(j))>=350 && sigmaC(j1(j))<=450 && sigmaavg(j1(j))<=5.0 && sigmaavg(j1(j))>=4.5 && sigmamax(j1(j)) <=1000
%       合适厚度的值  
        h_allow(j0)=h(j1(j)); 
        b_allow(j0)=b(i1(j));
        index2(j0)=(j1(j)-1)*10+i1(j);
        j0=j0+1;
        suitable=suitable+1;
    end
end

P=(1/2)*Q;
Wi=(b_allow(1)*h_allow(1)^2)/6;
xlswrite('σ0i.xlsx',Wi,1,'D4')
% 刚度验算1：共同曲率法
l = xlsread('sheet of length.xlsx','Sheet1','B4:B11');
L = xlsread('sheet of length.xlsx','Sheet1','C4:C11');
alpha=A(26);
aiplus1=[];
l_zhuangpei=(L-k*S)/2;
for i3=1:n-1
    aiplus1(i3)=l(1)-l(i3+1);
    aiplus1_zhuangpei(i3)=(l_zhuangpei(1)-l(i3+1));
end
aiplus1(n)=l(1);
aiplus1_zhuangpei(n)=l_zhuangpei(1);
Yi=[];
Yiplus1=[];
J=(b_allow(1)*h_allow(1)^3)/12;
J1=ones(1,n)*J;
h_main=h_allow(1)+2;
J1(1)=(b_allow(1)*h_main^3)/12;
for i4=1:n
    Yi(i4)=1/(J*i4);
    Yiplus1(i4)=1/(J*(i4+1));
end
Yiplus1(n)=0;
Yii=Yi-Yiplus1;
aii=aiplus1.^3;
aii_zhuangpei=aiplus1_zhuangpei.^3;
sigmaai=sum(aii.*Yii);
sigmaai_zhuangpei=sum(aii_zhuangpei.*Yii);
Cs1=alpha*6*E/(sigmaai);
Cs1_zhuangpei=alpha*6*E/(sigmaai_zhuangpei);
Cschaju=abs(Cs-Cs1)/Cs1;
Cschaju_zhuangpei=abs(Cs-Cs1_zhuangpei)/Cs1_zhuangpei;


% 载荷集中法
l(n+1)=0;
l(n+2)=0;
l_zhuangpei(n+1)=0;
P1=Q/2;
Ai=[];
Bi=[];
Ci=[];
for i6=2:n
    i6_1=i6-1;
    Ai(i6_1)=(J/(2*J))*((3*l(i6_1)/l(i6))-1);
    Bi(i6_1)=-1*(1+J/J);
    Ci(i6_1)=0.5*(l(i6+1)/l(i6))^2*(3-(l(i6+1)/l(i6)));
    Ai_1(i6_1)=(J/(2*J))*((3*l_zhuangpei(i6_1)/l_zhuangpei(i6))-1);
    Bi_1(i6_1)=-1*(1+J/J);
    Ci_1(i6_1)=(1/2)*(l_zhuangpei(i6+1)/l_zhuangpei(i6))^2*(3-(l_zhuangpei(i6+1)/l_zhuangpei(i6)));
end
B=zeros(6,1);
C=zeros(n-1,n+1);
B_1=zeros(6,1);
C_1=zeros(n-1,n+1);
for i7=1:length(Ai)
    C(i7,i7)=Ai(i7);
    C(i7,i7+1)=Bi(i7);
    C(i7,i7+2)=Ci(i7);
    C_1(i7,i7)=Ai_1(i7);
    C_1(i7,i7+1)=Bi_1(i7);
    C_1(i7,i7+2)=Ci_1(i7);
end
X=null(C,'r');
P_zaihe=X(:,1).*P1/X(1);
X_1=null(C_1,'r');
P_zaihe_1=X_1(:,1).*P1/X_1(1);
fA1=((2*Q/2*l(1)^3) +   (P_zaihe(2)*l(2)^3) -3*P_zaihe(2)*l(1)*l(2)^2)/(6*E*J);
fA1_zhuangpei=(2*Q/2*(l_zhuangpei(1)^3) + P_zaihe_1(2)*(l_zhuangpei(2)^3)-3*P_zaihe_1(1)*l_zhuangpei(1)*(l_zhuangpei(2)^2))/(6*E*J);
Cs2=Q/fA1;
Cs2chaju=abs(Cs-Cs2)/Cs2;
Cs2_zhuangpei=Q/fA1_zhuangpei;
Cs2chaju_zhuangpei=abs(Cs-Cs2_zhuangpei)/Cs2_zhuangpei;
% 各片应力计算
% 共同曲率法
sigmaJi=[];
Mi=[];
sigmaig=[];
for i5=1:n
    sigmaJi(i5)=i5*J;
    Mi(i5)=P1*l(1)*J./sigmaJi(i5);
    sigmaig(i5)=Mi(i5)/Wi;
    sigmaigbi(i5)=Cs1*sigmaig(i5)/(2*P);
end
% 集中载荷法

for i8=1:n
    sigmaib_1(i8)=P_zaihe(i8)*(l(i8)-l(i8+1))/Wi;
    sigmaig_1(i8)=(P_zaihe(i8)*l(i8)-P_zaihe(i8+1)*l(i8+1))/Wi;
end
sigmaibbi_1=sigmaib_1/fA1;
sigmaigbi_1=sigmaig_1/fA1;
gama=sigmaig_1 ./ sigmaib_1;
% 验算误差
chajusigmaig=abs(sigmaig(n)-sigmaC(h_allow(1)-(h(1)-1)))./sigmaig(n)




% 预应力计算
sigma0i=xlsread('σ0i.xlsx','Sheet1','B4:B11');
sigmai=sigma0i'+sigmaig(n);
sigmai_1=sigma0i'+sigmaig_1;

% 自由状态下的弧高及曲率半径的计算
delta1=[0.055*(fc+fdup) 0.075*(fc+fdup)];
deltaf=((S*(3*L(1)-S))./(2*L(1)^2))*(fc+fa+min(delta1));
H0=fc+fa+min(delta1)+deltaf;
R0=L(1)^2/(8*H0);

% 各片径在自由状态下的曲率半径及弧高计算
R0i=(E*h_allow(1)*R0)./(E*h_allow(1)+2*R0*sigma0i)';
H0i=L.^2./(8.*R0i);
R0_1=sum(L)./sum(L'./R0i);
H0_1=L(1)^2/(8*R0_1);
% 误差验算
chajuR0=abs(R0-R0_1)/R0_1;
% 板簧的动应力和最大应力
sigmadi=(fdup/fc)*sigmai;
sigmaimax=sigmadi+sigmai;
sigmadi_1=(fdup/fc)*sigmai_1;
sigmaimax_1=sigmadi+sigmai_1;









% 写入
A(12)=b_allow(1);
A(13)=h_allow(1);
A(14)=fc;
A(15)=Cs;
A(16)=n0;
A(17)=f0;
A(18)=fdup;
A(19)=fddown;
A(20)=delta;
A(21)=Jsigma;
A(22)=Jsigma_dot(min(index2));
A(23)=sigmaC(min(h_allow)-4);
A(24)=sigmaavg(min(h_allow)-4);
A(25)=sigmamax(min(h_allow)-4);
A(27)=Cs1;
A(28)=sigmaig(n);
A(32)=H0;
A(33)=R0;
A(34)=H0_1;
A(35)=R0_1;
xlswrite('BOM.xlsx',A,1,'A2')
xlswrite('BOM.xlsx',sigmaigbi',1,'AC2')
xlswrite('BOM.xlsx',sigma0i,1,'AD2')
xlswrite('BOM.xlsx',sigmai',1,'AE2')
xlswrite('BOM.xlsx',sigmaimax',1,'AK2')
xlswrite('BOM.xlsx',sigmadi',1,'AJ2')
xlswrite('BOM.xlsx',gama',1,'AL2')
xlswrite('BOM.xlsx',sigmaimax_1',1,'AN2')
xlswrite('BOM.xlsx',sigmadi_1',1,'AM2')