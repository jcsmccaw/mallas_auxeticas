% After importing data:

%% Aux vs. Non-Aux vs. Equivalent Mesh:
figure
hold on
subplot(3,2,1)
boxplot([HDHA_aux_mode3_0,HDHA_equmesh_mode3_0,HDHA_nonaux_mode3_0],'Orientation', 'horizontal','Jitter',0.5, 'PlotStyle',  'traditional','Widths',0.2,'Notch', 'marker','Colors','k', 'Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('High Density, High Amplitude Dissipation in First Cycle, Mode 3')


subplot(3,2,5)
boxplot([HDLA_aux_mode3_0,HDLA_equmesh_mode3_0,HDLA_nonaux_mode3_0],'Orientation', 'horizontal','Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2,'Colors','k','Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
xlabel('\Delta E')
title('High Density, Low Amplitude Dissipation in First Cycle, Mode 3')


subplot(3,2,3)
boxplot([HDNA_aux_mode3_0,HDNA_equmesh_mode3_0,HDNA_nonaux_mode3_0],'Orientation', 'horizontal','Jitter',0.5, 'PlotStyle', 'traditional','Widths',0.2,'Colors','k', 'Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('High Density, Normal Amplitude Dissipation in First Cycle, Mode 3')


subplot(3,2,2)
boxplot([LDHA_aux_mode3_0,LDHA_equmesh_mode3_0,LDHA_nonaux_mode3_0],'Orientation', 'horizontal','Jitter',0.5, 'PlotStyle', 'traditional','Widths',0.2,'Colors','k', 'Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('Low Density, High Amplitude Dissipation in First Cycle, Mode 3')


subplot(3,2,6)
boxplot([LDLA_aux_mode3_0,LDLA_equmesh_mode3_0,LDLA_nonaux_mode3_0],'Orientation', 'horizontal','Jitter',0.5, 'PlotStyle', 'traditional','Widths',0.2,'Colors','k','Notch', 'marker', 'Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
xlabel('\Delta E')
title('Low Density, Low Amplitude Dissipation in First Cycle, Mode 3')


subplot(3,2,4)
boxplot([LDNA_aux_mode3_0,LDNA_equmesh_mode3_0,LDNA_nonaux_mode3_0], 'Orientation', 'horizontal','Jitter',0.5,'PlotStyle', 'traditional', 'Widths',0.2,'Colors','k','Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('Low Density, Normal Amplitude Dissipation in First Cycle, Mode 3')


figure
hold on
title('Mode 9')
subplot(3,2,1)
boxplot([HDHA_aux_mode9_0,HDHA_equmesh_mode9_0,HDHA_nonaux_mode9_0],'Orientation', 'horizontal', 'Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2, 'Colors','k','Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('High Density, High Amplitude Dissipation in First Cycle, Mode 9')


subplot(3,2,5)
boxplot([HDLA_aux_mode9_0,HDLA_equmesh_mode9_0,HDLA_nonaux_mode9_0],'Orientation', 'horizontal', 'Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2,'Colors','k','Notch', 'marker', 'Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
xlabel('\Delta E')
title('High Density, Low Amplitude Dissipation in First Cycle, Mode 9')


subplot(3,2,3)
boxplot([HDNA_aux_mode9_0,HDNA_equmesh_mode9_0,HDNA_nonaux_mode9_0], 'Orientation', 'horizontal','Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2,'Colors','k', 'Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('High Density, Normal Amplitude Dissipation in First Cycle, Mode 9')


subplot(3,2,2)
boxplot([LDHA_aux_mode9_0,LDHA_equmesh_mode9_0,LDHA_nonaux_mode9_0], 'Orientation', 'horizontal','Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2,'Colors','k', 'Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('Low Density, High Amplitude Dissipation in First Cycle, Mode 9')


subplot(3,2,6)
boxplot([LDLA_aux_mode9_0,LDLA_equmesh_mode9_0,LDLA_nonaux_mode9_0],'Orientation', 'horizontal','Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2,'Colors','k', 'Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
xlabel('\Delta E')
title('Low Density, Low Amplitude Dissipation in First Cycle, Mode 9')


subplot(3,2,4)
boxplot([LDNA_aux_mode9_0,LDNA_equmesh_mode9_0,LDNA_nonaux_mode9_0],'Orientation', 'horizontal', 'Jitter',0.5,'PlotStyle', 'traditional','Widths',0.2, 'Colors','k','Notch', 'marker','Labels', {'Auxetic Sinusoids','Equivalent Quadratic','Non-Auxetic Sinusoids'})
%xlabel('\Delta E')
title('Low Density, Normal Amplitude Dissipation in First Cycle, Mode 9')

figure
hold on
subplot(2,2,1)
boxplot([HDHA_aux_mode3_0, HDNA_aux_mode3_0, HDLA_aux_mode3_0], 'Orientation', 'horizontal', 'Jitter', 0.5, 'PlotStyle', 'traditional', 'Widths', 0.2, 'Colors', 'k', 'Notch', 'marker', 'Labels', {'High Amplitude', 'Normal Amplitude', 'Low Amplitude'});
xlabel('\Delta A')
title('Comparing Amplitude for Auxetic Traces: High Density Mode 3')

subplot(2,2,3)
boxplot([LDHA_aux_mode3_0, LDNA_aux_mode3_0, LDLA_aux_mode3_0], 'Orientation', 'horizontal', 'Jitter', 0.5, 'PlotStyle', 'traditional', 'Widths', 0.2, 'Colors', 'k', 'Notch', 'marker', 'Labels', {'High Amplitude', 'Normal Amplitude', 'Low Amplitude'});
xlabel('\Delta A')
title('Comparing Amplitude for Auxetic Traces: Low Density Mode 3')


subplot(2,2,2)
boxplot([HDHA_aux_mode9_0, HDNA_aux_mode9_0, HDLA_aux_mode9_0], 'Orientation', 'horizontal', 'Jitter', 0.5, 'PlotStyle', 'traditional', 'Widths', 0.2, 'Colors', 'k', 'Notch', 'marker', 'Labels', {'High Amplitude', 'Normal Amplitude', 'Low Amplitude'});
xlabel('\Delta A')
title('Comparing Amplitude for Auxetic Traces: High Density Mode 9')

subplot(2,2,4)
boxplot([LDHA_aux_mode9_0, LDNA_aux_mode9_0, LDLA_aux_mode9_0], 'Orientation', 'horizontal', 'Jitter', 0.5, 'PlotStyle', 'traditional', 'Widths', 0.2, 'Colors', 'k', 'Notch', 'marker', 'Labels', {'High Amplitude', 'Normal Amplitude', 'Low Amplitude'});
xlabel('\Delta A')
title('Comparing Amplitude for Auxetic Traces: Low Density Mode 9')


% 
% %% ANOVA Analysis
% hys_areas = {'HDHA_aux_mode3_0', 'HDHA_aux_mode9_0', 'HDHA_equmesh_mode3_0', 'HDHA_equmesh_mode9_0', 'HDHA_nonaux_mode3_0', 'HDHA_nonaux_mode9_0', 'HDLA_aux_mode3_0', 'HDLA_aux_mode9_0', 'HDLA_equmesh_mode3_0', 'HDLA_equmesh_mode9_0', 'HDLA_nonaux_mode3_0', 'HDLA_nonaux_mode9_0', 'HDNA_aux_mode3_0', 'HDNA_aux_mode9_0', 'HDNA_equmesh_mode3_0', 'HDNA_equmesh_mode9_0', 'HDNA_nonaux_mode3_0', 'HDNA_nonaux_mode9_0', 'LDHA_aux_mode3_0', 'LDHA_aux_mode9_0', 'LDHA_equmesh_mode3_0', 'LDHA_equmesh_mode9_0', 'LDHA_nonaux_mode3_0', 'LDHA_nonaux_mode9_0', 'LDLA_aux_mode3_0', 'LDLA_aux_mode9_0', 'LDLA_equmesh_mode3_0', 'LDLA_equmesh_mode9_0', 'LDLA_nonaux_mode3_0', 'LDLA_nonaux_mode9_0', 'LDNA_aux_mode3_0', 'LDNA_aux_mode9_0', 'LDNA_equmesh_mode3_0', 'LDNA_equmesh_mode9_0', 'LDNA_nonaux_mode3_0', 'LDNA_nonaux_mode9_0';...
%     HDHA_aux_mode3_0, HDHA_aux_mode9_0, HDHA_equmesh_mode3_0, HDHA_equmesh_mode9_0, HDHA_nonaux_mode3_0, HDHA_nonaux_mode9_0, HDLA_aux_mode3_0, HDLA_aux_mode9_0, HDLA_equmesh_mode3_0, HDLA_equmesh_mode9_0, HDLA_nonaux_mode3_0, HDLA_nonaux_mode9_0, HDNA_aux_mode3_0, HDNA_aux_mode9_0, HDNA_equmesh_mode3_0, HDNA_equmesh_mode9_0, HDNA_nonaux_mode3_0, HDNA_nonaux_mode9_0, LDHA_aux_mode3_0, LDHA_aux_mode9_0, LDHA_equmesh_mode3_0, LDHA_equmesh_mode9_0, LDHA_nonaux_mode3_0, LDHA_nonaux_mode9_0, LDLA_aux_mode3_0, LDLA_aux_mode9_0, LDLA_equmesh_mode3_0, LDLA_equmesh_mode9_0, LDLA_nonaux_mode3_0, LDLA_nonaux_mode9_0, LDNA_aux_mode3_0, LDNA_aux_mode9_0, LDNA_equmesh_mode3_0, LDNA_equmesh_mode9_0, LDNA_nonaux_mode3_0, LDNA_nonaux_mode9_0};
% 
% density = {'high', 'low'};
% amplitude = {'high', 'normal', 'low'};
% mode = {'Mode3', 'Mode9'};
% quadratic = {'Yes', 'No'};
% auxetic = {'Yes', 'No'};
