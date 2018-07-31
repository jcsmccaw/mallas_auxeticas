%% Auxetic Bezier Solid
clear
%close all
gold = [205/255, 173/255, 0/255]; % Purdue Old Gold Roughly

% The order of each direction along the Bezier Curve:
%     - NOTE: The control points need to be altered if this is altered. 
n = 4;
m = 4;
o = 4;

q = 2;
for i = 1:1
% Saddle:
    gamma = 1/4;
%% Layer 1
p11a = [0,0,0];
p12a = [1/3, 0, 0];
p13a = [2/3,0,0];
p14a = [1,0,0];

p21a = [0,1/3,0];
p22a = [1/3,1/3,0];
p23a = [2/3,1/3,0];
p24a = [1,1/3,0];

p31a = [0,2/3,0];
p32a = [1/3,2/3,0];
p33a = [2/3,2/3,0];
p34a = [1,2/3,0];

p41a = [0,1,0];
p42a = [1/3,1,0];
p43a = [2/3,1,0];
p44a = [1 ,1,0];

%% Layer 2
p11b = [0,0,0 + 1/3];
p12b = [1/3, 0, gamma*1/3 + 1/3];
p13b = [2/3,0,gamma*2/3 + 1/3];
p14b = [1,0,gamma*1 + 1/3];

p21b = [0,1/3,gamma*1/3 + 1/3];
p22b = [1/3,1/3,gamma*4/9 + 1/3];
p23b = [2/3,1/3,gamma*5/9 + 1/3];
p24b = [1,1/3,gamma*2/3 + 1/3];

p31b = [0,2/3,gamma*2/3 + 1/3];
p32b = [1/3,2/3,gamma*5/9 + 1/3];
p33b = [2/3,2/3,gamma*4/9 + 1/3];
p34b = [1,2/3,gamma*1/3 + 1/3];

p41b = [0,1,gamma*1 + 1/3];
p42b = [1/3,1,gamma*2/3 + 1/3];
p43b = [2/3,1,gamma*1/3 + 1/3];
p44b = [1 ,1,gamma*0 + 1/3];

%% Layer 3
p11c = [0,0,0];
p12c = [1/3, 0, gamma*1/3 + 2/3];
p13c = [2/3,0,gamma*2/3 + 2/3];
p14c = [1,0,gamma*1 + 2/3];

p21c = [0,1/3,gamma*1/3 + 2/3];
p22c = [1/3,1/3,gamma*4/9 + 2/3];
p23c = [2/3,1/3,gamma*5/9 + 2/3];
p24c = [1,1/3,gamma*2/3 + 2/3];

p31c = [0,2/3,gamma*2/3 + 2/3];
p32c = [1/3,2/3,gamma*5/9 + 2/3];
p33c = [2/3,2/3,gamma*4/9 + 2/3];
p34c = [1,2/3,gamma*1/3 + 2/3];

p41c = [0,1,gamma*1 + 2/3];
p42c = [1/3,1,gamma*2/3 + 2/3];
p43c = [2/3,1,gamma*1/3 + 2/3];
p44c = [1 ,1,gamma*0 + 2/3];

%% Layer 4
p11d = [0,0,1];
p12d = [1/3, 0, 1];
p13d = [2/3,0,1];
p14d = [1,0,1];

p21d = [0,1/3,1];
p22d = [1/3,1/3,1];
p23d = [2/3,1/3,1];
p24d = [1,1/3,1];

p31d = [0,2/3,1];
p32d = [1/3,2/3,1];
p33d = [2/3,2/3,1];
p34d = [1,2/3,1];

