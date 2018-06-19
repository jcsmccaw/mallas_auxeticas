%% Processing the first filtered solidworks point set:

output_filename = 'saddle_hat_Trickmiddle.gcode';

% Number of lines in one direction of the sample:
num_lines = 17;
sets_lines = 2;
firstfluff = 0.5; % 0 for high density, 0.5 for low density

num_layers = 8; % Number of times we'll print the whole sucker
rapid_height = 30; % The height (mm) at which rapid motions happen. 
% Platform offsets: when the bezier bed is installed on the printer, 
% X axis:
x_offset = 35; % Adding 20 mm to the corner of the base holder, then 15 for the base holder
% Y axis:
y_offset = 35; % Y axis is the same offset as the x
% Z axis:
z_offset = 11.5; % FIXME: WHERE THE ZERO IS DEPENDS ON WHICH SURFACE IS USED: 
% VANILLA: 10.5mm
% ANTI-VANILLA: 0.3mm
% SADDLE: 10.5mm



pfeed = 600; % FIXME: adjust by printer 'Print Feed'
const = 0.0461; % FIXME: Adjust by printer
rfeed = 3000; % FIXME: adjust by printer. 'Rapid Feed'
E = 0; % Extrusion counter
layer_height = .2; % mm % 

data = check_andFilter_excel_output(); 


position = 1;
header = {'; Sliced by code written by John McCaw. May 2018. ';'G28 ; Home extruder';'G1 Z15 F100';'M107 ; Turn off fan';'G90 ; Absolute positioning';'M82 ; Extruder in absolute mode';'; Activate all used extruder';'M104 T0 S210';'G92 E0 ; Reset extruder position';'; Wait for all used extruders to reach temperature';'M109 T0 S210';'M107'};
footer = {'M400';'M104 S0                        ; hotend off';'M107                           ; fans off';'G91                            ; relative positioning';'G1 E-1 F300                    ; retract the filament a bit before lifting the nozzle, to release some of the pressure';'G1 Z+10 E-5 F3000   ; move Z up a bit and retract filament even more';'G90                            ; absolute positioning';'G1 X0 Y190                     ; move to cooling position';'M84                            ; steppers off';'G90                            ; absolute positioning'};

fid = fopen(output_filename, 'w');% 1; % FIXME: This outputs to the terminal, just for testing. 

for t = 1:length(header)
    fprintf(fid, '%s\n', header{t});
end
%% Transforms to put it on top of the surface:
data(:,1) = data(:,1) + x_offset;
data(:,2) = data(:,2) + y_offset; 
data(:,3) = data(:,3) + z_offset;

% Plot so the user knows what the fuck is happening:
figure
scatter3(data(:,1), data(:,2), data(:,3), 'k.')
title('Point Traces, After Offsets')
zlim([0 40])
view(125,10)
xlabel('X Axis')
ylabel('Y Axis')
zlabel('Z Axis')

