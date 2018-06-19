function [filtered_data] = check_andFilter_excel_output()
%% Checking and Filtering Solidworks Macro Output
% This serves to plot the output of the solidworks macros to check that the
% proper points were captured. 


[file, path] = uigetfile({'*.xlsx';'*.slx';'*.xls'},'Select Excel Output');
full_path = strcat(path, file);
data = xlsread(full_path, '', '', 'basic');
data = data*1000; % Convert from meters to mm
num_points = numel(data)/3;
new_num_points = num_points / 2;
j = 1;
filtered_data = zeros(new_num_points,3);

for i = 1:num_points
    if mod(i,2) == 0
        filtered_data(j,:) = data(i,:);
        j = j + 1;
    end    
end

fprintf('\nThe number of filtered points is %d\n\n', new_num_points);

% figure
% hold on
% scatter3(data(:,1), data(:,2), data(:,3), 'k.')
% 
% a = 'Excel Output of ';
% a1 = ' ';
% b = num2str(num_points);
% c = ' Points';
% title_string = strcat(a,a1,b,c);
% title(title_string)
% xlabel('X dist, mm')
% ylabel('Y dist, mm')
% zlabel('Z dist, mm')
% xlim([0 70])
% ylim([0 70])
% zlim([0 70])
% 
% figure
% hold on
% scatter3(filtered_data(:,1), filtered_data(:,2), filtered_data(:,3), 'k.')
% 
% a = 'Excel Output of ';
% a1 = ' ';
% b = num2str(new_num_points);
% c = ' Points';
% title_string = strcat(a,a1,b,c);
% title(title_string)
% xlabel('X dist, mm')
% ylabel('Y dist, mm')
% zlabel('Z dist, mm')
% xlim([0 70])
% ylim([0 70])
% zlim([0 70])
