%% Plotting all the data
close all


%% Failure Testing
path_failure = 'D:\Data\Mechanical_Testing\Failure_Testing\';
failure_strs = {'HDHA_aux_mode3_0.txt','HDHA_aux_mode3_1.txt','HDHA_aux_mode3_2.txt','HDHA_aux_mode9_0.txt','HDHA_aux_mode9_1.txt','HDHA_aux_mode9_2.txt','HDHA_equmesh_mode3_0.txt','HDHA_equmesh_mode3_1.txt','HDHA_equmesh_mode3_2.txt','HDHA_equmesh_mode9_0.txt','HDHA_equmesh_mode9_1.txt','HDHA_equmesh_mode9_2.txt','HDHA_NA_mode3_0.txt','HDHA_NA_mode3_1.txt','HDHA_NA_mode3_2.txt','HDHA_NA_mode9_0.txt','HDHA_NA_mode9_1.txt','HDHA_NA_mode9_2.txt','HDLA_aux_mode3_0.txt','HDLA_aux_mode3_1.txt','HDLA_aux_mode3_2.txt','HDLA_aux_mode9_0.txt','HDLA_aux_mode9_1.txt','HDLA_aux_mode9_2.txt','HDLA_equmesh_mode3_0.txt','HDLA_equmesh_mode3_1.txt','HDLA_equmesh_mode3_2.txt','HDLA_equmesh_mode9_0.txt','HDLA_equmesh_mode9_1.txt','HDLA_equmesh_mode9_2.txt','HDLA_NA_mode3_0.txt','HDLA_NA_mode3_1.txt','HDLA_NA_mode3_2.txt','HDLA_NA_mode9_0.txt','HDLA_NA_mode9_1.txt','HDLA_NA_mode9_2.txt','HDNA_aux_mode3_0.txt','HDNA_aux_mode3_1.txt','HDNA_aux_mode3_2.txt','HDNA_aux_mode9_0.txt','HDNA_aux_mode9_1.txt','HDNA_aux_mode9_2.txt','HDNA_equmesh_mode3_0.txt','HDNA_equmesh_mode3_1.txt','HDNA_equmesh_mode3_2.txt','HDNA_equmesh_mode9_0.txt','HDNA_equmesh_mode9_1.txt','HDNA_equmesh_mode9_2.txt','HDNA_NA_mode3_0.txt','HDNA_NA_mode3_1.txt','HDNA_NA_mode3_2.txt','HDNA_NA_mode9_0.txt','HDNA_NA_mode9_1.txt','HDNA_NA_mode9_2.txt','LDHA_aux_mode3_0.txt','LDHA_aux_mode3_1.txt','LDHA_aux_mode3_2.txt','LDHA_aux_mode9_0.txt','LDHA_aux_mode9_1.txt','LDHA_aux_mode9_2.txt','LDHA_equmesh_mode3_0.txt','LDHA_equmesh_mode3_1.txt','LDHA_equmesh_mode3_2.txt','LDHA_equmesh_mode9_0.txt','LDHA_equmesh_mode9_1.txt','LDHA_equmesh_mode9_2.txt','LDHA_NA_mode3_0.txt','LDHA_NA_mode3_1.txt','LDHA_NA_mode3_2.txt','LDHA_NA_mode9_0.txt','LDHA_NA_mode9_1.txt','LDHA_NA_mode9_2.txt','LDLA_aux_mode3_0.txt','LDLA_aux_mode3_1.txt','LDLA_aux_mode3_2.txt','LDLA_aux_mode9_0.txt','LDLA_aux_mode9_1.txt','LDLA_aux_mode9_2.txt','LDLA_equmesh_mode3_0.txt','LDLA_equmesh_mode3_1.txt','LDLA_equmesh_mode3_2.txt','LDLA_equmesh_mode9_0.txt','LDLA_equmesh_mode9_1.txt','LDLA_equmesh_mode9_2.txt','LDLA_NA_mode3_0.txt','LDLA_NA_mode3_1.txt','LDLA_NA_mode3_2.txt','LDLA_NA_mode9_0.txt','LDLA_NA_mode9_1.txt','LDLA_NA_mode9_2.txt','LDNA_aux_mode3_0.txt','LDNA_aux_mode3_1.txt','LDNA_aux_mode3_2.txt','LDNA_aux_mode9_0.txt','LDNA_aux_mode9_1.txt','LDNA_aux_mode9_2.txt','LDNA_equmesh_mode3_0.txt','LDNA_equmesh_mode3_1.txt','LDNA_equmesh_mode3_2.txt','LDNA_equmesh_mode9_0.txt','LDNA_equmesh_mode9_1.txt','LDNA_equmesh_mode9_2.txt','LDNA_NA_mode3_0.txt','LDNA_NA_mode3_1.txt','LDNA_NA_mode9_0.txt','LDNA_NA_mode9_1.txt','LDNA_NA_mode9_2.txt'};
a = size(failure_strs);
files = cell(54,1);
for i = 1:a(2)
    files{i} = strcat(path_failure, failure_strs{i});
end

%% Comparing Aux vs Non-Aux vs Quadratic
%% High Density
figure
subplot(3,2,1) % HDHA Auxetic Mode 3
hold on
title(files{1}(44:end-6))
[data1] = dlmread(files{1}, '\t', 2, 0);
[data2] = dlmread(files{2}, '\t', 2, 0);
[data3] = dlmread(files{3}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2) - 1.5];
data2 = [data2(:,1), data2(:,2) - 1.5];

for i = 1:length(data1)
    avg_HDHA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');

xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on


