%% GCODE for 3D Bezier Surface printing:
%   This script creates a bezier surface of points (discretized) based off
%   of 16 control points. The bezier curve is constructed from the
%   analytical form of the tensor product of the two parameterized curves,
%   v(t) and u(t). It also takes the following inputs:
%       detail = the matrix of 3D points is of dimension detail x detail. 
%
%       skip = the number of rows to skip when creating the gcode -- this
%       controls the porosity.
%
%       filename = this is a string that determines the filename where the
%       gcode will be written. Note: this program opens the file with
%       append permissions, and will not overwrite a file. 
%
%       feed = mm/min feed rate of the printer. 
%
%       ext = the extrusion rate of the fdm printer. 
%
%       step = the layer height between bezier surfaces.
%
%       num_layers = number of total layers to be extruded, separated by
%       'step' layer height. 

close all; clc;
% Controls
detail = 100; % The matrix of points will be detail x detail size. 

skip = 1; % must be a divisor of detail (for now, FIXME). 
% Skip is the number of rows skipped when outputting the gcode to achieve
% different porosities. Right now, the focus isn't on achieving specific
% porosities but achieving control over porosity in general. 

filename = 'hat_trick_bottom_third_layer_justincase.gcode'; % Where the gcode will be written

feed = 800; % mm/min, feed rate of the printer's motion

ext = 150*150*1.5*0.0205; % Extrusion rate of the printer

E = 0; % The total extrusion, sums throughout print

step = 0.2; % The layer height between bezier surfaces

num_layers = 2; % The number of layers to print


% Control Points:
% First bounding bezier curve (the other is 11 21 31 41 series):
delta = 20; %mm
gamma = 1/4; %mm
p11 = 70.*[0,0,0];
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



% Cell array of points to make life easier:
points = {p11,p12,p13,p14;p21,p22,p23,p24;p31,p32,p33,p34;p41,p42,p43,p44};


%% Create the Bezier Surface
P = zeros(detail,3,detail); % pre-allot memory for speed

P = create_bezier_surf(detail, points, P);


    % also plot it while you're at it
 figure
 hold on
 for q = 1:detail
     scatter3(P(:,1,q), P(:,2,q), P(:,3,q))
 end



%% Prepare data for the opposite trace, skip necessary rows, and write GCODE:

% First, swap the u and v directions of P (P is currently two vectors by a
% point, so it's u by v with each of these being a row of 3 (xyz) values.
P_opposite = permute(P, [3,2,1]);
% The permute function swaps the n m p dimensions in the order described in the
% vector, so [3,2,1] puts the third dimension as now the first dimension,
% the second doesn't change (this is the 3 xyz points), and the first
% dimension in the third dimension. 

[P_skipped, new_detail] = skip_rows(P, skip, detail);
[P_opposite_skipped,~] = skip_rows(P_opposite, skip, detail);

% Also scale:
P_skipped = round(P_skipped,3); P_opposite_skipped = round(P_opposite_skipped,3);

% Find the lowest point in the new Bezier surface and make this the zero:
offset = min([(min(min(P_skipped(:,3,:)))), min(min(P_opposite_skipped(:,3,:)))]); 

for t = 1:new_detail
    P_skipped(:,3,t) = P_skipped(:,3,t) - offset; % add the offset
    P_opposite_skipped(:,3,t) = P_opposite_skipped(:,3,t) - offset;
    % FIXME : Add in correction for when the offset is positive to drop the
    % points down to the print bed
end

% Translations:
 P_skipped(:,1,:) = P_skipped(:,1,:) + 35; % 35mm offset for all x
 P_skipped(:,2,:) = P_skipped(:,2,:) + 35;
 P_skipped(:,3,:) = P_skipped(:,3,:) + 11.9;
 P_opposite_skipped(:,1,:) = P_opposite_skipped(:,1,:) + 35; % 35mm offset for all x
 P_opposite_skipped(:,2,:) = P_opposite_skipped(:,2,:) + 35;
 P_opposite_skipped(:,3,:) = P_opposite_skipped(:,3,:) + 11.9;

%% Prep File:
fid = fopen(filename, 'a');


% Raise the z-height of the next layer: 
for i = 1:num_layers
    % Decide whether the layer is odd or even: 
    if mod(i,2) == 1
        passer = P_skipped; % we're on an odd layer, so we'll print in the original direction
    else
        passer = P_opposite_skipped;% we're on an even layer, so we'll print orthagonal to the original direction
    end
    
    % Raise the layer by the z-step size:
    if i ~= 1
        for b = 1:new_detail
            passer(:,3,b) = passer(:,3,b) + (i-1)*step;
        end
    end
    
    %% Output the layer to text file:
    % recall that curr_layer == i;
    % Check and apply traverse mode as needed:
    if i ~= 1 && mod(i, 2) == 1
        % traverse(passer,last_point,fid, 1000, ext); % Traverse mode
    end
    
    last_point = (passer(end,:,end)); % this point helps us connect the layers
    
    %gcode_output( 1, last_point, passer, i, detail,new_detail, feed, ext, filename) % Normal layer output mode
    E = gcode_output_test(passer, detail, new_detail, i,feed, last_point, ext, E, fid);
end
fclose(fid);

%% Write a csv for point cloud generation:
data = zeros(3,detail.^2);
skipped_data = zeros(3,new_detail.^2);

temp = zeros(detail, 3);
tiny_temp = zeros(new_detail,3);

for counter = 1:detail
    temp = squeeze(P(counter,:,:));
    %temp90 = squeeze(P_opposite(counter,:,:));
    
    tiny_temp = squeeze(P_opposite_skipped(counter,:,:)/100);
    tiny_temp90 = squeeze(P_skipped(counter,:,:)/100);
    
    data(:,detail*(counter - 1) + 1:detail*counter) = temp;
    %data90(:,detail*(counter - 1) + 1:detail*counter) = temp90;
    
    skipped_data(:,new_detail*(counter - 1) + 1:new_detail*counter) = tiny_temp;
    skipped_data90(:,new_detail*(counter - 1) + 1:new_detail*counter) = tiny_temp90;
    
end

csvwrite('C:/Users/JC/Documents/Verano 2018/vanilla_skip5_FINAL.xyz',skipped_data')
csvwrite('C:/Users/JC/Documents/Verano 2018/vanilla_skip5_90deg_FINAL.xyz',skipped_data90')