k = waitforbuttonpress;
% Sorting and outputing the data:
for q = 1:num_layers
    position = 1;
    % Add z-offset:
    data(:,3) = data(:,3) + layer_height;
    fprintf(fid, ';LAYER:%d\n', q);
    for i = 1:sets_lines % sets of lines

        data(:,3) = data(:,3);
        % Traverse:
         traverse_to = data(position, :);
              %  disp(position)
                % Go up:
                fprintf(fid, 'G0 F%d Z%f E%f;\n', rfeed, rapid_height, E-0.1);
                % Move to next xy:
               fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
                % Go to exact point:
               fprintf(fid, 'G0 Z%f E%f;\n', traverse_to(3), E+0.5);
               fprintf(fid, 'G92 E%f;\n', E);
                previous =  traverse_to; 
                position = position + 1;
        for j = 1:num_lines % Horizontal and vertical lines
            if j == 1 % This is to account for traversing one point to the first line
                num_trace = 99;
            else
                num_trace = 100;
            end
            
            if mod(j, 2) == 1 % We're on an odd trace
                % Traverse to the first point of the next line: 
                %traverse_to = data(position, :);
              %  disp(position)
                % Go up:
                %fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
                % Move to next xy:
                %fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
                % Go to exact point:
                %fprintf(fid, 'G0 Z%f;\n', traverse_to(3));
                previous = data(position, :);% traverse_to; 
                %position = position + 1;

                for k = 1:num_trace % Because we already took care of the first point, we have 99 remaining, or 1:98 points.
                            x = data(position,1);
                            y = data(position,2);
                            z = data(position,3);
                            dist = sqrt((x - previous(1))^2 + (y - previous(2))^2 + (z - previous(3))^2);
                            E = E + const*dist;

                        if k == 1 % first extrusion, so we'll output the feed:
                            fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f;\n', pfeed, x, y, z, E+firstfluff);
                            fprintf(fid, 'G92 E%f;\n', E);
                            disp(k)
                            disp(position)
                            
                        else % No need to output the feed.
                            fprintf(fid, 'G1 X%f Y%f Z%f E%f;\n', x, y, z, E); 
                            disp(k)
                            disp(position)
                        end

                    previous = [x,y,z]; % Reset the previous so we can keep computing distances 
                    % Advance a point:
                    position = position + 1;
           
                end
            else % We're on an even trace:
                % Traverse to the last point in the line (closest point to where we were on the previous): 
              %  traverse_to = data(position+99, :);
                % Go up:
               % fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
                % Move to next xy:
              %  fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
                % Go to exact point:
             %   fprintf(fid, 'G0 Z%f;\n', traverse_to(3));
              %  previous = traverse_to; 
                %position = position; % We'll just add 100 after we do all of k
                
                for k = 1:99 % Because we already took care of the first point and we are counting 1 twice
                            x = data(position + 99 - k + 1,1);
                            y = data(position + 99 - k + 1,2);
                            z = data(position + 99 - k + 1,3);
                            dist = sqrt((x - previous(1))^2 + (y - previous(2))^2 + (z - previous(3))^2);
                            E = E + const*dist;

                        if k == 1 % first extrusion, so we'll output the feed:
                            fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f;\n', pfeed, x, y, z, E+firstfluff);
                            fprintf(fid, 'G92 E%f;\n', E);
                            disp(position)

                        else % No need to output the feed.
                            fprintf(fid, 'G1 X%f Y%f Z%f E%f;\n', x, y, z, E);
                            disp(position)
                        end

                    previous = [x,y,z]; % Reset the previous so we can keep computing distances 
                    % Advance a point:
                   % position = position + 1; % Remember, for even rows
                   % we'll just add 100 at the end
                end
                position = position + 100;
            end
            disp(j)
%         end
%         try
%             traverse_to = data(position+1, :);
%                   %  disp(position)
%                     % Go up:
%             fprintf(fid, 'G0 F%d Z%f E%f;\n', rfeed, rapid_height, E-0.1);
%                     % Move to next xy:
%             fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
%                     % Go to exact point:
%             fprintf(fid, 'G0 Z%f E%f;\n', traverse_to(3)+0.1, E+0.5);
%             fprintf(fid, 'G92 E%f;\n', E);
%                  %   previous =  traverse_to; 
%                    % position = position + 1;
%         catch
%             traverse_to = data(1, :);
%                   %  disp(position)
%                     % Go up:
%             fprintf(fid, 'G0 F%d Z%f;\n', rfeed, rapid_height);
%                     % Move to next xy:
%             fprintf(fid, 'G0 X%f Y%f;\n', traverse_to(1), traverse_to(2));
%                     % Go to exact point:
%             fprintf(fid, 'G0 Z%f E%f;\n', traverse_to(3)+0.1, E+0.5);
%             fprintf(fid, 'G92 E%f;\n', E);
%                  %   previous =  traverse_to; 
%                    position = position + 1;
       end
    end
end
for t = 1:length(footer)
    fprintf(fid, '%s\n', footer{t});
end
fclose(fid);