subplot(3,2,3) % HDHA Non-Auxetic Mode 3
hold on
title(files{13}(44:end-6))
[data1] = dlmread(files{13}, '\t', 2, 0);
[data2] = dlmread(files{14}, '\t', 2, 0);
[data3] = dlmread(files{15}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-34.5];
data2 = [data2(:,1), data2(:,2) - 1.5];
data3 = [data3(:,1), data3(:,2)];
for i = 1:length(data1)
    avg_HDHA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on



subplot(3,2,5) % HDHA Equivalent Quadratic Mode 3
hold on
title(files{7}(44:end-6))
[data1] = dlmread(files{7}, '\t', 2, 0);
[data2] = dlmread(files{8}, '\t', 2, 0);
[data3] = dlmread(files{9}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2];
data2 = [data2(:,1), data2(:,2) - 0.5];
data3 = [data3(140:end-110,1), data3(140:end-110,2)-28.5];
for i = 1:length(data2)
    avg_HDHA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2)]), mean([data1(i,1), data2(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on




subplot(3,2,2) % HDHA Auxetic Mode 9
hold on
title(files{4}(44:end-6))
[data1] = dlmread(files{4}, '\t', 2, 0);
[data2] = dlmread(files{5}, '\t', 2, 0);
[data3] = dlmread(files{6}, '\t', 2, 0);
data3 = [data3(:,1), data3(:,2)-1];
for i = 1:length(data1)
    avg_HDHA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on


subplot(3,2,4) % HDHA Non-Auxetic Mode 9
hold on
title(files{16}(44:end-6))
[data1] = dlmread(files{16}, '\t', 2, 0);
[data2] = dlmread(files{17}, '\t', 2, 0);
[data3] = dlmread(files{18}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2) - 1];
data2 = [data2(:,1), data2(:,2) - 1];
data3 = [data3(:,1), data3(:,2) - 1];
for i = 1:length(data1)
    avg_HDHA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on



subplot(3,2,6) % HDHA Equivalent Quadratic Mode 9
hold on
title(files{10}(44:end-6))
[data1] = dlmread(files{10}, '\t', 2, 0);
[data2] = dlmread(files{11}, '\t', 2, 0);
[data3] = dlmread(files{12}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2];
data2 = [data2(:,1), data2(:,2) - 2];
data3 = [data3(:,1), data3(:,2)- 1];
for i = 1:length(data1)
    avg_HDHA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on

%% Comparing Aux/nonaux/quadratic: Normal Amplitude, High Density:
figure

subplot(3,2,1) % HDNA Auxetic Mode 3
hold on
title(files{37}(44:end-6))
[data1] = dlmread(files{37}, '\t', 2, 0);
[data2] = dlmread(files{38}, '\t', 2, 0);
[data3] = dlmread(files{39}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-39.5];
data2 = [data2(:,1), data2(:,2)-23.5];
data3 = [data3(:,1), data3(:,2)-1.5];
for i = 1:length(data1)
    avg_HDNA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on


subplot(3,2,3) % HDNA Non-Auxetic Mode 3
hold on
title(files{49}(44:end-6))
[data1] = dlmread(files{49}, '\t', 2, 0);
[data2] = dlmread(files{50}, '\t', 2, 0);
[data3] = dlmread(files{51}, '\t', 2, 0);

data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-0.5];
data3 = [data3(:,1), data3(:,2)-1];
for i = 1:length(data1)
    avg_HDNA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on



subplot(3,2,5) % HDNA Equivalent Quadratic Mode 3
hold on
title(files{43}(44:end-6))
[data1] = dlmread(files{43}, '\t', 2, 0);
[data2] = dlmread(files{44}, '\t', 2, 0);
[data3] = dlmread(files{45}, '\t', 2, 0);

data1 = [data1(:,1), data1(:,2)-1.25];
data2 = [data2(:,1), data2(:,2)-0.75];
data3 = [data3(:,1), data3(:,2)-1.25];
for i = 1:length(data1)
    avg_HDNA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on




subplot(3,2,2) % HDNA Auxetic Mode 9
hold on
title(files{40}(44:end-6))
[data1] = dlmread(files{40}, '\t', 2, 0);
[data2] = dlmread(files{41}, '\t', 2, 0);
[data3] = dlmread(files{42}, '\t', 2, 0);
data3 = [data3(:,1), data3(:,2)-22.75];

data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-0.5];
for i = 1:length(data1)
    avg_HDNA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on


subplot(3,2,4) % HDNA Non-Auxetic Mode 9
hold on
title(files{52}(44:end-6))
[data1] = dlmread(files{52}, '\t', 2, 0);
[data2] = dlmread(files{53}, '\t', 2, 0);
[data3] = dlmread(files{54}, '\t', 2, 0);

data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-1];
for i = 1:length(data1)
    avg_HDNA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on



subplot(3,2,6) % HDHA Equivalent Quadratic Mode 9
hold on
title(files{46}(44:end-6))
[data1] = dlmread(files{46}, '\t', 2, 0);
[data2] = dlmread(files{47}, '\t', 2, 0);
[data3] = dlmread(files{48}, '\t', 2, 0);

data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-2];
for i = 1:length(data1)
    avg_HDNA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])

box on


%% Aux/nonaux/quadratic: Comparing Low Density
figure

subplot(3,2,1) % HDLA Auxetic Mode 3
hold on
title(files{19}(44:end-6))
[data1] = dlmread(files{19}, '\t', 2, 0);
[data2] = dlmread(files{20}, '\t', 2, 0);
[data3] = dlmread(files{21}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-2];
for i = 1:length(data1)
    avg_HDLA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])
box on


