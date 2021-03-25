function dx=myfun(t,x)
dx=[x(2);5/3+4/3*(x(4)-x(2))-1/3*cos(x(1));x(4);sin(t)+5/4*(x(2)-x(4))-1/4*(x(3))]