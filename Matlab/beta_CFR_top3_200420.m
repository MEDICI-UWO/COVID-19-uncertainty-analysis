%% Uncertainty analysis based on number of COVID-19 cases, a correction factor, and the case fatality rate
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

% Multiply CFR and correction factor together (we will multiply the number
% of cases to this matrix later)
Z = X.*Y;

% Number of confirmed cases as of April 20 (source: WHO sitrep 91)
Italy_cases = 178972;
Spain_cases = 195944;
UK_cases = 120071;
China_cases = 84237;
USA_cases = 723605;
Canada_cases = 33909;

% Read in estimated values for top 3 causes of death
data = readtable('../Data/predict_values.csv');
data.Value = str2double(data.val);

% Set colormap
CMAP = jet(4);

%% FIGURE
figure

%% ITALY (First case: January 31, 2020)
ax1 = subplot(2, 3, 1);
% Number of days that COVID-19 has been in Italy (as of April 20)
Italy_days = 80;
% Multiply the number of cases to our "base" matrix
Italy_Z = Z*Italy_cases;
% Filter data to obtain data just for Italy
Italy = data(data.location == "Italy", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Italy.Value/365*Italy_days;
level = [min(Italy_Z(:)); top3];
% Plot contour
contourf(X, Y, Italy_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Italy_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.021, 2.75, '10k', 'Color', 'w')
text(0.039, 7.6, '50k', 'Color', 'w')
text(0.0765, 7.6, '100k', 'Color', 'w')
text(0.0265, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.031, 3, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.044, 1.8, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% SPAIN (First case = February 1, 2020)
ax2 = subplot(2, 3, 2);
% Number of days that COVID-19 has been in Spain (as of April 20)
Spain_days = 79;
% Multiply the number of cases to our "base" matrix
Spain_Z = Z*Spain_cases;
% Filter data to obtain data just for Spain
Spain = data(data.location == "Spain", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Spain.Value/365*Spain_days;
level = [min(Spain_Z(:)); top3];
% Plot contour
contourf(X, Y, Spain_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Spain_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0205, 2.5, '10k', 'Color', 'k')
text(0.0355, 7.6, '50k', 'Color', 'w')
text(0.0695, 7.6, '100k', 'Color', 'w')
text(0.0285, 2.1, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0375, 1.55, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.03, 1.2, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% UNITED KINGDOM (First case: February 1, 2020)
ax3 = subplot(2, 3, 3);
% Number of days that COVID-19 has been in the UK (as of April 20)
UK_days = 79;
% Multiply the number of cases to our "base" matrix
UK_Z = Z*UK_cases;
% Filter data to obtain data just for the UK
UK = data(data.location == "United Kingdom", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = UK.Value/365*UK_days;
level = [min(UK_Z(:)); top3];
% Plot contour
contourf(X, Y, UK_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, UK_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 2.05, '5k', 'Color', 'w')
text(0.021, 4.1, '10k', 'Color', 'k')
text(0.0575, 7.6, '50k', 'Color', 'w')
text(0.033, 5.3, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0355, 3.5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0375, 2.4, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CHINA (First case: December 31, 2019)
% Note: it doesn't matter if we also took extrapolated from 2019 because
% max(China_Z) wouldn't even be large enough to surpass even the smaller
% value between the two years (2019, 2020)
ax4 = subplot(2, 3, 4);
% Number of days that COVID-19 has been in China (as of April 20)
China_days = 111;
% Multiply the number of cases to our "base" matrix
China_Z = Z*China_cases;
% Filter data to obtain data just for China
China = data(data.location == "China", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = China.Value/365*China_days;
level = [min(China_Z(:)); top3];
% Plot contour
contourf(X, Y, China_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, China_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 2.9, '5k', 'Color', 'w')
text(0.0205, 5.9, '10k', 'Color', 'w')
text(0.082, 7.6, '50k', 'Color', 'w')
hold off;
title('China')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% USA (First case: January 23, 2020)
ax5 = subplot(2, 3, 5);
% Number of days that COVID-19 has been in the USA (as of April 20)
USA_days = 88;
% Multiply the number of cases to our "base" matrix
USA_Z = Z*USA_cases;
% Filter data to obtain data just for the USA
USA = data(data.location == "United States", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
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
title('United States')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CANADA (First case: January 27, 2020)
ax6 = subplot(2, 3, 6);
% Number of days that COVID-19 has been in Canada (as of April 20)
Canada_days = 84;
% Multiply the number of cases to our "base" matrix
Canada_Z = Z*Canada_cases;
% Filter data to obtain data just for Canada
Canada = data(data.location == "Canada", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Canada.Value/365*Canada_days;
level = [min(Canada_Z(:)); top3];
% Plot contour
contourf(X, Y, Canada_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Canada_Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.021, 1.475, '1k', 'Color', 'w')
text(0.0215, 7.2, '5k', 'Color', 'k')
text(0.0275, 7.6, '10k', 'Color', 'k')
text(0.0505, 7.1, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0365, 5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0465, 3, {"\leftarrow Lung", '     cancer'}, 'Color', 'k')
hold off;
title('Canada')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
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

% Reduce vertical space between the two rows
y_translate = (p1(2) - (p4(2) + p4(4)))/4;

p1(2) = p1(2) - y_translate;
p2(2) = p2(2) - y_translate;
p3(2) = p3(2) - y_translate;

p1(4) = p1(4) + y_translate;
p2(4) = p2(4) + y_translate;
p3(4) = p3(4) + y_translate;
p4(4) = p4(4) + y_translate;
p5(4) = p5(4) + y_translate;
p6(4) = p6(4) + y_translate;

set(ax1, 'position', p1);
set(ax2, 'position', p2);
set(ax3, 'position', p3);
set(ax4, 'position', p4);
set(ax5, 'position', p5);
set(ax6, 'position', p6);

% Find location on plot to place x and y axis labels
width = p3(1) + p3(3) - p1(1);
height = p1(2) + p1(4) - p4(2);
ax7 = axes('position', [p4(1) p4(2) width height], 'visible', 'off');
ax7.XLabel.Visible = 'on';
ax7.YLabel.Visible = 'on';

axes(ax7)
xlabel('Case Fatality Rate (%)');
ylabel('Ratio of true:reported COVID-19 cases');

% Fix size of plot
set(gcf, 'Position', [100, 100, 750, 850])