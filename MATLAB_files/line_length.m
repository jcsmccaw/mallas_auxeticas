%% Arc Length of a Parametric Equation
syms t
y = t;
x = t; %1/70*1.25*sin((140)*t);
z = 3*x*y*(x-1)*(y-1);

dx = diff(x, t);
dy = diff(y, t);
dz = diff(z, t);

eq = sqrt((dx)^2 + (dy)^2 + (dz)^2);

vpaintegral(eq, t, [0.1 0.6])
% L = int(eq, t, [0 50]);
% vpa(L)