subplot(3,2,3) % HDLA Non-Auxetic Mode 3
hold on
title(files{31}(44:end-6))
[data1] = dlmread(files{31}, '\t', 2, 0);
[data2] = dlmread(files{32}, '\t', 2, 0);
[data3] = dlmread(files{33}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-1];
for i = 1:length(data1)
    avg_HDLA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])

box on


subplot(3,2,5) % HDLA Equivalent Quadratic Mode 3
hold on
title(files{25}(44:end-6))
[data1] = dlmread(files{25}, '\t', 2, 0);
[data2] = dlmread(files{26}, '\t', 2, 0);
[data3] = dlmread(files{27}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-1.5];
for i = 1:length(data1)
    avg_HDLA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])


box on


subplot(3,2,2) % HDLA Auxetic Mode 9
hold on
title(files{22}(44:end-6))
[data1] = dlmread(files{22}, '\t', 2, 0);
[data2] = dlmread(files{23}, '\t', 2, 0);
[data3] = dlmread(files{24}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-0.75];
data3 = [data3(:,1), data3(:,2)-0.75];
for i = 1:length(data1)
    avg_HDLA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])

box on

subplot(3,2,4) % HDLA Non-Auxetic Mode 9
hold on
title(files{34}(44:end-6))
[data1] = dlmread(files{34}, '\t', 2, 0);
[data2] = dlmread(files{35}, '\t', 2, 0);
[data3] = dlmread(files{36}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)];
data3 = [data3(:,1), data3(:,2)];
for i = 1:length(data1)
    avg_HDLA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])

box on


subplot(3,2,6) % HDLA Equivalent Quadratic Mode 9
hold on
title(files{28}(44:end-6))
[data1] = dlmread(files{28}, '\t', 2, 0);
[data2] = dlmread(files{29}, '\t', 2, 0);
[data3] = dlmread(files{30}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-0.5];
data3 = [data3(:,1), data3(:,2)-17.5];
for i = 1:length(data1)
    avg_HDLA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 30])
xlim([-1 30])


box on
%% Auxetic: Comparing Amplitude
figure

subplot(3,2,1) % HDHA Auxetic Mode 3
hold on
title(files{1}(44:end-6))
[data1] = dlmread(files{1}, '\t', 2, 0);
[data2] = dlmread(files{2}, '\t', 2, 0);
[data3] = dlmread(files{3}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2.25];
data2 = [data2(:,1), data2(:,2)-2.75];
data3 = [data3(:,1), data3(:,2)-2];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])

box on

subplot(3,2,3) % HDNA Auxetic Mode 3
hold on
title(files{37}(44:end-6))
[data1] = dlmread(files{37}, '\t', 2, 0);
[data2] = dlmread(files{38}, '\t', 2, 0);
[data3] = dlmread(files{39}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-1];

plot(data1(:,2)-38, data1(:,1), 'k-');
plot(data2(:,2)-22, data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on



subplot(3,2,5) % HDLA Auxetic Mode 3
hold on
title(files{19}(44:end-6))
[data1] = dlmread(files{19}, '\t', 2, 0);
[data2] = dlmread(files{20}, '\t', 2, 0);
[data3] = dlmread(files{21}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-2];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on




subplot(3,2,2) % HDHA Auxetic Mode 9
hold on
title(files{4}(44:end-6))
[data1] = dlmread(files{4}, '\t', 2, 0);
[data2] = dlmread(files{5}, '\t', 2, 0);
[data3] = dlmread(files{6}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-0.5];
data3 = [data3(:,1), data3(:,2)-1];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on



subplot(3,2,4) % HDNA Auxetic Mode 9
hold on
title(files{40}(44:end-6))
[data1] = dlmread(files{40}, '\t', 2, 0);
[data2] = dlmread(files{41}, '\t', 2, 0);
[data3] = dlmread(files{42}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-2];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2)-23, data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on


subplot(3,2,6) % HDLA Auxetic Mode 9
hold on
title(files{22}(44:end-6))
[data1] = dlmread(files{22}, '\t', 2, 0);
[data2] = dlmread(files{23}, '\t', 2, 0);
[data3] = dlmread(files{24}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-0.5];
data2 = [data2(:,1), data2(:,2)-1];
data3 = [data3(:,1), data3(:,2)-1];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 35])
xlim([-1 30])
box on




%% Comparing Aux vs Non-Aux vs Quadratic
%% Low Density
figure
subplot(3,2,1) % LDHA Auxetic Mode 3
hold on
title(files{55}(44:end-6))
[data1] = dlmread(files{55}, '\t', 2, 0);
[data2] = dlmread(files{56}, '\t', 2, 0);
[data3] = dlmread(files{57}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-5];
data2 = [data2(:,1), data2(:,2)-7.5];
data3 = [data3(:,1), data3(:,2)-6];
for i = 1:length(data1)
    avg_LDHA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on



subplot(3,2,3) % LDHA Non-Auxetic Mode 3
hold on
title(files{67}(44:end-6))
[data1] = dlmread(files{67}, '\t', 2, 0);
[data2] = dlmread(files{68}, '\t', 2, 0);
[data3] = dlmread(files{69}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)- 3.5];
data2 = [data2(:,1), data2(:,2)-1.75];
data3 = [data3(:,1), data3(:,2)-3];
for i = 1:length(data1)
    avg_LDHA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on




subplot(3,2,5) % LDHA Equivalent Quadratic Mode 3
hold on
title(files{61}(44:end-6))
[data1] = dlmread(files{61}, '\t', 2, 0);
[data2] = dlmread(files{62}, '\t', 2, 0);
[data3] = dlmread(files{63}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2];
data2 = [data3(:,1), data3(:,2)-2];
data3 = [data3(:,1), data3(:,2)-2.5];

for i = 1:length(data1)
    avg_LDHA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on





