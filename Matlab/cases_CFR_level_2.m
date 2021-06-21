% =========================================================================
% Contour plot to show the number of reported COVID-19 cases there needs (in a month) to
% be for COVID-19 to be one of the top 3 (level 2) causes of death (in 2021)
% 
% Analysis is done for the United States, Brazil, South Africa, Iran,
% United Kingdom, Russia, China, India
% 
% AUTHOR: EYSC
% LAST MODIFIED: June 17, 2021
% =========================================================================

%% Set up
% Set range of x axis (represents case fatality rate)
Nx = 1000;
xmin = 0.001;
xmax = 0.05;
x = linspace(xmin, xmax, Nx);

% Set length of y axis
Ny = 10000;

% Read data as table
data = readtable('../Predicted Values/level2_extrapolation.csv');
data.val = data.val/12;

% Set color map
CMAP = jet(4);

%% FIGURE
figure

%% United States
ax1 = subplot(2, 4, 1);

[X, Y, Z, level] = get_case_contour(x, data, "United States of America", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e4, 1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.025, min(Y(:)), '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.9e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.7e7, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')
% Add text annotation to label causes of death
text(0.01, 7.6e6, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.02, 3.6e6, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 1.75e6, {'\leftarrow Chronic respiratory', '     diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('United States')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% Brazil
ax2 = subplot(2, 4, 2);

[X, Y, Z, level] = get_case_contour(x, data, "Brazil", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e3, 1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.0055, min(Y(:)), '1k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.62e5, '10k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.85e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.01, 3.1e6, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 1.6e6, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 8.5e5, {'\leftarrow Diabetes and', '     kidney diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Brazil')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% South Africa
ax3 = subplot(2, 4, 3);

[X, Y, Z, level] = get_case_contour(x, data, "South Africa", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e3, 1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.014, min(Y(:)), '1k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.675e5, '10k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.8e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.01, 6.8e5, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 3.4e5, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.0175, 1.85e5, {'\leftarrow Diabetes and', '     kidney diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('South Africa')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% Iran
ax4 = subplot(2, 4, 4);

[X, Y, Z, level] = get_case_contour(x, data, "Iran (Islamic Republic of)", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e3, 1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.019, min(Y(:)), '1k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.65e5, '10k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.9e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.01, 1.4e6, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 4.35e5, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 1.575e5, {'\leftarrow Diabetes and', '     kidney diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Iran')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% United Kingdom
ax5 = subplot(2, 4, 5);

[X, Y, Z, level] = get_case_contour(x, data, "United Kingdom", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e3, 1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.0105, min(Y(:)), '1k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.75e5, '10k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.85e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.005, 3.75e6, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.0125, 1.25e6, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.0075, 5.5e5, {'\leftarrow Respiratory infections', '     and tuberculosis'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% Russia
ax6 = subplot(2, 4, 6);

[X, Y, Z, level] = get_case_contour(x, data, "Russian Federation", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e3, 1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.0071, min(Y(:)), '1k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.75e5, '10k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.85e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.01, 7.1e6, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 1.85e6, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 6e5, {'\leftarrow Digestive', '     diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Russia')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% China
ax7 = subplot(2, 4, 7);

[X, Y, Z, level] = get_case_contour(x, data, "China", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e4, 1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.0055, min(Y(:)), '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.85e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.7e7, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.01, 3.7e7, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 1.65e7, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 8.75e6, {'\leftarrow Chronic respiratory', '     diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('China')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% India
ax8 = subplot(2, 4, 8);

[X, Y, Z, level] = get_case_contour(x, data, "India", 2021, Ny);

% Plot contour
contourf(X, Y, Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)

hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Z, [1e4, 1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations for white contour lines
text(0.006, min(Y(:)), '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.85e6, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')
text(0.049, 2.65e7, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

% Add text annotation to label causes of death
text(0.005, 4.4e7, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.0075, 1.25e7, {'\leftarrow Chronic respiratory', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.015, 5.9e6, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('India')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, xmax, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});

%% Axes titles
p1 = get(ax1, 'position');
p2 = get(ax2, 'position');
p3 = get(ax3, 'position');
p4 = get(ax4, 'position');
p5 = get(ax5, 'position');
p6 = get(ax6, 'position');
p7 = get(ax7, 'position');
p8 = get(ax8, 'position');

% Reduce vertical space between the two rows
y_translate = (p1(2) - (p5(2) + p5(4)))/4;

p1(2) = p1(2) - y_translate;
p2(2) = p2(2) - y_translate;
p3(2) = p3(2) - y_translate;
p4(2) = p4(2) - y_translate;

p1(4) = p1(4) + y_translate;
p2(4) = p2(4) + y_translate;
p3(4) = p3(4) + y_translate;
p4(4) = p4(4) + y_translate;
p5(4) = p5(4) + y_translate;
p6(4) = p6(4) + y_translate;
p7(4) = p7(4) + y_translate;
p8(4) = p8(4) + y_translate;

set(ax1, 'position', p1);
set(ax2, 'position', p2);
set(ax3, 'position', p3);
set(ax4, 'position', p4);
set(ax5, 'position', p5);
set(ax6, 'position', p6);
set(ax7, 'position', p7);
set(ax8, 'position', p8);

% Find location on plot to place x and y axis labels
width = p4(1) + p4(3) - p1(1);
height = p1(2) + p1(4) - p5(2);
ax9 = axes('position', [p5(1) p5(2) width height], 'visible', 'off');
ax9.XLabel.Visible = 'on';
ax9.YLabel.Visible = 'on';

axes(ax9)
xlabel('Case Fatality Rate (%)');
ylabel('Number of Cases');

% Fix size of plot
set(gcf, 'Position', [100, 100, 1000, 850])