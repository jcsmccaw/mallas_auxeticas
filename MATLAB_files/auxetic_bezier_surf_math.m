%% Auxetic Bezier Surface
clear
%close all
gold = [205/255, 173/255, 0/255]; % Purdue Old Gold Roughly
points_file = 'ANSYS_keypoints_test1.txt';
lines_file = 'ANSYS_lines_test1.txt';

% The order of each direction along the Bezier Curve:
%     - NOTE: The control points need to be altered if this is altered. 
n = 4;
m = 4;

fig_index = [1,5,9,2,6,10, 3,7,11,4,8,12];
q = 2;
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
    

bpoints_u{1} = {p11s,p12s,p13s,p14s;p21s,p22s,p23s,p24s;p31s,p32s,p33s,p34s;p41s,p42s,p43s,p44s};
bpoints_u{2} = {p11v,p12v,p13v,p14v;p21v,p22v,p23v,p24v;p31v,p32v,p33v,p34v;p41v,p42v,p43v,p44v};
bpoints_u{3} = {p11w,p12w,p13w,p14w;p21w,p22w,p23w,p24w;p31w,p32w,p33w,p34w;p41w,p42w,p43w,p44w};
tube_points = {p11,p12,p13,p14,p15;p21,p22,p23,p24,p25;p31,p32,p33,p34,p35};
end  % Declare all the control points, collapsed for clarity
% 4x4x3 Tensor
% The other half of the Bernstein Polynomials:


clear u v Bu Bv Px Py Pz
syms u v positive % This keeps the funky math to a minimum, and is
% necessary for some MATLAB functions not to crap out. 
% Initialize our Cartesian parametric equations:
Px = 0;
Py = 0;
Pz = 0;

for i = 1:n
    % Create the Bernstein Polynomial...
    Bu = nchoosek(int8(n-1), int8(i-1)) .* (u.^(i-1)) .*(1-u).^(n-i);
    for j = 1:m
        % ... and the second one:
        Bv = nchoosek(int8(m-1), int8(j-1)) .* (v.^(j-1)) .*(1-v).^(m-j);
        % Collect the Bezier Surface as three cartesian parametric
        % equations:
        Px = Px + Bu.*Bv.*bpoints_u{q}{i,j}(1);
        Py = Py + Bu.*Bv.*bpoints_u{q}{i,j}(2);
        Pz = Pz + Bu.*Bv.*bpoints_u{q}{i,j}(3);
    end
end
% Reduce the workload on the processor for later substitution:
Px = simplify(real(Px))
Py = simplify(real(Py))
Pz = simplify(real(Pz))

%% Creating equation driven auxetic trace:

        % Some necessary parameters (now set to match what was done in SolidWorks):
amp = 1/70;
freq = 70;
offset = 3*pi/70;
size_bt = pi/70;
% u is discretized so we can output specific points. 
u = linspace(8/70,60/70,100);
num_lines = 17;

points_u = zeros(num_lines,3,100);

for i = 1:num_lines % creating each row;
    amp = -amp;
    % v is replaced with v' here:
    v = amp*sin(freq*u)+offset;
    % And v' and u are used to create the three new parametric equations:
    z = double(subs(Pz));
    x_ = double(subs(Px));
    y_ = double(subs(Py));
    points_u(i,:,:) = [x_; y_; z];
   % scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
    offset = offset + size_bt;
end

offset = 2*pi/70;
% v is discretized so we can output specific points:
v = linspace(8/70, 60/70,100); 

points_v = zeros(num_lines, 3, 100);
        offset = offset + size_bt;
for i = 1:num_lines % and the other direction
    % Note this sign change is offset to achieve the auxetic pattern. By
    % altering the offset and this, the pattern can be shifted. 
    amp = -amp;
        % We create u':
        u = amp*sin(freq*v)+offset;
        % And sub back in u' and v:
        z = double(subs(Pz));
        x_ = double(subs(Px));
        y_ = double(subs(Py));
        points_v(i, :, :) = [x_; y_; z];
        %scatter3(x_,y_,z, '.', 'MarkerFaceColor', gold, 'MarkerEdgeColor', gold);
        offset = offset + size_bt;



end

%% Create ANSYS points:
% Right now, points_u and points_v encompass the key points to be used in
% ANSYS. So now, we need to write them all to one text file as key points.
% Following this, we'll parse through them and connect them all in a
% separate file for lines; when we parse through a second time to add 
% nodes, we'll have both text files open, so we can add the nodes to the 
% key points file and write the connections in the line file.
figure
hold on

point_num = 1;
pointid = fopen(points_file, 'w');
lineid = fopen(lines_file, 'w');

%% Creating ANSYS Lines:
i = 0; j = 0;
line_num_u = 1;
line_num_v = num_lines*100 + 1;
node_tracker = 0;
nodes = cell(17);
recent_node = 0;

