%% Non-auxetic trace filtering and parsing into GCODE:

pfeed = 600; % FIXME: adjust by printer 'Print Feed'
const = 1.50*1.50*0.0205; % FIXME: Adjust by printer
rfeed = 2000; % FIXME: adjust by printer. 'Rapid Feed'
rapid_height = 30; % The height (mm) at which rapid motions happen. 30 for saddle, 20 for others
E = 0; % Extrusion counter
num_layers = 4; % Number of times we'll print the whole sucker. 4 for 70x70, 2 otherwise.
layer_height = 0.2; % mm
output_filename = 'bezier_vanilla_nonAux_skip5_4layers.gcode';

%% Filter and subselect:
data = load('C:\Users\JC\Documents\Verano 2018/vanilla_skip5_FINAL.xyz'); % FIXME This should be changed to your data
data90 = load('C:\Users\JC\Documents\Verano 2018/vanilla_skip5_90deg_FINAL.xyz'); % FIXME This should be changed to your data

% Only for 70x70 traces:
% thinned = data(701:4200,:); 
figure
scatter3(data(:,1), data(:,2), data(:,3), 'bo')
hold on
scatter3(data90(:,1), data90(:,2), data90(:,3), 'r*')

% Uncomment For skip10:
% vects2 = data(2:7:end,:);
% vects3 = data(3:7:end,:);
% vects4 = data(4:7:end,:);
% vects5 = data(5:7:end,:);
% vects6 = data(6:7:end,:);
% vects7 = data(7:7:end, :);
% 
% vects290 = data90(2:7:end,:);
% vects390 = data90(3:7:end,:);
% vects490 = data90(4:7:end,:);
% vects590 = data90(5:7:end,:);
% vects690 = data90(6:7:end,:);
% vects790 = data90(7:7:end, :);


% Uncomment for skip5:
vects3 = data(3:14:end,:);
vects4 = data(4:14:end,:);
vects5 = data(5:14:end,:);
vects6 = data(6:14:end,:);
vects7 = data(7:14:end,:);
vects8 = data(8:14:end,:);
vects9 = data(9:14:end,:);
vects10 = data(10:14:end,:);
vects11 = data(11:14:end,:);
vects12 = data(12:14:end,:);
vects13 = data(13:14:end,:);


vects390 = data90(3:14:end,:);
vects490 = data90(4:14:end,:);
vects590 = data90(5:14:end,:);
vects690 = data90(6:14:end,:);
vects790 = data90(7:14:end,:);
vects890 = data90(8:14:end,:);
vects990 = data90(9:14:end,:);
vects1090 = data90(10:14:end,:);
vects1190 = data90(11:14:end,:);
vects1290 = data90(12:14:end,:);
vects1390 = data90(13:14:end,:);


% Uncomment for skip10:
%thinned = [vects2', vects3', vects4', vects5', vects6', vects7']';
%thinned90 = [vects290', vects390', vects490', vects590', vects690', vects790']';

