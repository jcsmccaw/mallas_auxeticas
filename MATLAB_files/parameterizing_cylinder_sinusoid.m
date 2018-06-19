%% Parameterization of a sinusoid along a cylindrical section

theta = linspace(-45,45);
r = 10;
t = linspace(0,5*pi);

x = r*sind(theta);
y = 0.1*sin(2.5*t);
z = r*cosd(theta);

scatter3(x,y,z)
xlim([-1.1*r 1.1*r])
ylim([-1 1])
zlim([0 1.1*r])