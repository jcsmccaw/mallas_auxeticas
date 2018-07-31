
path_cyclic = 'D:\Data\Mechanical_Testing\Cyclic_Testing\';
cyclic_strs = {'HDHA_aux_mode3_0.txt','HDHA_aux_mode3_1.txt','HDHA_aux_mode3_2.txt','HDHA_aux_mode9_0.txt','HDHA_aux_mode9_1.txt','HDHA_aux_mode9_2.txt','HDHA_equmesh_mode3_0.txt','HDHA_equmesh_mode3_1.txt','HDHA_equmesh_mode3_2.txt','HDHA_equmesh_mode9_0.txt','HDHA_equmesh_mode9_1.txt','HDHA_equmesh_mode9_2.txt','HDHA_nonaux_mode3_0.txt','HDHA_nonaux_mode3_1.txt','HDHA_nonaux_mode3_2.txt','HDHA_nonaux_mode9_0.txt','HDHA_nonaux_mode9_1.txt','HDHA_nonaux_mode9_2.txt','HDLA_aux_mode3_0.txt','HDLA_aux_mode3_1.txt','HDLA_aux_mode3_2.txt','HDLA_aux_mode9_0.txt','HDLA_aux_mode9_1.txt','HDLA_aux_mode9_2.txt','HDLA_equmesh_mode3_0.txt','HDLA_equmesh_mode3_1.txt','HDLA_equmesh_mode3_2.txt','HDLA_equmesh_mode9_0.txt','HDLA_equmesh_mode9_1.txt','HDLA_equmesh_mode9_2.txt','HDLA_nonaux_mode3_0.txt','HDLA_nonaux_mode3_1.txt','HDLA_nonaux_mode3_2.txt','HDLA_nonaux_mode9_0.txt','HDLA_nonaux_mode9_1.txt','HDLA_nonaux_mode9_2.txt','HDNA_aux_mode3_0.txt','HDNA_aux_mode3_1.txt','HDNA_aux_mode3_2.txt','HDNA_aux_mode9_0.txt','HDNA_aux_mode9_1.txt','HDNA_aux_mode9_2.txt','HDNA_equmesh_mode3_0.txt','HDNA_equmesh_mode3_1.txt','HDNA_equmesh_mode3_2.txt','HDNA_equmesh_mode9_0.txt','HDNA_equmesh_mode9_1.txt','HDNA_equmesh_mode9_2.txt','HDNA_nonaux_mode3_0.txt','HDNA_nonaux_mode3_1.txt','HDNA_nonaux_mode3_2.txt','HDNA_nonaux_mode9_0.txt','HDNA_nonaux_mode9_1.txt','HDNA_nonaux_mode9_2.txt','LDHA_aux_mode3_0.txt','LDHA_aux_mode3_1.txt','LDHA_aux_mode3_2.txt','LDHA_aux_mode9_0.txt','LDHA_aux_mode9_1.txt','LDHA_aux_mode9_2.txt','LDHA_equmesh_mode3_0.txt','LDHA_equmesh_mode3_1.txt','LDHA_equmesh_mode3_2.txt','LDHA_equmesh_mode9_0.txt','LDHA_equmesh_mode9_1.txt','LDHA_equmesh_mode9_2.txt','LDHA_nonaux_mode3_0.txt','LDHA_nonaux_mode3_1.txt','LDHA_nonaux_mode3_2.txt','LDHA_nonaux_mode9_0.txt','LDHA_nonaux_mode9_1.txt','LDHA_nonaux_mode9_3.txt','LDLA_aux_mode3_0.txt','LDLA_aux_mode3_1.txt','LDLA_aux_mode3_2.txt','LDLA_aux_mode9_0.txt','LDLA_aux_mode9_1.txt','LDLA_aux_mode9_2.txt','LDLA_equmesh_mode3_0.txt','LDLA_equmesh_mode3_1.txt','LDLA_equmesh_mode3_2.txt','LDLA_equmesh_mode9_0.txt','LDLA_equmesh_mode9_1.txt','LDLA_equmesh_mode9_2.txt','LDLA_nonaux_mode3_0.txt','LDLA_nonaux_mode3_1.txt','LDLA_nonaux_mode3_2.txt','LDLA_nonaux_mode9_0.txt','LDLA_nonaux_mode9_1.txt','LDLA_nonaux_mode9_2.txt','LDNA_aux_mode3_0.txt','LDNA_aux_mode3_1.txt','LDNA_aux_mode3_2.txt','LDNA_aux_mode9_0.txt','LDNA_aux_mode9_1.txt','LDNA_aux_mode9_2.txt','LDNA_equmesh_mode3_0.txt','LDNA_equmesh_mode3_1.txt','LDNA_equmesh_mode3_2.txt','LDNA_equmesh_mode9_0.txt','LDNA_equmesh_mode9_1.txt','LDNA_equmesh_mode9_2.txt','LDNA_nonaux_mode3_0.txt','LDNA_nonaux_mode3_1.txt','LDNA_nonaux_mode3_2.txt','LDNA_nonaux_mode9_0.txt','LDNA_nonaux_mode9_1.txt','LDNA_nonaux_mode9_2.txt'};
output = 'hysteresis_firstcycle_dissipation_backward_only.txt';
titles = cell(36,1);
 outid = fopen(output, 'w');
    for i =1:(length(cyclic_strs)/3)
        % Extract data:
        file_str1 = strcat(path_cyclic, cyclic_strs{3*i-2});
        file_str2 = strcat(path_cyclic, cyclic_strs{3*i-1});
        file_str3 = strcat(path_cyclic, cyclic_strs{3*i});

        fig_title = strcat('cyclic',cyclic_strs{3*i-2}(1:end-6));
        titles{i} = fig_title;

        fid1 = fopen(file_str1, 'r');
        fid2 = fopen(file_str2, 'r');
        fid3 = fopen(file_str3, 'r');
        [data1] = dlmread(file_str1, '\t', 2, 0);
        [data2] = dlmread(file_str2, '\t', 2, 0);
        [data3] = dlmread(file_str3, '\t', 2, 0);
        data_total = {data1,data2,data3};
        fclose(fid1);
        fclose(fid2);
        fclose(fid3);

        % Break into forward and return:
