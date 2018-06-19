%% Bezier Surface Sandbox

%detail = 50;
syms u v positive
Px = 0;
Py = 0;
Pz = 0;

% Matrix of Bernstein Polynomial Coefficients:
A = [-1,3,-3,1;3,-6,3,0;-3,3,0,0;1,0,0,0];

for i = 1:1
    gamma = 1/4;
p11 = [0,0,gamma];
p12 = [1/3, 0, gamma*1/3];
p13 = [2/3,0.1,gamma*2/3];
p14 = [1,0.1,0.1*gamma];

p21 = [0,1/3,gamma*1/3];
p22 = [1/3,1/3,gamma*1/9];
p23 = [2/3,1/3,gamma*9/9];
p24 = [1,1/3,gamma*2/3];

p31 = [0,2/3,gamma*2/3];
p32 = [1/3,2/3,gamma*1/9];
p33 = [2/3,2/3,gamma*9/9];
p34 = [1,2/3,gamma*1/3];

p41 = [0,0.6,gamma*1/3];
p42 = [1/3,1,gamma*2/3];
p43 = [2/3,1,gamma*1/3];
p44 = [1.35 ,1,gamma*0];


end  % Declare all the points

points = {p11,p12,p13,p14;p21,p22,p23,p24;p31,p32,p33,p34;p41,p42,p43,p44};

ts_u = [u.^3; u.^2; u; 1];%ones(1,length(u))];
ts_v = [v.^3; v.^2; v; 1];% ones(1,length(v))];

for i = 1:4    
    Bu = ts_u(:)'*A;
    for j = 1:4
        Bv = ts_v(:)'*A;
        Px = Px + Bu(i).*Bv(j).*points{i,j}(1);
        Py = Py + Bu(i).*Bv(j).*points{i,j}(2);
        Pz = Pz + Bu(i).*Bv(j).*points{i,j}(3);
    end
end
Px = simplify(real(Px))
Py = simplify(real(Py))
Pz = simplify(real(Pz))

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
amp = 1/70;
freq = 70;
offset = 3*pi/70;
size_bt = pi/70;
u = linspace(8/70,60/70,100);
num_lines = 17;

for i = 1:num_lines % creating each row;
    amp = -amp;
    v = amp*sin(freq*u)+offset;
    z = subs(Pz);
    x_ = subs(Px);
    y_ = subs(Py);
    scatter3(x_,y_,z, 'g.');
    offset = offset + size_bt;
end

offset = 2*pi/70;
v = linspace(8/70, 60/70,100); 

for i = 1:num_lines % and the other direction

    if(i == 1)
        offset = offset + size_bt;
    else
        
    u = amp*sin(freq*v)+offset;
    z = (subs(Pz));
    x_ = subs(Px);
    y_ = subs(Py);
    scatter3(x_,y_,z, 'g.');
    offset = offset + size_bt;
    end
    amp = -amp;
end


%% Back-solving for u and v as functions of x,y, and z:
% syms x y z
% S = solve([Px-x, Py-y, Pz-z, u <= 1, u >=0, v >= 0, v <= 1], [x,y,z], 'ReturnConditions', true, 'IgnoreAnalyticConstraints', true);
% S.u
% S.v
% S.z
%figure
%hold on
%fsurf(f_u)



% for l = 1:length(u)
%     P(:,3,l) = P(:,3,l) + offset;
%     scatter3(P(:,1,l), P(:,2,l), P(:,3,l))
% end
%scatter3(P(:,1),P(:,2),P(:,3))

   % P = (Bu(1)*Bv(1).*p11 + Bu(1)*Bv(2).*p12 + Bu(1)*Bv(3).*p13 + Bu(1)*Bv(4).*p14)...
    %    + Bu(2)*Bv(1).*p21 + Bu(2)*Bv(2).*p22 + Bu(2)*Bv(3).*p23 + Bu(2);