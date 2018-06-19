%% Sinusoidal path sandbox

t = linspace(0,pi,1000);
theta = linspace(0,pi,1000);

f = sin(t);
%plot(t,f)

figure

x = sin(2*t);
y = cos(t);
z = sin(4.*t);

scatter3(x,y,z)

%figure

x = cos(t.*cos(theta) - sin(theta).*sin(4*t));
y = sin(t.*cos(theta) - sin(theta).*sin(4*t));
z = t.*sin(theta) + cos(theta).*sin(4*t);
%scatter3(x,y,z)