%         figure
%         title(fig_title)
        for j = 1:3 % Three samples per type:
                forw1 = [data_total{j}(1:70,2), data_total{j}(1:70,1)];
                back1 = [data_total{j}(70:110,2), data_total{j}(70:110,1)];


                forw2 = [data_total{j}(110:170,2), data_total{j}(110:170,1)];
                back2 = [data_total{j}(170:210,2), data_total{j}(170:210,1)];


                forw3 = [data_total{j}(210:260,2), data_total{j}(210:260,1)];
                back3 = [data_total{j}(260:310,2), data_total{j}(260:310,1)];


                forw4 = [data_total{j}(310:355,2), data_total{j}(310:355,1)];
                back4 = [data_total{j}(355:400,2), data_total{j}(355:400,1)];


                forw5 = [data_total{j}(400:450,2), data_total{j}(400:450,1)];
                back5 = [data_total{j}(450:499,2), data_total{j}(450:499,1)];



                % Calculating area of the loop:
%                 a1f = trapz(forw1(:,2),forw1(:,1));
%                 a1b = trapz(back1(:,2),back1(:,1));
%                 a1((j-1)*36+i) = a1f - a1b;
%                 a2f = trapz(forw2(:,2),forw2(:,1));
%                 a2b = trapz(back2(:,2),back2(:,1));
%                 a2((j-1)*36+i) = a2f - a2b;
%                 a3f = trapz(forw3(:,2),forw3(:,1));
%                 a3b = trapz(back3(:,2),back3(:,1));
%                 a3((j-1)*36+i) = a3f - a3b;
%                 a4f = trapz(forw4(:,2),forw4(:,1));
%                 a4b = trapz(back4(:,2),back4(:,1));
%                 a4((j-1)*36+i) = a4f - a4b;
%                 a5f = trapz(forw5(:,2),forw5(:,1));
%                 a5b = trapz(back5(:,2),back5(:,1));
%                 a5((j-1)*36+i) = a5f - a5b;

                a1f = trapz(forw1(:,2),forw1(:,1));
                a1b = trapz(back1(:,2),back1(:,1));
                a1 = a1f - a1b;
                a2f = trapz(forw2(:,2),forw2(:,1));
                a2b = trapz(back2(:,2),back2(:,1));
                a2 = a2f - a2b;
                a3f = trapz(forw3(:,2),forw3(:,1));
                a3b = trapz(back3(:,2),back3(:,1));
                a3 = a3f - a3b;
                a4f = trapz(forw4(:,2),forw4(:,1));
                a4b = trapz(back4(:,2),back4(:,1));
                a4 = a4f - a4b;
                a5f = trapz(forw5(:,2),forw5(:,1));
                a5b = trapz(back5(:,2),back5(:,1));
                a5 = a5f - a5b;
                 
          avgb = mean([a2b, a3b, a4b, a5b]);
          stdev = std([ a2b, a3b, a4b, a5b]);
          delta_Ab = a1b - avgb;
         fprintf(outid, '%s,%f,%f,%f,%f\n', cyclic_strs{3*i-2 +(j-1)}(1:end-3), a1, avgb, stdev, delta_Ab);
        end

        % Write data to file:
     %    fprintf(outid, '%s,%f,%f,%f,%f,%f,%f,%f\n', cyclic_strs{3*i-1}(1:end-3), a1, a2, a3, a4, a5, avg, stdev);
    %     fprintf(outid, '%s,%f,%f,%f,%f,%f,%f,%f\n', cyclic_strs{3*i}(1:end-3), a1, a2, a3, a4, a5, avg, stdev);
    end


     fclose(outid)
    
    % Create Boxplots:
    data(:, 1) = a1; % Area of loop #
    data(:, 2) = a2;
    data(:, 3) = a3;
    data(:, 4) = a4;
    data(:, 5) = a5;
    % figure
   %  boxplot(data) % Showing all are similar across the five samples
%    
%     % Averaging across the five cycles:
%     for i = 1:108
%         final_dat((5*(i-1)+1):(5*i)) = mean([a1(i); a2(i); a3(i); a4(i); a5(i)]);
%     end
%      %% Aux vs. non-aux vs. equmesh:
%     figure
%     hold on
%     boxplot([final_dat(1:15);final_dat(31:45); final_dat(75-14:75)]','LabelOrientation', 'inline', 'Labels', {titles{1}; titles{3}; titles{5}})
%     title('Auxetic vs. Non-auxetic vs. Quadratic: HDHA mode 3')
% %     figure 
% %     hold on
% %     boxplot([final_dat(4:6);final_dat(10:12); final_dat(16:18)],'LabelOrientation', 'inline', 'Labels', titles(2:2:6))
% 
%     
% %     fclose(outid)