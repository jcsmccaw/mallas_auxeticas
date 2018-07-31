%% Chord error figure:
figure
x = 0:0.01:pi;
plot(x, sin(x), 'k', 'LineWidth', 2)
hold on
plot([pi/6, 5*pi/6],[sin(pi/6) sin(5*pi/6)], 'r', 'LineWidth', 2)
plot([pi/2 pi/2], [sin(pi/6) sin(pi/2)], 'b', 'LineWidth', 2)
set(gca, 'YTick', [])
xticks([0 pi/2 pi])
xticklabels({'0', '\pi/2', '\pi'})
box on
xlim([-0.1 (pi + 0.1)])
ylim([0 1.1])
text(pi/2, sin(pi/4), '\leftarrow h', 'FontSize', 24)
text(2*pi/3, sin(pi/6)-.07, '\uparrow d_i','FontSize', 24)
text(pi/48, sin(pi/3), {'A\cdotsin(f\cdott)','        \rightarrow'},'FontSize', 24)