% Uncomment for skip5:
thinned = [vects3', vects4', vects5', vects6', vects7', vects8', vects9', vects10', vects11', vects12', vects13']';
thinned90 = [vects390', vects490', vects590', vects690', vects790', vects890', vects990', vects1090', vects1190', vects1290', vects1390']';


intermediate = [thinned; thinned90];
figure
hold on
scatter3(intermediate(:,1), intermediate(:,2), intermediate(:,3))


figure
hold on
scatter3(thinned(:,1), thinned(:,2), thinned(:,3), 'b.')
scatter3(thinned90(:,1), thinned90(:,2), thinned90(:,3), 'ro')
view(120, 20);

%Uncomment for 70x70:
%new_data = zeros(50*50,3);
%Uncomment for skip10:
%new_data = zeros(12*50, 3);
%Uncomment for skip5:
new_data = zeros(22*50,3);
for i = 1:22 % 50 for 70x70, 12 for skip 10, 22 for skip5
    if i ~= 22 % change with the above
        new_data(((i-1)*50 + 1):(i*50 + 1),:) = intermediate(((i-1)*70+11):((i*70)-9),:);
    else
        new_data(((i-1)*50 + 1):(i*50),:) = intermediate(((i-1)*70+11):((i*70)-10),:);
    end
end
figure
hold on
scatter3(new_data(:,1), new_data(:,2), new_data(:,3))

% Uncomment for 70x70:
% %% Rotate 90 degrees for cross-hatching:
% cellular = zeros(50,50,3);
% rotated = zeros(50*50, 3);
% for n = 1:50
%     cellular(1:50,n,:) = new_data(((n-1)*50+1):(n*50), :);
% end
% for n = 1:50 
%     rotated(((n-1)*50+1):(n*50), :) = cellular(n, 1:50, :);
% end


% Uncomment for 70x70:
% figure 
% hold on
% 
% scatter3(data(:,1), data(:,2), data(:,3), 'k.')
% scatter3(new_data(:,1), new_data(:,2), new_data(:,3), 'bo')
% view(120, 20);
%legend('Original Data', 'Subselected Region to Coincide with Auxetic Trace Shape')


%% Create Traces and Output to File:


fid = fopen(output_filename, 'w');

% Transformations:
new_data(:,1) = new_data(:,1) + 35; 
new_data(:,2) = new_data(:,2) + 35;
new_data(:,3) = new_data(:,3) + 10.5; 

% % Saddle: 10.5 mm
% 
% Uncomment for 70x70:
% rotated(:,1) = rotated(:,1) + 35;
% rotated(:,2) = rotated(:,2) + 35;
% rotated(:,3) = rotated(:,3) + 10.9;

for p = 1:2*num_layers
    position = 1;
    new_data(:,3) = new_data(:,3) + layer_height;
    % Uncomment for 70x70:
   % rotated(:,3) = rotated(:,3) + layer_height;
   % if mod(p,2) == 1
        passer = new_data;
        fprintf(fid, ';LAYER:%d\n', p);
    %else
        %passer = rotated;
    %end
    % Traverse to first point:
                traverse_to = passer(position, :);
                % Go up:
                fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
                % Move to next xy:
                fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
                % Go to exact point:
                fprintf(fid, 'G0 Z%f;\n', traverse_to(3));
                previous = traverse_to;     
    for j = 1:22 % FIXME: 50 for 70x70, 12 for skip10, 22 for skip5
            if mod(j,2) == 1  % It's an odd row
%                 traverse_to = new_data(position, :);
%                %disp(position)
%                % Go up:
%                 fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
%                 % Move to next xy:
%                 fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
%                 % Go to exact point:
%                 fprintf(fid, 'G0 Z%f;\n', traverse_to(3));
%                 previous = traverse_to; 

                for k = 1:50
                    x = passer(position,1);
                    y = passer(position,2);
                    z = passer(position,3);
                    dist = sqrt((x - previous(1))^2 + (y - previous(2))^2 + (z - previous(3))^2);
                    E = E + const*dist;
                    if k == 1 % first extrusion, so we'll output the feed:
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f  E%f ;\n', pfeed, x, y, z, E);
                       % disp(k)
                        disp(position)

                    else % No need to output the feed.
                        fprintf(fid, 'G1 X%f Y%f Z%f  E%f ;\n', x, y, z, E);
                        %disp(k)
                        disp(position)
                    end
                    previous = [x, y, z];
                    position = position + 1;

                end
            else % It's an even row
%                 % Traverse to the last point in the line (closest point to where we were on the previous): 
%                 traverse_to = new_data(position+49, :);
%                 % Go up:
%                 fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
%                 % Move to next xy:
%                 fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
%                 % Go to exact point:
%                 fprintf(fid, 'G0 Z%f;\n', traverse_to(3));
%                 previous = traverse_to; 

                for k = 1:49
                    x = passer(position + 49 - k + 1,1);
                    y = passer(position + 49 - k + 1,2);
                    z = passer(position + 49 - k + 1,3);
                    dist = sqrt((x - previous(1))^2 + (y - previous(2))^2 + (z - previous(3))^2);
                    E = E + const*dist;
                    if k == 1 % first extrusion, so we'll output the feed:
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f  E%f ;\n', pfeed, x, y, z, E);
                        disp(position)

                    else % No need to output the feed.
                        fprintf(fid, 'G1 X%f Y%f Z%f  E%f ;\n', x, y, z, E);
                        disp(position)
                    end
                    previous = [x,y,z];

                end
                position = position + 50;
            end

    end
end
fclose(fid);