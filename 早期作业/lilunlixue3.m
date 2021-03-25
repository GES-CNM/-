m1=50;m2=40;k=2000;g=10;L=0.5;
dS=@(t,S) [S(2);
    ((m1+m2)*g*sin(S(1))+2*m2*L*(S(2)^2)*sin(S(1))*cos(S(1))-2*k*S(3)*cos(S(1)))/(4*m2*L*cos(S(1)^2)-4*(m1+m2)*L);
    S(3);
    (m2*g*sin(S(1))*cos(S(1))+2*m2*L*(S(2)^2)*sin(S(1))-2*k*S(3))/(2*(m1+m2)-2*m2*cos(S(1)^2))];
[t,y] = ode45(dS,[0 20],[0;0;0.5;0]);
plot(t,y(:,1),t,y(:,2));
title('»¬¿é°Ú¸Ë»ú¹¹');
xlabel('t');ylabel('X(t) Y(t)');
legend('X(t)','Y(t)')