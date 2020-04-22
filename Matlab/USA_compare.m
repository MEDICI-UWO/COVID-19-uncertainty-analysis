%% Uncertainty analysis based on number of COVID-19 cases, a correction factor, and the case fatality rate for the USA
% Date updated: April 20, 2020

%% Set up
% Set range of x axis (represents case fatality rate)
xmin = 0.02;
xmax = 0.1;
x = linspace(xmin, xmax, 1000);

% Set range of x axis (represents the correction factor)
ymin = 1;
ymax = 8;
y = linspace(ymin, ymax, 10000);

[X, Y] = meshgrid(x, y);

Z = X.*Y;

% Number of confirmed cases as of April 20
USA_cases1 = 723605;
% Number of confirmed cases between Feb 19 to March 20
USA_cases2 = 10427;
% Number of confirmed cases between March 21 and April 20
USA_cases3 = 713163;

% Read in estimated values for top 3 causes of death
data = readtable('../Data/predict_values.csv');
data.Value = str2double(data.val);

% Filter data to obtain values for the USA
USA = data(data.location == "United States", :);

CMAP = jet(4);

%% FIGURE
% figure

%% Date range: January 23 - April 20, 2020
ax1 = subplot(1, 3, 1);
% Number of days that COVID-19 has been in USA (between January 23 - April 20, 2020)
USA_days = 88;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases1;
% Adjust estimated values to match the duration of specified date range
top3 = USA.Value/365*USA_days;
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
contour(X, Y, USA_Z, [5e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.022, 3.3, '50k', 'Color', 'k')
text(0.0215, 6.85, '100k', 'Color', 'k')
text(0.075, 7.6, '500k', 'Color', 'w')
text(0.034, 5.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.034, 2.7, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.042, 1.5, {'\leftarrow Lung', '     cancer'}, 'Color', 'k')
hold off;
title('Jan. 23, 2020 - Apr. 20, 2020')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Date range: February 19 - March 20, 2020
ax2 = subplot(1, 3, 2);
% Number of days that COVID-19 has been in USA (between February 19 - March 20, 2020)
USA_days = 30;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases2;
% Adjust estimated values to match the duration of specified date range
top3 = USA.Value/365*USA_days;
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
contour(X, Y, USA_Z, [500, 1e3, 5e3], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 2.35, '500', 'Color', 'w')
text(0.0205, 4.8, '1k', 'Color', 'w')
text(0.055, 7.6, '5k', 'Color', 'w')
hold off;
title('Feb. 19, 2020 - Mar. 20, 2020')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Date range: March 21 - April 20, 2020
ax3 = subplot(1, 3, 3);
% Number of days that COVID-19 has been in USA (between March 21 - April 20, 2020)
USA_days = 30;
% Multiply the number of cases over the specified date range to our "base" matrix
USA_Z = Z*USA_cases3;
% Adjust estimated values to match the duration of specified date range
top3 = USA.Value/365*USA_days;
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
contour(X, Y, USA_Z, [5e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 3.4, '50k', 'Color', 'w')
text(0.021, 6.9, '100k', 'Color', 'w')
text(0.078, 7.6, '500k', 'Color', 'w')
text(0.024, 2.7, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0215, 1.46, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0213, 1.075, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('March 21, 2020 - April 20, 2020')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%%
p1 = get(ax1, 'position');
p2 = get(ax2, 'position');
p3 = get(ax3, 'position');

% Find location on plot to place x and y axis labels
width = p3(1) + p3(3) - p1(1);
ax3 = axes('position', [p1(1) p1(2) width p1(4)], 'visible', 'off');
ax3.XLabel.Visible = 'on';
ax3.YLabel.Visible = 'on';

axes(ax3)
xlabel('Case Fatality Rate (%)');
ylabel('Ratio of true:reported COVID-19 cases');






