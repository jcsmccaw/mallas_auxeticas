%% Auxetic Bezier Surface

gold = [205/255, 173/255, 0/255];

% The order of each direction along the Bezier Curve:
%     - NOTE: The control points need to be altered if this is altered. 
n = 4;
m = 4;
n_tube = 3;
m_tube = 5;

% Matrix of Bernstein Polynomial Coefficients:
% A = [-1,3,-3,1;3,-6,3,0;-3,3,0,0;1,0,0,0];
letters = ['A','B','C', 'D', 'E', 'F','G','H','I','J','K'];
fig_index = [1,5,9,2,6,10, 3,7,11,4,8,12];

for i = 1:1
% Saddle:
    gamma = 1/4;
p11s = [0,0,0];
p12s = [1/3, 0, gamma*1/3];
p13s = [2/3,0,gamma*2/3];
p14s = [1,0,gamma*1];

p21s = [0,1/3,gamma*1/3];
p22s = [1/3,1/3,gamma*4/9];
p23s = [2/3,1/3,gamma*5/9];
p24s = [1,1/3,gamma*2/3];

p31s = [0,2/3,gamma*2/3];
p32s = [1/3,2/3,gamma*5/9];
p33s = [2/3,2/3,gamma*4/9];
p34s = [1,2/3,gamma*1/3];

p41s = [0,1,gamma*1];
p42s = [1/3,1,gamma*2/3];
p43s = [2/3,1,gamma*1/3];
p44s = [1 ,1,gamma*0];

% Vanilla
p11v = [0,0,0];
p12v = [1/3, 0, 0];
p13v = [2/3,0,0];
p14v = [1,0,0];

p21v = [0,1/3,0];
p22v = [1/3,1/3,1/3];
p23v = [2/3,1/3,1/3];
p24v = [1,1/3,0];

p31v = [0,2/3,0];
p32v = [1/3,2/3,1/3];
p33v = [2/3,2/3,1/3];
p34v = [1,2/3,0];

p41v = [0,1,0];
p42v = [1/3,1,0];
p43v = [2/3,1,0];
p44v = [1 ,1,0];

% Weird 1:
p11w = [0,0,gamma];
p12w = [1/3, 0, gamma*1/3];
p13w = [2/3,0.1,gamma*2/3];
p14w = [1,0.1,0.1*gamma];

p21w = [0,1/3,gamma*1/3];
p22w = [1/3,1/3,gamma*1/9];
p23w = [2/3,1/3,gamma*9/9];
p24w = [1,1/3,gamma*2/3];

p31w = [0,2/3,gamma*2/3];
p32w = [1/3,2/3,gamma*1/9];
p33w = [2/3,2/3,gamma*9/9];
p34w = [1,2/3,gamma*1/3];

p41w = [0,0.6,gamma*1/3];
p42w = [1/3,1,gamma*2/3];
p43w = [2/3,1,gamma*1/3];
p44w = [1/3 ,1/3,gamma*0];

% Tube:

p11 = [0.25,0,0.25];
p12 = [0,0,0.4];
p13 = [1,0,0.4];
p14 = [1,0,0.15];
p15 = [0.25,0,0.25];

p21 = [0,0.25,0.15];
p22 = [0,0.25,0.5];
p23 = [1,0.25,0.5];
p24 = [1,0.25,0.15];
p25 = [0,0.25,0.15];

p31 = [0,0.8,0.1];
p32 = [0,0.8,0.1];
p33 = [0,0.8,0.1];
p34 = [0,0.8,0.1];
p35 = [0,0.8,0.1];
    
tube_points = {p11,p12,p13,p14,p15;p21,p22,p23,p24,p25;p31,p32,p33,p34,p35};



points{1} = {p11s,p12s,p13s,p14s;p21s,p22s,p23s,p24s;p31s,p32s,p33s,p34s;p41s,p42s,p43s,p44s};
points{2} = {p11v,p12v,p13v,p14v;p21v,p22v,p23v,p24v;p31v,p32v,p33v,p34v;p41v,p42v,p43v,p44v};
points{3} = {p11w,p12w,p13w,p14w;p21w,p22w,p23w,p24w;p31w,p32w,p33w,p34w;p41w,p42w,p43w,p44w};
tube_points = {p11,p12,p13,p14,p15;p21,p22,p23,p24,p25;p31,p32,p33,p34,p35};
end  % Declare all the control points, collapsed for clarity
% 4x4x3 Tensor
% The other half of the Bernstein Polynomials:

figure
subplots = tight_subplot(3,4,[.0 .0],[0 .0],[.0 .0]);
hold on
for q = 1:3
    clear u v Bu Bv Px Py Pz
    syms u v positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 
% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;
% 
%     ts_u = [u.^3; u.^2; u; 1];
%     ts_v = [v.^3; v.^2; v; 1];

    for i = 1:n
        % Create the Bernstein Polynomial...
        Bu = nchoosek(int8(n-1), int8(i-1)) .* (u.^(i-1)) .*(1-u).^(n-i);
        for j = 1:m
            % ... and the second one:
            Bv = nchoosek(int8(m-1), int8(j-1)) .* (v.^(j-1)) .*(1-v).^(m-j);
            % Collect the Bezier Surface as three cartesian parametric
            % equations:
            Px = Px + Bu.*Bv.*points{q}{i,j}(1);
            Py = Py + Bu.*Bv.*points{q}{i,j}(2);
            Pz = Pz + Bu.*Bv.*points{q}{i,j}(3);
        end
    end
    % Reduce the workload on the processor for later substitution:
    Px = simplify(real(Px))
    Py = simplify(real(Py))
    Pz = simplify(real(Pz))

    % pointing the other way

    % Graph the Surface:
    %subplot(3,3,3*q-2)
    axes(subplots(fig_index(3*q-2)));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(0,0); % xz plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, ', XZ Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(0.5,0.5,0, letters(3*q-2))
    
    
    %subplot(3,3,3*q-1)
    axes(subplots(fig_index(3*q-1)));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(90,0) % yz plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, 'YZ Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(-0.1,0.5, letters(3*q-1))
    
   % subplot(3,3,3*q)
    axes(subplots(fig_index(3*q)));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(90,90); % xy plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, 'XY Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(1,0.5,-0.1, letters(3*q))
    %% Creating equation driven auxetic trace:

    for g = 1:3
            % Some necessary parameters (now set to match what was done in SolidWorks):
    amp = 1/70;
    freq = 70;
    offset = 3*pi/70;
    size_bt = pi/70;
    % u is discretized so we can output specific points. 
    u = linspace(8/70,60/70,100);
    num_lines = 17;
        %subplot(3,3, 3*q-g+1)
    axes(subplots(fig_index(3*q-g+1)));
        hold on
        for i = 1:num_lines % creating each row;
            amp = -amp;
            % v is replaced with v' here:
            v = amp*sin(freq*u)+offset;
            % And v' and u are used to create the three new parametric equations:
            z = subs(Pz);
            x_ = subs(Px);
            y_ = subs(Py);
            scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
            offset = offset + size_bt;
        end

        offset = 2*pi/70;
        % v is discretized so we can output specific points:
        v = linspace(8/70, 60/70,100); 

        for i = 1:num_lines+1 % and the other direction
            if(i == 1)
                offset = offset + size_bt;
            else
                % We create u':
                u = amp*sin(freq*v)+offset;
                % And sub back in u' and v:
                z = subs(Pz);
                x_ = subs(Px);
                y_ = subs(Py);
                scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
                offset = offset + size_bt;
                

            end
            % Note this sign change is offset to achieve the auxetic pattern. By
            % altering the offset and this, the pattern can be shifted. 
            amp = -amp;
        end
    end
end

%% TUUBBEE

%set(gcf, 'Position', [0, 0, 670, 800])
    clear u v Bu Bv Px Py Pz
    syms u v positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 
% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;

    % Bernstein in matlab: b = nchoosek(n, i) * (u^i) *(1-u)^(n-i);
    for i = 1:n_tube % 5
        % Create the Bernstein Polynomial...
        Bu = nchoosek(int8(n_tube-1), int8(i-1)) .* (u.^(i-1)) .*(1-u).^(n_tube-i);
        for j = 1:m_tube % 5
            % ... and the second one:
            Bv = nchoosek(int8(m_tube-1), int8(j-1)) .* (v.^(j-1)) .*(1-v).^(m_tube-j);
            % Collect the Bezier Surface as three cartesian parametric
            % equations:
            Px = Px + Bu.*Bv.*tube_points{i,j}(1);
            Py = Py + Bu.*Bv.*tube_points{i,j}(2);
            Pz = Pz + Bu.*Bv.*tube_points{i,j}(3);
        end
    end
    % Reduce the workload on the processor for later substitution:
    Px = simplify(real(Px));
    Py = simplify(real(Py));
    Pz = simplify(real(Pz));
    
    
    
    % Graph the Surface:
    %subplot(3,3,3*q-2)
    axes(subplots(4));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(0,0); % xz plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, ', XZ Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(0.5,0.5,0, letters(3*q-2))
    
    
    %subplot(3,3,3*q-1)
    axes(subplots(8));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(90,0) % yz plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, 'YZ Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(-0.1,0.5, letters(3*q-1))
    
   % subplot(3,3,3*q)
    axes(subplots(12));
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
    view(90,90); % xy plane
    %fignum = num2str(q);
    %title_str = strcat('Surface ', fignum, 'XY Plane');
    %title(title_str);
    set(gca, 'xtick', []);
    set(gca, 'ytick', []);
    set(gca, 'ztick', []);
    set(gca, 'xlabel', []);
    set(gca, 'ylabel', []);
    set(gca, 'zlabel', []);
    %text(1,0.5,-0.1, letters(3*q))
    
    %% Auxetic Traces on the cone:
    q=4;
    for g = 1:3
            % Some necessary parameters (now set to match what was done in SolidWorks):
    amp = 1/70;
    freq = 70;
    offset = 3*pi/70;
    size_bt = pi/70;
    % u is discretized so we can output specific points. 
    u = linspace(8/70,60/70,100);
    num_lines = 17;
        %subplot(3,3, 3*q-g+1)
    axes(subplots(fig_index(3*q-g+1)));
        hold on
        for i = 1:num_lines % creating each row;
            amp = -amp;
            % v is replaced with v' here:
            v = amp*sin(freq*u)+offset;
            % And v' and u are used to create the three new parametric equations:
            z = subs(Pz);
            x_ = subs(Px);
            y_ = subs(Py);
            scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
            offset = offset + size_bt;
        end

        offset = 2*pi/70;
        % v is discretized so we can output specific points:
        v = linspace(8/70, 60/70,100); 

        for i = 1:num_lines+1 % and the other direction
            if(i == 1)
                offset = offset + size_bt;
            else
                % We create u':
                u = amp*sin(freq*v)+offset;
                % And sub back in u' and v:
                z = subs(Pz);
                x_ = subs(Px);
                y_ = subs(Py);
                scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
                offset = offset + size_bt;
                

            end
            % Note this sign change is offset to achieve the auxetic pattern. By
            % altering the offset and this, the pattern can be shifted. 
            amp = -amp;
        end
    end