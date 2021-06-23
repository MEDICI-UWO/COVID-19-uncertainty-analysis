% =========================================================================
% Contour plot to show based on the number of COVID-19 cases (in 2020),
% what rank COVID-19 is in terms of top (level 3) causes of deaths, adjusted
% according to CFR and correction factor
% 
% Analysis is done for the United States for 
% 1) February 19 - March 20, 2020
% 2) June 20 - July 20, 2020
% 3) October 20 - November 19, 2020
% 4) November 20 - December 20, 2020
% 
% AUTHOR: EYSC
% LAST MODIFIED: June 22, 2021
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
data = readtable('../Predicted Values/level3_extrapolation.csv');

% Set colormap
CMAP = jet(4);

% Get the number of COVID-19 cases that occurred in 2020
covid_data = readtable('../Data/WHO COVID-19 Data/WHO-COVID-19-global-data.csv');

%% FIGURE
figure

%% United States (February 19 - March 20, 2020)
ax1 = subplot(1, 4, 1);

[country_Z, level, covid_deaths] = get_beta_contour(covid_data, data, Z, "United States of America", 2020, '2020-02-18', '2020-03-20', 30);

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
% Add black contour line to indicate the number of reported COVID-19 deaths
contour(X, Y, country_Z, [covid_deaths, covid_deaths], 'LineColor', 'k', 'LineWidth', 1.5);
% Add text annotations
text(0.007, 1, '100', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.55, '1k', 'Color', 'w', 'HorizontalAlignment', 'right')
 
% text(0.007, 4.2, {'\leftarrow Ischemic heart', '     disease'}, 'Color', 'k', 'FontSize', 9)
% text(0.0035, 2.7, {'\leftarrow Tracheal, bronchus,', '     and lung cancer'}, 'Color', 'k', 'FontSize', 9)
% text(0.0055, 1.8, {'\leftarrow COPD'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Feb. 19 - Mar. 20, 2020')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% United States (June 20 - July 20, 2020)
ax2 = subplot(1, 4, 2);

[country_Z, level, covid_deaths] = get_beta_contour(covid_data, data, Z, "United States of America", 2020, '2020-06-19', '2020-07-20', 30);

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
% Add black contour line to indicate the number of reported COVID-19 deaths
contour(X, Y, country_Z, [covid_deaths, covid_deaths], 'LineColor', 'k', 'LineWidth', 1.5);
% Add text annotations
text(0.007, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.7, '100k', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.0068, 4.59, {'\leftarrow Ischemic heart', '     disease'}, 'Color', 'k', 'FontSize', 9)
text(0.0036, 2.78, {'\leftarrow Tracheal, bronchus,', '     and lung cancer'}, 'Color', 'k', 'FontSize', 9)
text(0.0058, 1.72, {'\leftarrow COPD'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Jun. 20 - Jul. 20, 2020')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% United States (October 20 - November 19, 2020)
ax3 = subplot(1, 4, 3);

[country_Z, level, covid_deaths] = get_beta_contour(covid_data, data, Z, "United States of America", 2020, '2020-10-19', '2020-11-19', 30);

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
% Add black contour line to indicate the number of reported COVID-19 deaths
contour(X, Y, country_Z, [covid_deaths, covid_deaths], 'LineColor', 'k', 'LineWidth', 1.5);
% Add text annotations
text(0.0035, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.0305, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')

text(0.0031, 4.83, {'\leftarrow Ischemic heart', '     disease'}, 'Color', 'k', 'FontSize', 9)
text(0.0017, 2.7, {'\leftarrow Tracheal, bronchus,', '     and lung cancer'}, 'Color', 'k', 'FontSize', 9)
text(0.003, 1.66, {'\leftarrow COPD'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Oct. 20 - Nov. 19, 2020')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% United States (November 20 - December 20, 2020)
ax4 = subplot(1, 4, 4);

[country_Z, level, covid_deaths] = get_beta_contour(covid_data, data, Z, "United States of America", 2020, '2020-11-19', '2020-12-20', 30);

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
% Add black contour line to indicate the number of reported COVID-19 deaths
contour(X, Y, country_Z, [covid_deaths, covid_deaths], 'LineColor', 'k', 'LineWidth', 1.5);
% Add text annotations
text(0.002, 1, '10k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.0165, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')

text(0.0021, 4.51, {'\leftarrow Ischemic heart', '     disease'}, 'Color', 'k', 'FontSize', 9)
text(0.0012, 2.47, {'\leftarrow Tracheal, bronchus,', '     and lung cancer'}, 'Color', 'k', 'FontSize', 9)
text(0.0018, 1.60, {'\leftarrow COPD'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('Nov. 20 - Dec. 20, 2020')
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

% Find location on plot to place x and y axis labels
width = p4(1) + p4(3) - p1(1);
ax3 = axes('position', [p1(1) p1(2) width p1(4)], 'visible', 'off');
ax3.XLabel.Visible = 'on';
ax3.YLabel.Visible = 'on';

axes(ax3)
xlabel('Case Fatality Rate (%)');
ylabel('Ratio of true:reported COVID-19 cases');

% Fix size of plot
set(gcf, 'Position', [100, 100, 1000, 400])