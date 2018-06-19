%% Auxetic Bezier Surface
syms u v positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 

% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;

% The order of each direction along the Bezier Curve:
%     - NOTE: The control points need to be altered if this is altered. 
n = 4;
m = 4;

% Matrix of Bernstein Polynomial Coefficients:
A = [-1,3,-3,1;3,-6,3,0;-3,3,0,0;1,0,0,0];

for i = 1:1
gamma = 1/4;p11 = 70.*[0,0,0];
p12 = 70.*[1/3, 0, gamma*1/3];
p13 = 70.*[2/3,0,gamma*2/3];
p14 = 70.*[1,0,gamma*1];

p21 = 70.*[0,1/3,gamma*1/3];
p22 = 70.*[1/3,1/3,gamma*4/9];
p23 = 70.*[2/3,1/3,gamma*5/9];
p24 = 70.*[1,1/3,gamma*2/3];

p31 = 70.*[0,2/3,gamma*2/3];
p32 = 70.*[1/3,2/3,gamma*5/9];
p33 = 70.*[2/3,2/3,gamma*4/9];
p34 = 70.*[1,2/3,gamma*1/3];

p41 = 70.*[0,1,gamma*1];
p42 = 70.*[1/3,1,gamma*2/3];
p43 = 70.*[2/3,1,gamma*1/3];
p44 = 70.*[1 ,1,gamma*0];

end  % Declare all the control points, collapsed for clarity
points = {p11,p12,p13,p14;p21,p22,p23,p24;p31,p32,p33,p34;p41,p42,p43,p44};
% 4x4x3 Tensor

% The other half of the Bernstein Polynomials:
ts_u = [u.^3; u.^2; u; 1];
ts_v = [v.^3; v.^2; v; 1];

for i = 1:n
    % Create the Bernstein Polynomial...
    Bu = ts_u(:)'*A;
    for j = 1:m
        % ... and the second one:
        Bv = ts_v(:)'*A;
        % Collect the Bezier Surface as three cartesian parametric
        % equations:
        Px = Px + Bu(i).*Bv(j).*points{i,j}(1);
        Py = Py + Bu(i).*Bv(j).*points{i,j}(2);
        Pz = Pz + Bu(i).*Bv(j).*points{i,j}(3);
    end
end
% Reduce the workload on the processor for later substitution:
Px = simplify(real(Px))
Py = simplify(real(Py))
Pz = simplify(real(Pz))

% pointing the other way

% Graph the Surface:
figure
hold on
fsurf(Px, Py, Pz, [0 1], 'k');
xlim([-0.5 1.5])
ylim([-0.5 1.5])
zlim([0,0.5])
ylabel('Y')
xlabel('X')
zlabel('Z')

%% Creating equation driven auxetic trace:
% Some necessary parameters (now set to match what was done in SolidWorks):
amp = 1/70;
freq = 70;
offset = 3*pi/70;
size_bt = pi/70;
% u is discretized so we can output specific points. 
u = linspace(8/70,60/70,100);
num_lines = 17;

for i = 1:num_lines % creating each row;
    amp = -amp;
    % v is replaced with v' here:
    v = amp*sin(freq*u)+offset;
    % And v' and u are used to create the three new parametric equations:
    z = subs(Pz);
    x_ = subs(Px);
    y_ = subs(Py);
    scatter3(x_,y_,z, 'g.');
    offset = offset + size_bt;
end

offset = 2*pi/70;
% v is discretized so we can output specific points:
v = linspace(8/70, 60/70,100); 

for i = 1:num_lines % and the other direction
    if(i == 1)
        offset = offset + size_bt;
    else
        % We create u':
        u = amp*sin(freq*v)+offset;
        % And sub back in u' and v:
        z = subs(Pz);
        x_ = subs(Px);
        y_ = subs(Py);
        scatter3(x_,y_,z, 'g.');
        offset = offset + size_bt;
        
    end
    % Note this sign change is offset to achieve the auxetic pattern. By
    % altering the offset and this, the pattern can be shifted. 
    amp = -amp;
end