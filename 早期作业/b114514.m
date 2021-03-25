x=[1 2 3 4 5];
y=[1 3 5 7 114514];
p=polyfit(x,y,8)
f=poly2sym(p)
x0=5
polyval(p,x0)