subplot(3,2,2) % LDHA Auxetic Mode 9
hold on
title(files{58}(44:end-6))
[data1] = dlmread(files{58}, '\t', 2, 0);
[data2] = dlmread(files{59}, '\t', 2, 0);
[data3] = dlmread(files{60}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-7];
data2 = [data2(:,1), data2(:,2)-7];
data3 = [data3(:,1), data3(:,2)-8.5];
for i = 1:length(data1)
    avg_LDHA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on



subplot(3,2,4) % LDHA Non-Auxetic Mode 9
hold on
title(files{70}(44:end-6))
[data1] = dlmread(files{70}, '\t', 2, 0);
[data2] = dlmread(files{71}, '\t', 2, 0);
[data3] = dlmread(files{72}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-3];
data2 = [data2(:,1), data2(:,2)-4];
data3 = [data3(:,1), data3(:,2)-5];
for i = 1:length(data1)
    avg_LDHA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on




subplot(3,2,6) % LDHA Equivalent Quadratic Mode 9
hold on
title(files{64}(44:end-6))
[data1] = dlmread(files{64}, '\t', 2, 0);
[data2] = dlmread(files{65}, '\t', 2, 0);
[data3] = dlmread(files{66}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-1.5];
data2 = [data2(:,1), data2(:,2)-2];
data3 = [data3(:,1), data3(:,2)-0.5];
for i = 1:length(data1)
    avg_LDHA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 15])
xlim([-1 30])
box on



%% Comparing Aux/nonaux/quadratic: Normal Amplitude, High Density:
figure

subplot(3,2,1) % LDNA Auxetic Mode 3
hold on
title(files{91}(44:end-6))
[data1] = dlmread(files{91}, '\t', 2, 0);
[data2] = dlmread(files{92}, '\t', 2, 0);
[data3] = dlmread(files{93}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-6];
data2 = [data2(:,1), data2(:,2)-4.5];
data3 = [data3(:,1), data3(:,2)-6.5];
for i = 1:length(data1)
    avg_LDNA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
box on
xlim([-1 30])



subplot(3,2,3) % LDNA Non-Auxetic Mode 3
hold on
title(files{103}(44:end-6))
[data1] = dlmread(files{103}, '\t', 2, 0);
[data2] = dlmread(files{104}, '\t', 2, 0);
[data3] = dlmread(files{105}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2.5];
data2 = [data2(:,1), data2(:,2)-2.5];
for i = 1:length(data1)
    avg_LDNA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2)]), mean([data1(i,1), data2(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
%plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])


box on


subplot(3,2,5) % HDNA Equivalent Quadratic Mode 3
hold on
title(files{97}(44:end-6))
[data1] = dlmread(files{97}, '\t', 2, 0);
[data2] = dlmread(files{98}, '\t', 2, 0);
[data3] = dlmread(files{99}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2];
data2 = [data2(:,1), data2(:,2)-2];
data3 = [data3(:,1), data3(:,2)-3];
for i = 1:length(data1)
    avg_LDNA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])


box on



subplot(3,2,2) % LDNA Auxetic Mode 9
hold on
title(files{94}(44:end-6))
[data1] = dlmread(files{94}, '\t', 2, 0);
[data2] = dlmread(files{95}, '\t', 2, 0);
[data3] = dlmread(files{96}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2];
data2 = [data2(:,1), data2(:,2)-5.5];
data3 = [data3(:,1), data3(:,2)-4.5];
for i = 1:length(data1)
    avg_LDNA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])


box on

subplot(3,2,4) % LDNA Non-Auxetic Mode 9
hold on
title(files{105}(44:end-6))
[data1] = dlmread(files{105}, '\t', 2, 0);
[data2] = dlmread(files{106}, '\t', 2, 0);
[data3] = dlmread(files{107}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-4.25];
data2 = [data2(:,1), data2(:,2)-4];
data3 = [data3(:,1), data3(:,2)-4];
for i = 1:length(data1)
    avg_LDNA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])


box on


subplot(3,2,6) % LDNA Equivalent Quadratic Mode 9
hold on
title(files{100}(44:end-6))
[data1] = dlmread(files{100}, '\t', 2, 0);
[data2] = dlmread(files{101}, '\t', 2, 0);
[data3] = dlmread(files{102}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-4.75];
data2 = [data2(:,1), data2(:,2)-4];
data3 = [data3(:,1), data3(:,2)-24.25];
for i = 1:length(data1)
    avg_LDNA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on




%% Aux/nonaux/quadratic: Comparing Low Density
figure

subplot(3,2,1) % LDLA Auxetic Mode 3
hold on
title(files{73}(44:end-6))
[data1] = dlmread(files{73}, '\t', 2, 0);
[data2] = dlmread(files{74}, '\t', 2, 0);
[data3] = dlmread(files{75}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-4.75];
data2 = [data2(:,1), data2(:,2)-3.5];
data3 = [data3(:,1), data3(:,2)-2.5];

for i = 1:length(data1)
    avg_LDLA_aux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on



subplot(3,2,3) % LDLA Non-Auxetic Mode 3
hold on
title(files{85}(44:end-6))
[data1] = dlmread(files{85}, '\t', 2, 0);
[data2] = dlmread(files{86}, '\t', 2, 0);
[data3] = dlmread(files{87}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-4.5];
data2 = [data2(:,1), data2(:,2)-4.5];
data3 = [data3(:,1), data3(:,2)-4];
for i = 1:length(data1)
    avg_LDLA_nonaux3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on




