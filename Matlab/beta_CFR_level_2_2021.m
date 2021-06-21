% =========================================================================
% Contour plot to show based on the number of COVID-19 cases (between Jan-May 2021),
% what rank COVID-19 is in terms of top (level 2) causes of deathss, adjusted
% according to CFR and correction factor
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
xmin = 0.0001;
xmax = 0.05;
x = linspace(xmin, xmax, Nx);

% Set range of x axis (represents the correction factor)
Ny = 10000;
ymin = 1;
ymax = 8;
y = linspace(ymin, ymax, Ny);

[X, Y] = meshgrid(x, y);

% Multiply CFR and correction factor together (we will multiply the number
% of cases to this matrix later)
Z = X.*Y;

% Read in estimated values for top 3 causes of death
data = readtable('../Predicted Values/level2_extrapolation.csv');

% Set colormap
CMAP = jet(4);

% Get the number of COVID-19 cases that occurred in 2020
covid_data = readtable('../Data/WHO COVID-19 Data/WHO-COVID-19-global-data.csv');

%% FIGURE
figure

%% United States
ax1 = subplot(2, 4, 1);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "United States of America", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0075, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.775, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.0075, 4.25, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 2.55, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.0045, 1.5, {'\leftarrow Chronic respiratory', '     diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('United States')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Brazil
ax2 = subplot(2, 4, 2);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "Brazil", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0115, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 2.75, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.00375, 5, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.00475, 2.5, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.00325, 1.5, {'\leftarrow Diabetes and', '     kidney diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Brazil')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% South Africa
ax3 = subplot(2, 4, 3);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "South Africa", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.01575, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 4.2, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.01, 5.7, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.013, 3.1, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.016, 1.7, {'\leftarrow Diabetes and', '    kidney disease'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('South Africa')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Iran
ax4 = subplot(2, 4, 4);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "Iran (Islamic Republic of)", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.007, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.55, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.008, 5.5, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.00575, 3.2, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.0045, 1.7, {'\leftarrow Diabetes and', '     kidney diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Iran')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% United Kingdom
ax5 = subplot(2, 4, 5);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "United Kingdom", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0055, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.275, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.0085, 5.15, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.014, 2.9, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.006, 1.8, {'\leftarrow Respiratory infections', '     and tuberculosis'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Russia
ax6 = subplot(2, 4, 6);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "Russian Federation", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.00575, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.0485, 1.4, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.03425, 5.7, {'Cardiovascular \rightarrow', 'diseases     '}, 'Color', 'k', 'FontSize', 9, 'HorizontalAlignment', 'right')
text(0.01825, 3.78, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
text(0.00775, 2.2, {'\leftarrow Digestive', '     diseases'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Russia')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% China
ax7 = subplot(2, 4, 7);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "China", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e2, 1e3], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.00775, 1, '100', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.675, '1k', 'Color', 'w', 'HorizontalAlignment', 'right')
hold off;
title('China')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% India
ax8 = subplot(2, 4, 8);

[country_Z, level] = get_beta_contour(covid_data, data, Z, "India", 2021, '2020-12-31', '2021-05-31', 150);

% Plot contour
contourf(X, Y, country_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, country_Z, [1e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.006, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.375, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.013, 4.8, {'\leftarrow Cardiovascular', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.01, 2.8, {'\leftarrow Chronic respiratory', '     diseases'}, 'Color', 'k', 'FontSize', 9)
text(0.0135, 1.8, {'\leftarrow Neoplasms'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('India')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

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
ylabel('Ratio of true:reported COVID-19 cases');

% Fix size of plot
set(gcf, 'Position', [100, 100, 1000, 850])