for i = 1:num_lines % num U or V lines
    
    node_count = 1;
    node_u = 3*pi/70;
    for j = 1:100
        if j == 1 || j == 100
                              %% No line, just the first point:
            fprintf(pointid, 'K,%d,%f,%f,%f\n', point_num,points_u(i,1,j),points_u(i,2,j),points_u(i,3,j));
            scatter3(points_u(i,1,j),points_u(i,2,j),points_u(i,3,j), 'k.');
            point_num = point_num + 1;
        else
                                %% proceed with line making
            % Make the next point:            
            fprintf(pointid, 'K,%d,%f,%f,%f\n', point_num,points_u(i,1,j),points_u(i,2,j),points_u(i,3,j));
            scatter3(points_u(i,1,j),points_u(i,2,j),points_u(i,3,j), 'k.');
            point_num = point_num + 1;
            
            % Check for a node:
            if (points_u(i,2,j) > node_u) && (points_u(i,2,j) > 0.1)
                % Place node
                % nodes{i,j}(1-3) are the X,Y,Z coordinates of the node. 
                % nodes{i,j}(4) is the point ID number of that node. 
                % Note that the ID numbers of the nodes go in after all other
                % points in the ANSYS file; this should not affect operation. 
                nodes{i, node_count} = [(points_u(i,1,j-1) + points_u(i,1,j))/2, node_u, (points_u(i,3,j-1) + points_u(i,3,j))/2, point_num];
                recent_node = 1;
                
               % Plot the node and advance the point counter:
                scatter3(nodes{i,node_count}(1), nodes{i,node_count}(2), nodes{i,node_count}(3), 'k')
               fprintf(pointid, 'K,%d,%f,%f,%f\n', nodes{i,node_count}(4), nodes{i,node_count}(1), nodes{i,node_count}(2), nodes{i,node_count}(3));
                point_num = point_num + 1; 
                
                % Connect lines to node
                    % Line before node:
                plot3([points_u(i,1,j-1),nodes{i,node_count}(1)], [points_u(i,2,j-1), nodes{i,node_count}(2)], [points_u(i,3,j-1), nodes{i,node_count}(3)],  'g')
                fprintf(lineid, 'L,%d,%d\n', point_num-3, nodes{i,node_count}(4)); % Connect the inline point before the node               

                    % Line after node:
                plot3([nodes{i, node_count}(1),points_u(i,1,j)], [nodes{i, node_count}(2), points_u(i,2,j)], [nodes{i,node_count}(3), points_u(i,3,j)],  'g')
                fprintf(lineid, 'L,%d,%d\n', nodes{i,node_count}(4),  point_num-2); % Connect the inline point after the node      
    
                % Advance the node:
                node_u = node_u + pi/70;
                node_count = node_count + 1;
            else % No node in reach, just connect previous two points in a line
                if(recent_node == 1)
                    fprintf(lineid, 'L,%d,%d\n', point_num-3, point_num-2);
                    plot3([points_u(i,1,j-1),points_u(i,1,j)], [points_u(i,2,j-1),points_u(i,2,j)], [points_u(i,3,j-1), points_u(i,3,j)],  'r')
                    recent_node = 0;
                else
                    fprintf(lineid, 'L,%d,%d\n', point_num-2, point_num-1);
                    plot3([points_u(i,1,j-1),points_u(i,1,j)], [points_u(i,2,j-1),points_u(i,2,j)], [points_u(i,3,j-1), points_u(i,3,j)],  'r')
                end
            end
        end
    end
end
for i = 1:num_lines
    node_count = 1;
    node_v = 3*pi/70;
    for j = 1:100
        if j == 1 || j == 100
                              %% No line, just the first point:
            fprintf(pointid, 'K,%d,%f,%f,%f\n', point_num,points_v(i,1,j),points_v(i,2,j),points_v(i,3,j));
            scatter3(points_v(i,1,j),points_v(i,2,j),points_v(i,3,j), 'k.');
            point_num = point_num + 1;       
        else
                                  %% proceed with line making
            % Make the next point:            
            fprintf(pointid, 'K,%d,%f,%f,%f\n', point_num,points_v(i,1,j),points_v(i,2,j),points_v(i,3,j));
            scatter3(points_v(i,1,j),points_v(i,2,j),points_v(i,3,j), 'k.');
            point_num = point_num + 1;

            % Check for a node:
            if (points_v(i,1,j) > node_v) && (points_v(i,1,j) > 0.1)
                % We aren't going to place a node in this direction, because
                % all nodes are already present. We just need to connect the
                % node to this direction. 
                % Connect lines to node
                    % Line before node: Note that here they connect to the U
                    % node point, rather than interpolating again from the V
                    % points. 
                plot3([points_v(i,1,j-1), nodes{node_count, i}(1)], [points_v(i,2,j-1), nodes{node_count, i}(2)], [points_v(i,3,j-1), nodes{node_count, i}(3)],  'g')
                fprintf(lineid, 'L,%d,%d\n', point_num-3, nodes{node_count, i}(4)); % Connect the inline point before the node   
                recent_node = 1;

                    % Line after node:
                plot3([nodes{node_count, i}(1), points_v(i,1,j)], [nodes{node_count, i}(2), (points_v(i,2,j))], [nodes{node_count, i}(3), points_v(i,3,j)],  'g')
                fprintf(lineid, 'L,%d,%d\n', nodes{node_count, i}(4),  point_num-2); % Connect the inline point after the node      


                 node_v = node_v + pi/70;
                 node_count = node_count + 1;
            else % No node in reach, just continue with the lines
                if(recent_node == 1)
                    fprintf(lineid, 'L,%d,%d\n', point_num-3, point_num-2);
                    plot3([points_u(i,1,j-1),points_u(i,1,j)], [points_u(i,2,j-1),points_u(i,2,j)], [points_u(i,3,j-1), points_u(i,3,j)],  'r')
                    recent_node = 0;
                else
                    fprintf(lineid, 'L,%d,%d\n', point_num-2, point_num-1);
                    plot3([points_u(i,1,j-1),points_u(i,1,j)], [points_u(i,2,j-1),points_u(i,2,j)], [points_u(i,3,j-1), points_u(i,3,j)],  'r')
                end
            end
        end
    end
end

fclose(pointid);
fclose(lineid);

