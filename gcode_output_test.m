function [E] = gcode_output_test(P, detail, new_detail, layernum, feed, last_point, ext, E, fid)
%     % Are we even or odd layer?
%     if mod(layernum,2) == 0 % Even layer, so P_skipped is (detail,3,new_detail)
%         if mod(new_detail,2) == 1
%             for i = 1:new_detail % Increment through each vector, 1:detail/skips
%                 for j = 1:detail % Increment through every value in each vector, 1:detail
%                     if mod(i,2) == 1 % Odd rows means we should go backwards through the vector
%                         fprintf(fid,'G1 X%f Y%f Z%f F%d E%d ;\n',P(detail-j+1,1,i),P(detail-j+1,2,i),P(detail-j+1,3,i),feed,ext);
%                     else % odd rows, we'll progress through the vector forwards
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(j,1,i),P(j,2,i), P(j,3,i), feed, ext);
%                     end
%                 end
%             end
%         else
%             for i = 1:new_detail % Increment through each vector, 1:detail/skips
%                 for j = 1:detail % Increment through every value in each vector, 1:detail
%                     if mod(i,2) == 1 % Odd rows means we should go backwards through the vector
%                         fprintf(fid,'G1 X%f Y%f Z%f F%d E%d ;\n',P(detail-j+1,1,i),P(detail-j+1,2,i),P(detail-j+1,3,i),feed,ext);
%                     else % odd rows, we'll progress through the vector forwards
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(j,1,i),P(j,2,i), P(j,3,i), feed, ext);
%                     end
%                 end
%             end           
%         end
% 
% 
%     else % Even layer, so P_skipped is (new_detail, 3, detail)
%         % IMPORTANT: On even layers, we want to go through the [new_detail]
%         % vectors backwards. think about making a flat square bezier surface:
%         % when we finish layer 1, we're at the upper right hand corner, so we
%         % want to go from the top right to the bottom left (home).
%         %
%         % From each odd layer:
%         % if new_detail is even, we are left at the upper left after layer 1
%         % if new_detail is odd, we are left at the upper right after layer 1
% 
%         if mod(new_detail,2) == 1 % new_detail is odd
%             for j = 1:new_detail
%                 for i = 1:detail
%                     if mod(j,2) == 1 % Odd row means we should go backwards through the vector
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(detail-i+1,1,new_detail-j+1),P(detail-i+1,2,new_detail-j+1), P(detail-i+1,3,new_detail-j+1), feed, ext);
%                     else % Odd row
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(i,1,new_detail-j+1),P(i,2,new_detail-j+1), P(i,3,new_detail-j+1), feed, ext);
%                     end
%                 end
%             end
%         else % new_detail is even
%             for j = 1:new_detail
%                 for i = 1:detail
%                     if mod(j,2) == 0 % Even row means we should go backwards through the vector
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(detail-i+1,1,j),P(detail-i+1,2,j), P(detail-i+1,3,j), feed, ext);
%                     else % Odd row
%                         fprintf(fid, 'G1 X%f Y%f Z%f F%d E%d ;\n', P(i,1,j),P(i,2,j), P(i,3,j), feed, ext);
%                     end
%                 end
%             end        
% 
%         end
%     end
% end

    %% Flow-Charted Version
    if mod(new_detail, 2) == 1 % We have an odd number of rows
        if mod(layernum,2) == 1 % we are on an odd layer
            for i = 1:new_detail % for each row
                for j = 1:detail  % for each value
                    if mod(i,2) == 1 % we're on an odd row
                        % output curr row in +x, y increments
                        x = P(j,1,i);
                        y = P(j,2,i);
                        z = P(j,3,i);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    else % we're on an even row
                        % output curr row in -x, y increments
                        x = P(detail - j + 1,1,i);
                        y = P(detail - j + 1,2,i);
                        z = P(detail - j + 1,3,i);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    end
                end
            end
        else % We're on an even layer 
            P = permute(P, [3,2,1]); % FIXME: why is this necessary?
            for i = 1:new_detail
                for j = 1:detail
                    if mod(i,2) == 1
                        % output curr row in -y, x decrements
                        x = P(new_detail - i + 1,1,detail - j + 1);
                        y = P(new_detail - i + 1,2,detail - j + 1);
                        z = P(new_detail - i + 1,3,detail - j + 1);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    else
                        % output curr row in +y, x decrements
                        x = P(new_detail - i + 1,1,j);
                        y = P(new_detail - i + 1,2,j);
                        z = P(new_detail - i + 1,3,j);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n',  feed, x, y, z, E);
                    end
                end
            end
        end
    else % we have an even number of rows
        if mod(layernum, 4) == 0 % condition d
            P = permute(P, [3,2,1]); % FIXME: why is this necessary?
            for i = 1:new_detail
                for j = 1:detail
                    if mod(i,2) == 1
                        % output curr row in +y, x decrements
                        x =  P(new_detail - i + 1,1,j);
                        y = P(new_detail - i + 1,2,j);
                        z = P(new_detail - i + 1,3,j);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    else
                        % output curr row in -y, x decrements
                        x = P(new_detail - i + 1,1,detail - j + 1);
                        y = P(new_detail - i + 1,2,detail - j + 1);
                        z = P(new_detail - i + 1,3,detail - j + 1); 
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    end
                end
            end

        elseif mod(layernum, 2) == 0 % Condition b
            P = permute(P, [3,2,1]); % FIXME : why is this necessary?
            for i = 1:new_detail
                for j = 1:detail
                    if mod(i,2) == 1
                        % output curr row in - y, x increments
                        x = P(i,1,detail - j + 1);
                        y = P(i,2,detail - j + 1); 
                        z = P(i,3,detail - j + 1);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n',  feed, x, y, z, E);
                    else 
                        % output curr row in + y, x increments
                        x = P(i,1,j);
                        y = P(i,2,j); 
                        z = P(i,3,j);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n',  feed, x, y, z, E);
                    end
                end
            end

        elseif mod((layernum + 1), 4) == 0 % condition c
            for i = 1:new_detail
                for j = 1:detail
                    if mod(i,2) == 0
                        % output curr row in +x, y decrements
                        x = P(j,1,new_detail - i + 1);
                        y = P(j,2,new_detail - i + 1);  
                        z = P(j,3,new_detail - i + 1);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    else
                        % output curr row in -x, y decrements
                        x = P(detail - j + 1,1,new_detail - i + 1);
                        y = P(detail - j + 1,2,new_detail - i + 1); 
                        z = P(detail - j + 1,3,new_detail - i + 1);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n',  feed, x, y, z, E);
                    end
                end
            end
        else % condition a
            for i = 1:new_detail
                for j = 1:detail
                    if mod(i,2) == 1
                        % output curr row in + x, y increments
                        x = P(j,1,i);
                        y = P(j,2,i); 
                        z = P(j,3,i);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n', feed, x, y, z, E);
                    else
                        % output curr row in - x, y increments
                        x = P(detail - j + 1,1,i);
                        y = P(detail - j + 1,2,i);
                        z = P(detail - j + 1,3,i);
                        dist = sqrt((x - last_point(1))^2 + (y - last_point(2))^2 + (z - last_point(3))^2)/(1000^2);
                        E = E + dist*ext;
                        fprintf(fid, 'G1 F%d X%f Y%f Z%f E%f ;\n',  feed, x, y, z, E);
                    end
                end
            end
        end 
    end
end