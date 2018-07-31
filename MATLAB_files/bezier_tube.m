%% Bezier tube
    clear u v Bu Bv Px Py Pz
    syms u v positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 
% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;
n = 4;
m = 4;
n_tube = 3;
m_tube = 5;
% A_tube_u = [-1,4,-6,4,-1;4,-12,12,4,0;-6,12,6,0,0;4,4,0,0,0;-1,0,0,0,0];
% A_tube_v = [-1, 2, -1; 2, 1, 0; -1, 0, 0];
%     ts_u = [u.^4; u.^3; u.^2; u; 1];
%     ts_v = [v.^2; v; 1];
%     

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

points{1} = {p11s,p12s,p13s,p14s;p21s,p22s,p23s,p24s;p31s,p32s,p33s,p34s;p41s,p42s,p43s,p44s};
    
    % Bernstein in matlab: b = nchoosek(n, i) * (u^i) *(1-u)^(n-i);
    for i = 1:n_tube % 3
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
    
    
figure
subplots = tight_subplot(1,3,[.0 .0],[0 .0],[.0 .0]);
hold on
    
    % Graph the Surface:
    %subplot(3,3,3*q-2)
     axes(subplots(1));
hold on
    fsurf(Px, Py, Pz, [0 1], 'k');
    xlim([-0.1 1.1])
    ylim([-0.1 1.1])
    zlim([-0.1,0.4])
%     xlabel('X')
%     ylabel('Y')
%     zlabel('Z')
%     for i = 1:numel(tube_points)
%         scatter3(tube_points{i}(1), tube_points{i}(2), tube_points{i}(3), 'r*')
%     end
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
%     text(0.5,0.5,0, letters(3*q-2))
    
    
    %subplot(3,3,3*q-1)
    axes(subplots(2));
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
    axes(subplots(3));
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
    q=1;
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
    axes(subplots((g)));
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