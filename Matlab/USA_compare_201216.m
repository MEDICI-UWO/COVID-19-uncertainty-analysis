%% Uncertainty analysis based on number of COVID-19 cases, a correction factor, and the case fatality rate for the USA
% Date updated: December 16, 2020

%% Set up
% Set range of x axis (represents case fatality rate)
xmin = 0.001;
xmax = 0.05;
x = linspace(xmin, xmax, 1000);

% Set range of x axis (represents the correction factor)
ymin = 1;
ymax = 8;
y = linspace(ymin, ymax, 10000);

[X, Y] = meshgrid(x, y);

Z = X.*Y;

% Number of confirmed cases as of December 16
USA_cases1 = 16245376;
% Number of confirmed cases between Feb 19 to March 20
USA_cases2 = 10427;
% Number of confirmed cases between March 21 and May 20
USA_cases3 = 1465269;
% Number of confirmed cases between October 16 and December 15
USA_cases4 = 8266350;

% Read in estimated values for top 3 causes of death
data = readtable('../Data/predict_values.csv');

% Filter data to obtain values for the USA
USA = data(data.location == "United States", :);

CMAP = jet(4);

%% FIGURE
figure

%% Date range: January 23 - December 16, 2020
ax1 = subplot(1, 4, 1);
% Number of days that COVID-19 has been in USA (between January 23 - April 20, 2020)
USA_days = 328;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases1;
% Adjust estimated values to match the duration of specified date range
top3 = USA.val/365*USA_days;
level = [min(USA_Z(:)); top3];
% Plot contour
contourf(X, Y, USA_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, USA_Z, [1e5, 1e6, 5e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.00572, 1.07, '100k', 'Color', 'k')
text(0.0085, 7.6, '1M', 'Color', 'w')
text(0.0425, 7.6, '5M', 'Color', 'w')
text(0.0074, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0063, 2.45, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0083, 1.35, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('Jan. 23, 2020 - Dec. 16, 2020')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Date range: February 19 - March 20, 2020
ax2 = subplot(1, 4, 2);
% Number of days that COVID-19 has been in USA (between February 19 - March 20, 2020)
USA_days = 30;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases2;
% Adjust estimated values to match the duration of specified date range
top3 = USA.val/365*USA_days;
level = [min(USA_Z(:)); top3];
% Plot contour
contourf(X, Y, USA_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, USA_Z, [500, 1e3], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0375, 1.07, '500', 'Color', 'w')
text(0.014, 7.6, '1k', 'Color', 'w')
hold off;
title('Feb. 19, 2020 - Mar. 20, 2020')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Date range: March 21 - May 20
ax3 = subplot(1, 4, 3);
% Number of days that COVID-19 has been in USA (between March 21 - April 20, 2020)
USA_days = 60;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases3;
% Adjust estimated values to match the duration of specified date range
top3 = USA.val/365*USA_days;
level = [min(USA_Z(:)); top3];
% Plot contour
contourf(X, Y, USA_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, USA_Z, [1e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.007, 1.07, '10k', 'Color', 'w')
text(0.0095, 7.6, '100k', 'Color', 'w')
text(0.0365, 7.6, '500k', 'Color', 'w')
text(0.0145, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.013, 2.45, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.017, 1.35, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('March 21, 2020 - May 20, 2020')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Date range: October 16 - December 15
ax4 = subplot(1, 4, 4);
% Number of days that COVID-19 has been in USA (between March 21 - April 20, 2020)
USA_days = 60;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases4;
% Adjust estimated values to match the duration of specified date range
top3 = USA.val/365*USA_days;
level = [min(USA_Z(:)); top3];
% Plot contour
contourf(X, Y, USA_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap_spain(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, USA_Z, [1e5, 5e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.012, 1.07, '100k', 'Color', 'w')
text(0.0415, 1.17, '500k', 'Color', 'w')
text(0.0165, 7.6, '1M', 'Color', 'w')
text(0.003, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.002, 2.45, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.003, 1.35, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('Oct. 16, 2020 - Dec. 15, 2020')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%%
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