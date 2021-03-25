clc;clear all;
X=[40.039 40.043 40.040 40.042 40.041 40.043 40.039 40.040 40.041 40.042 40.041 40.039 40.041 40.043 40.041]
N=length(X)
meanx=mean(X(:))
vi=X-meanx
plot(vi)
axis on
grid on
ylabel('²Ð²î')
xlabel('ÐòºÅ')
sigma=sqrt(sum(vi.^2)/(N-1))
sigmax=sigma/sqrt(N)
A=3*sigmax