p41d = [0,1,1];
p42d = [1/3,1,1];
p43d = [2/3,1,1];
p44d = [1 ,1,1];
bpoints_a = {p11a,p12a,p13a,p14a;p21a,p22a,p23a,p24a;p31a,p32a,p33a,p34a;p41a,p42a,p43a,p44a};
bpoints_b = {p11b,p12b,p13b,p14b;p21b,p22b,p23b,p24b;p31b,p32b,p33b,p34b;p41b,p42b,p43b,p44b};
bpoints_c = {p11c,p12c,p13c,p14c;p21c,p22c,p23c,p24c;p31c,p32c,p33c,p34c;p41c,p42c,p43c,p44c};
bpoints_d = {p11d,p12d,p13d,p14d;p21d,p22d,p23d,p24d;p31d,p32d,p33d,p34d;p41d,p42d,p43d,p44d};

points = cat(3, bpoints_a, bpoints_b, bpoints_c, bpoints_d);

end  % Declare all the control points, collapsed for clarity
% 4x4x3 Tensor
% The other half of the Bernstein Polynomials:


clear u v p Bu Bv Bp Px Py Pz
syms u v p positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 
% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;

figure
hold on
for i = 1:n
    % Create the Bernstein Polynomial...
    Bu = nchoosek(int8(n-1), int8(i-1)) .* (u.^(i-1)) .*(1-u).^(n-i);
    for j = 1:m
        % ... and the second one:
        Bv = nchoosek(int8(m-1), int8(j-1)) .* (v.^(j-1)) .*(1-v).^(m-j);
        for k = 1:o
            % And the third dimension.
            Bp = nchoosek(int8(o-1), int8(k-1)) .* (p.^(k-1)) .*(1-p).^(o-p);
            % Collect the Bezier Surface as three cartesian parametric
            % equations:
            Px = Px + Bu.*Bv.*Bp.*points{i,j,k}(1);
            Py = Py + Bu.*Bv.*Bp.*points{i,j,k}(2);
            Pz = Pz + Bu.*Bv.*Bp.*points{i,j,k}(3);
            
            % Plot the control points so we can keep track of them:
            scatter3(points{i,j,k}(1), points{i,j,k}(2), points{i,j,k}(3), 'r.')
        end
    end
end
% Reduce the workload on the processor for later substitution:
Px = simplify(real(Px));
Py = simplify(real(Py));
Pz = simplify(real(Pz));

%% Plotting: 
figure
hold on
u = linspace(0,0.999);
v = linspace(0,0.999);
p = linspace(0,0.999);


for i = 1:100
    for j = 1:100
        x_(i,j,:) = subs(Px);
        y_(i,j,:) = subs(Py);
        z_(i,j,:) = subs(Pz);
    end
end
% 
scatter3(x_, y_, z_)

% %% Creating equation driven auxetic trace:
% 
%         % Some necessary parameters (now set to match what was done in SolidWorks):
% amp = 1/70;
% freq = 70;
% offset = 3*pi/70;
% size_bt = pi/70;
% % u is discretized so we can output specific points. 
% u = linspace(8/70,60/70,100);
% num_lines = 17;
% 
% points_u = zeros(num_lines,3,100);
% 
% for i = 1:num_lines % creating each row;
%     amp = -amp;
%     % v is replaced with v' here:
%     v = amp*sin(freq*u)+offset;
%     % And v' and u are used to create the three new parametric equations:
%     z = double(subs(Pz));
%     x_ = double(subs(Px));
%     y_ = double(subs(Py));
%     points_u(i,:,:) = [x_; y_; z];
%    % scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
%     offset = offset + size_bt;
% end
% 
% offset = 2*pi/70;
% % v is discretized so we can output specific points:
% v = linspace(8/70, 60/70,100); 
% 
% points_v = zeros(num_lines, 3, 100);
%         offset = offset + size_bt;
% for i = 1:num_lines % and the other direction
%     % Note this sign change is offset to achieve the auxetic pattern. By
%     % altering the offset and this, the pattern can be shifted. 
%     amp = -amp;
%         % We create u':
%         u = amp*sin(freq*v)+offset;
%         % And sub back in u' and v:
%         z = double(subs(Pz));
%         x_ = double(subs(Px));
%         y_ = double(subs(Py));
%         points_v(i, :, :) = [x_; y_; z];
%         %scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
%         offset = offset + size_bt;
% end
