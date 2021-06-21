% =========================================================================
% Contour plot to show based on the number of COVID-19 cases (in 2020),
% what rank COVID-19 is in terms of top (level 3) causes of deaths, adjusted
% according to CFR and correction factor for the United States
% 
% AUTHOR: EYSC
% LAST MODIFIED: June 21, 2021
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

%% United States

[country_Z, level] = get_beta_contour(covid_data, data, Z, "United States of America", 2020, '2020-01-03', '2020-12-31', 365);

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

% Add black contour line to represent the number of reported deaths in the
% United States
contour(X, Y, country_Z, [335789, 335789], 'LineColor', 'k', 'LineWidth', 1);

% Add text annotations
text(0.0055, 1, '100k', 'Color', 'w', 'VerticalAlignment', 'bottom')
text(0.049, 1.25, '1M', 'Color', 'w', 'HorizontalAlignment', 'right')

text(0.0175, 1, '\leftarrow # of reported deaths', 'Color', 'k', 'VerticalAlignment', 'bottom')

text(0.007, 4.2, {'\leftarrow Ischemic heart', '     disease'}, 'Color', 'k', 'FontSize', 9)
text(0.0035, 2.7, {'\leftarrow Tracheal, bronchus,', '     and lung cancer'}, 'Color', 'k', 'FontSize', 9)
text(0.0055, 1.8, {'\leftarrow COPD'}, 'Color', 'k', 'FontSize', 9)
hold off;
title('United States')
% Change x-axis values to percentages
xticks([xmin, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

xlabel('Case Fatality Rate (%)')
ylabel('Ratio of true:reported COVID-19 cases')