subplot(3,2,5) % LDLA Equivalent Quadratic Mode 3
hold on
title(files{79}(44:end-6))
[data1] = dlmread(files{79}, '\t', 2, 0);
[data2] = dlmread(files{80}, '\t', 2, 0);
[data3] = dlmread(files{81}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-3.5];
data2 = [data2(:,1), data2(:,2)-4];
data3 = [data3(:,1), data3(:,2)-4];
for i = 1:length(data1)
    avg_LDLA_quadratic3(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on





subplot(3,2,2) % LDLA Auxetic Mode 9
hold on
title(files{76}(44:end-6))
[data1] = dlmread(files{76}, '\t', 2, 0);
[data2] = dlmread(files{77}, '\t', 2, 0);
[data3] = dlmread(files{78}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-5];
data2 = [data2(:,1), data2(:,2)-5];
data3 = [data3(:,1), data3(:,2)-4];
for i = 1:length(data1)
    avg_LDLA_aux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on



subplot(3,2,4) % LDLA Non-Auxetic Mode 9
hold on
title(files{88}(44:end-6))
[data1] = dlmread(files{88}, '\t', 2, 0);
[data2] = dlmread(files{89}, '\t', 2, 0);
[data3] = dlmread(files{90}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-2.5];
data2 = [data2(:,1), data2(:,2)-2.5];
data3 = [data3(:,1), data3(:,2)-3.25];
for i = 1:length(data1)
    avg_LDLA_nonaux9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on




subplot(3,2,6) % LDLA Equivalent Quadratic Mode 9
hold on
title(files{82}(44:end-6))
[data1] = dlmread(files{82}, '\t', 2, 0);
[data2] = dlmread(files{83}, '\t', 2, 0);
[data3] = dlmread(files{84}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-3];
data2 = [data2(:,1), data2(:,2)-2.5];
data3 = [data3(:,1), data3(:,2)-3];
for i = 1:length(data1)
    avg_LDLA_quadratic9(i,1:2) = [mean([data1(i,2), data2(i,2), data3(i,2)]), mean([data1(i,1), data2(i,1), data3(i,1)])];
end
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on



%% Auxetic: Comparing Amplitude
figure

subplot(3,2,1) % LDHA Auxetic Mode 3
hold on
title(files{55}(44:end-6))
[data1] = dlmread(files{55}, '\t', 2, 0);
[data2] = dlmread(files{56}, '\t', 2, 0);
[data3] = dlmread(files{57}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-5];
data2 = [data2(:,1), data2(:,2)-7];
data3 = [data3(:,1), data3(:,2)-5.25];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on

subplot(3,2,3) % LDNA Auxetic Mode 3
hold on
title(files{91}(44:end-6))
[data1] = dlmread(files{91}, '\t', 2, 0);
[data2] = dlmread(files{92}, '\t', 2, 0);
[data3] = dlmread(files{93}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-6];
data2 = [data2(:,1), data2(:,2)-5];
data3 = [data3(:,1), data3(:,2)-6.5];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])

box on
subplot(3,2,5) % LDLA Auxetic Mode 3
hold on
title(files{73}(44:end-6))
[data1] = dlmread(files{73}, '\t', 2, 0);
[data2] = dlmread(files{74}, '\t', 2, 0);
[data3] = dlmread(files{75}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-5];
data2 = [data2(:,1), data2(:,2)-4];
data3 = [data3(:,1), data3(:,2)-3];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])

box on


subplot(3,2,2) % LDHA Auxetic Mode 9
hold on
title(files{58}(44:end-6))
[data1] = dlmread(files{58}, '\t', 2, 0);
[data2] = dlmread(files{59}, '\t', 2, 0);
[data3] = dlmread(files{60}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-6.5];
data2 = [data2(:,1), data2(:,2)-6.5];
data3 = [data3(:,1), data3(:,2)-7.5];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])

box on
subplot(3,2,4) % LDNA Auxetic Mode 9
hold on
title(files{94}(44:end-6))
[data1] = dlmread(files{94}, '\t', 2, 0);
[data2] = dlmread(files{95}, '\t', 2, 0);
[data3] = dlmread(files{96}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-3];
data2 = [data2(:,1), data2(:,2)-5.25];
data3 = [data3(:,1), data3(:,2)-4.75];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])

box on
subplot(3,2,6) % LDLA Auxetic Mode 9
hold on
title(files{76}(44:end-6))
[data1] = dlmread(files{76}, '\t', 2, 0);
[data2] = dlmread(files{77}, '\t', 2, 0);
[data3] = dlmread(files{78}, '\t', 2, 0);
data1 = [data1(:,1), data1(:,2)-5];
data2 = [data2(:,1), data2(:,2)-5];
data3 = [data3(:,1), data3(:,2)-4.5];
plot(data1(:,2), data1(:,1), 'k-');
plot(data2(:,2), data2(:,1), 'g--');
plot(data3(:,2), data3(:,1), 'm-.');
xlabel('Extension, mm')
ylabel('Force, N')
ylim([-1 10])
xlim([-1 30])
box on


%% Comparing On the Same Plots: Mode 3

figure
subplot(3,2,1)
box on
hold on

plot(avg_HDHA_aux3(:,1), avg_HDHA_aux3(:,2), 'k-')
plot(avg_HDHA_nonaux3(:,1), avg_HDHA_nonaux3(:,2), 'g--')
plot(avg_HDHA_quadratic3(:,1), avg_HDHA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('High Density, High Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 40])


subplot(3,2,3)
box on
hold on

plot(avg_HDNA_aux3(:,1), avg_HDNA_aux3(:,2), 'k-')
plot(avg_HDNA_nonaux3(:,1), avg_HDNA_nonaux3(:,2), 'g--')
plot(avg_HDNA_quadratic3(:,1), avg_HDNA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('High Density, Normal Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 40])


subplot(3,2,5)
box on
hold on

plot(avg_HDLA_aux3(:,1), avg_HDLA_aux3(:,2), 'k-')
plot(avg_HDLA_nonaux3(:,1), avg_HDLA_nonaux3(:,2), 'g--')
plot(avg_HDLA_quadratic3(:,1), avg_HDLA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('High Density, Low Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')

xlim([-1 22])
ylim([-1 40])






%% Comparing On the Same Plots: Mode 9

subplot(3,2,2)
box on
hold on

plot(avg_HDHA_aux9(:,1), avg_HDHA_aux9(:,2), 'k-')
plot(avg_HDHA_nonaux9(:,1), avg_HDHA_nonaux9(:,2), 'g--')
plot(avg_HDHA_quadratic9(:,1), avg_HDHA_quadratic9(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('High Density, High Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 40])


subplot(3,2,4)
box on
hold on

plot(avg_HDNA_aux9(:,1), avg_HDNA_aux9(:,2), 'k-')
plot(avg_HDNA_nonaux9(:,1), avg_HDNA_nonaux9(:,2), 'g--')
plot(avg_HDNA_quadratic9(:,1), avg_HDNA_quadratic9(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('High Density, Normal Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 40])


subplot(3,2,6)
box on
hold on

plot(avg_HDLA_aux9(:,1), avg_HDLA_aux9(:,2), 'k-')
plot(avg_HDLA_nonaux9(:,1), avg_HDLA_nonaux9(:,2), 'g--')
plot(avg_HDLA_quadratic9(:,1), avg_HDLA_quadratic9(:,2), 'm-.')

legend({'Re-Entrant Auxetic Sinusoidal Pattern', 'Disrupted Sinusoidal Pattern', 'Equivalent Density Quadratic Pattern'})
title('High Density, Low Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 40])



figure
subplot(3,2,1)
box on
hold on

plot(avg_LDHA_aux3(:,1), avg_LDHA_aux3(:,2), 'k-')
plot(avg_LDHA_nonaux3(:,1), avg_LDHA_nonaux3(:,2), 'g--')
plot(avg_LDHA_quadratic3(:,1), avg_LDHA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('Low Density, High Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])



subplot(3,2,3)
box on
hold on

plot(avg_LDNA_aux3(:,1), avg_LDNA_aux3(:,2), 'k-')
plot(avg_LDNA_nonaux3(:,1), avg_LDNA_nonaux3(:,2), 'g--')
plot(avg_LDNA_quadratic3(:,1), avg_LDNA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('Low Density, Normal Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])



subplot(3,2,5)
box on
hold on

plot(avg_LDLA_aux3(:,1), avg_LDLA_aux3(:,2), 'k-')
plot(avg_LDLA_nonaux3(:,1), avg_LDLA_nonaux3(:,2), 'g--')
plot(avg_LDLA_quadratic3(:,1), avg_LDLA_quadratic3(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('Low Density, Low Amplitude Mode 3')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])



subplot(3,2,2)
box on
hold on

plot(avg_LDHA_aux9(:,1), avg_LDHA_aux9(:,2), 'k-')
plot(avg_LDHA_nonaux9(:,1), avg_LDHA_nonaux9(:,2), 'g--')
plot(avg_LDHA_quadratic9(:,1), avg_LDHA_quadratic9(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('Low Density, High Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])



subplot(3,2,4)
box on
hold on

plot(avg_LDNA_aux9(:,1), avg_LDNA_aux9(:,2), 'k-')
plot(avg_LDNA_nonaux9(:,1), avg_LDNA_nonaux9(:,2), 'g--')
plot(avg_LDNA_quadratic9(:,1), avg_LDNA_quadratic9(:,2), 'm-.')

legend({'Auxetic', 'Non-Auxetic', 'Quadratic Lattice'})
title('Low Density, Normal Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])



subplot(3,2,6)
box on
hold on

plot(avg_LDLA_aux9(:,1), avg_LDLA_aux9(:,2), 'k-')
plot(avg_LDLA_nonaux9(:,1), avg_LDLA_nonaux9(:,2), 'g--')
plot(avg_LDLA_quadratic9(:,1), avg_LDLA_quadratic9(:,2), 'm-.')

legend({'Re-Entrant Auxetic Sinusoidal Pattern', 'Disrupted Sinusoidal Pattern', 'Equivalent Density Quadratic Pattern'})
title('Low Density, Low Amplitude Mode 9')
xlabel('Extension, mm')
ylabel('Force, N')
xlim([-1 22])
ylim([-1 10])


figure
subplot(2,2,1)
hold on
plot(avg_HDHA_aux3(:,1), avg_HDHA_aux3(:,2), 'k-')
plot(avg_HDNA_aux3(:,1), avg_HDNA_aux3(:,2), 'r.')
plot(avg_HDLA_aux3(:,1), avg_HDLA_aux3(:,2), 'g.-')
title('Average Failure Curves for High Density Mode 3 for varying Amplitude')
legend({'High Amplitude,' 'Mid Amplitude', 'Low Amplitude'})
xlim([0 22])
ylim([0 30])
xlabel('Displacement, mm')
ylabel('Force, N')


subplot(2,2,2)
hold on
plot(avg_LDHA_aux3(:,1), avg_LDHA_aux3(:,2), 'k-')
plot(avg_LDNA_aux3(:,1), avg_LDNA_aux3(:,2), 'r.')
plot(avg_LDLA_aux3(:,1), avg_LDLA_aux3(:,2), 'g.-')
title('Average Failure Curves for Low Density Mode 3 for varying Amplitude')
legend({'High Amplitude,' 'Mid Amplitude', 'Low Amplitude'})
xlim([0 22])
ylim([0 8])
xlabel('Displacement, mm')
ylabel('Force, N')

subplot(2,2,3)
hold on
plot(avg_HDHA_aux9(:,1), avg_HDHA_aux9(:,2), 'k-')
plot(avg_HDNA_aux9(:,1), avg_HDNA_aux9(:,2), 'r.')
plot(avg_HDLA_aux9(:,1), avg_HDLA_aux9(:,2), 'g.-')
title('Average Failure Curves for High Density Mode 9 for varying Amplitude')
legend({'High Amplitude,' 'Mid Amplitude', 'Low Amplitude'})

xlim([0 22])
ylim([0 30])
xlabel('Displacement, mm')
ylabel('Force, N')


subplot(2,2,4)
hold on
plot(avg_LDHA_aux9(:,1), avg_LDHA_aux9(:,2), 'k-')
plot(avg_LDNA_aux9(:,1), avg_LDNA_aux9(:,2), 'r.')
plot(avg_LDLA_aux9(:,1), avg_LDLA_aux9(:,2), 'g.-')
title('Average Failure Curves for Low Density Mode 9 for varying Amplitude')
legend({'High Amplitude,' 'Mid Amplitude', 'Low Amplitude'})

xlim([0 22])
ylim([-2 8])
xlabel('Displacement, mm')
ylabel('Force, N')



% for i = 1:34
% 
%     file_str1 = strcat(path_failure, failure_strs{3*i-2});
%     file_str2 = strcat(path_failure, failure_strs{3*i-1});
%     file_str3 = strcat(path_failure, failure_strs{3*i});
% 
%     fig_title = strcat('failure',failure_strs{3*i-2}(1:end-6));
% 
% 
% %     data =
%     fid1 = fopen(file_str1, 'r');
%     fid2 = fopen(file_str2, 'r');
%     fid3 = fopen(file_str3, 'r');
%     [data1] = dlmread(file_str1, '\t', 2, 0);
%     [data2] = dlmread(file_str2, '\t', 2, 0);
%     [data3] = dlmread(file_str3, '\t', 2, 0);
%     fclose(fid1);
%     fclose(fid2);
%     fclose(fid3);
% 
% 
%     % First, we have to delete the first two lines, because Lloyd
%     % Instruments' engineers are dumbasses:
%     figure
%     hold on
%     plot(data1(:,2), data1(:,1), 'k-');
%     plot(data2(:,2), data2(:,1), 'g.');
%     plot(data3(:,2), data3(:,1), 'm*');
% 
%     title(fig_title)
%     xlabel('Extension, mm')
%     ylabel('Load, N')
%     saveas(gcf, fig_title, 'pdf')
%     close(gcf)
% 
% end
% 
% 
%     file_str1 = strcat(path_failure, failure_strs{103});
%     file_str2 = strcat(path_failure, failure_strs{104});
% 
%     fig_title = strcat('failure',failure_strs{103}(1:end-6));
% 
%     fid1 = fopen(file_str1, 'r');
%     fid2 = fopen(file_str2, 'r');
%     [data1] = dlmread(file_str1, '\t', 2, 0);
%     [data2] = dlmread(file_str2, '\t', 2, 0);
%     fclose(fid1);
%     fclose(fid2);
%     figure
%     hold on
%     plot(data1(:,2), data1(:,1), 'k-');
%     plot(data2(:,2), data2(:,1), 'g.');
%     title(fig_title)
%     xlabel('Extension, mm')
%     ylabel('Load, N')
%     saveas(gcf, fig_title, 'pdf')
%     close(gcf)
%     
%         file_str1 = strcat(path_failure, failure_strs{105});
%     file_str2 = strcat(path_failure, failure_strs{106});
%     file_str3 = strcat(path_failure, failure_strs{107});
% 
%     fig_title = strcat('failure',failure_strs{105}(1:end-6));
% 
% 
% %     data =
%     fid1 = fopen(file_str1, 'r');
%     fid2 = fopen(file_str2, 'r');
%     fid3 = fopen(file_str3, 'r');
%     [data1] = dlmread(file_str1, '\t', 2, 0);
%     [data2] = dlmread(file_str2, '\t', 2, 0);
%     [data3] = dlmread(file_str3, '\t', 2, 0);
%     fclose(fid1);
%     fclose(fid2);
%     fclose(fid3);
% 
% 
%     % First, we have to delete the first two lines, because Lloyd
%     % Instruments' engineers are dumbasses:
%     figure
%     hold on
%     plot(data1(:,2), data1(:,1), 'k-');
%     plot(data2(:,2), data2(:,1), 'g.');
%     plot(data3(:,2), data3(:,1), 'm*');
% 
%     title(fig_title)
%     xlabel('Extension, mm')
%     ylabel('Load, N')
%     saveas(gcf, fig_title, 'pdf')
%     close(gcf)


%% Cyclic Testing
path_cyclic = 'D:\Data\Mechanical_Testing\Cyclic_Testing\';
cyclic_strs = {'HDHA_aux_mode3_0.txt','HDHA_aux_mode3_1.txt','HDHA_aux_mode3_2.txt','HDHA_aux_mode9_0.txt','HDHA_aux_mode9_1.txt','HDHA_aux_mode9_2.txt','HDHA_equmesh_mode3_0.txt','HDHA_equmesh_mode3_1.txt','HDHA_equmesh_mode3_2.txt','HDHA_equmesh_mode9_0.txt','HDHA_equmesh_mode9_1.txt','HDHA_equmesh_mode9_2.txt','HDHA_nonaux_mode3_0.txt','HDHA_nonaux_mode3_1.txt','HDHA_nonaux_mode3_2.txt','HDHA_nonaux_mode9_0.txt','HDHA_nonaux_mode9_1.txt','HDHA_nonaux_mode9_2.txt','HDLA_aux_mode3_0.txt','HDLA_aux_mode3_1.txt','HDLA_aux_mode3_2.txt','HDLA_aux_mode9_0.txt','HDLA_aux_mode9_1.txt','HDLA_aux_mode9_2.txt','HDLA_equmesh_mode3_0.txt','HDLA_equmesh_mode3_1.txt','HDLA_equmesh_mode3_2.txt','HDLA_equmesh_mode9_0.txt','HDLA_equmesh_mode9_1.txt','HDLA_equmesh_mode9_2.txt','HDLA_nonaux_mode3_0.txt','HDLA_nonaux_mode3_1.txt','HDLA_nonaux_mode3_2.txt','HDLA_nonaux_mode9_0.txt','HDLA_nonaux_mode9_1.txt','HDLA_nonaux_mode9_2.txt','HDNA_aux_mode3_0.txt','HDNA_aux_mode3_1.txt','HDNA_aux_mode3_2.txt','HDNA_aux_mode9_0.txt','HDNA_aux_mode9_1.txt','HDNA_aux_mode9_2.txt','HDNA_equmesh_mode3_0.txt','HDNA_equmesh_mode3_1.txt','HDNA_equmesh_mode3_2.txt','HDNA_equmesh_mode9_0.txt','HDNA_equmesh_mode9_1.txt','HDNA_equmesh_mode9_2.txt','HDNA_nonaux_mode3_0.txt','HDNA_nonaux_mode3_1.txt','HDNA_nonaux_mode3_2.txt','HDNA_nonaux_mode9_0.txt','HDNA_nonaux_mode9_1.txt','HDNA_nonaux_mode9_2.txt','LDHA_aux_mode3_0.txt','LDHA_aux_mode3_1.txt','LDHA_aux_mode3_2.txt','LDHA_aux_mode9_0.txt','LDHA_aux_mode9_1.txt','LDHA_aux_mode9_2.txt','LDHA_equmesh_mode3_0.txt','LDHA_equmesh_mode3_1.txt','LDHA_equmesh_mode3_2.txt','LDHA_equmesh_mode9_0.txt','LDHA_equmesh_mode9_1.txt','LDHA_equmesh_mode9_2.txt','LDHA_nonaux_mode3_0.txt','LDHA_nonaux_mode3_1.txt','LDHA_nonaux_mode3_2.txt','LDHA_nonaux_mode9_0.txt','LDHA_nonaux_mode9_1.txt','LDHA_nonaux_mode9_3.txt','LDLA_aux_mode3_0.txt','LDLA_aux_mode3_1.txt','LDLA_aux_mode3_2.txt','LDLA_aux_mode9_0.txt','LDLA_aux_mode9_1.txt','LDLA_aux_mode9_2.txt','LDLA_equmesh_mode3_0.txt','LDLA_equmesh_mode3_1.txt','LDLA_equmesh_mode3_2.txt','LDLA_equmesh_mode9_0.txt','LDLA_equmesh_mode9_1.txt','LDLA_equmesh_mode9_2.txt','LDLA_nonaux_mode3_0.txt','LDLA_nonaux_mode3_1.txt','LDLA_nonaux_mode3_2.txt','LDLA_nonaux_mode9_0.txt','LDLA_nonaux_mode9_1.txt','LDLA_nonaux_mode9_2.txt','LDNA_aux_mode3_0.txt','LDNA_aux_mode3_1.txt','LDNA_aux_mode3_2.txt','LDNA_aux_mode9_0.txt','LDNA_aux_mode9_1.txt','LDNA_aux_mode9_2.txt','LDNA_equmesh_mode3_0.txt','LDNA_equmesh_mode3_1.txt','LDNA_equmesh_mode3_2.txt','LDNA_equmesh_mode9_0.txt','LDNA_equmesh_mode9_1.txt','LDNA_equmesh_mode9_2.txt','LDNA_nonaux_mode3_0.txt','LDNA_nonaux_mode3_1.txt','LDNA_nonaux_mode3_2.txt','LDNA_nonaux_mode9_0.txt','LDNA_nonaux_mode9_1.txt','LDNA_nonaux_mode9_2.txt'};
% for j = 1:3
%     for i = 1:12
%         file_str1 = strcat(path_cyclic, cyclic_strs{3*i-2});
%         file_str2 = strcat(path_cyclic, cyclic_strs{3*i-1});
%         file_str3 = strcat(path_cyclic, cyclic_strs{3*i});
% 
%         fig_title = strcat('cyclic',cyclic_strs{3*i-2}(1:end-6));
% 
% 
%     %     data =
%         fid1 = fopen(file_str1, 'r');
%         fid2 = fopen(file_str2, 'r');
%         fid3 = fopen(file_str3, 'r');
%         [data1] = dlmread(file_str1, '\t', 2, 0);
%         [data2] = dlmread(file_str2, '\t', 2, 0);
%         [data3] = dlmread(file_str3, '\t', 2, 0);
%         fclose(fid1);
%         fclose(fid2);
%         fclose(fid3);
% 
% 
%         % First, we have to delete the first two lines, because Lloyd
%         % Instruments' engineers are dumbasses:
%         figure
%         hold on
%         plot(data1(:,2), data1(:,1), 'k-');
%         plot(data2(:,2), data2(:,1), 'g.');
%         plot(data3(:,2), data3(:,1), 'm*');
% 
%         title(fig_title)
%         xlabel('Extension, mm')
%         ylabel('Load, N')
%         saveas(gcf, fig_title, 'pdf')
%         close(gcf)
%     end
% end
