%% Uncertainty analysis based on number of COVID-19 cases, a correction factor, and the case fatality rate
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

% Multiply CFR and correction factor together (we will multiply the number
% of cases to this matrix later)
Z = X.*Y;

% Number of confirmed cases as of December 16, 2020 (source: WHO COVID-19 Dashboard)
Italy_cases = 1855737;
Spain_cases = 1751884;
UK_cases = 1869670;
Russia_cases = 2707945;
China_cases = 95279;
Canada_cases = 468862;
USA_cases = 16245376;
Brazil_cases = 6927145;

% Read in estimated values for top 3 causes of death
data = readtable('../Data/predict_values.csv');

% Set colormap
CMAP = jet(4);

%% FIGURE
figure

%% ITALY (First case: January 31, 2020)
ax1 = subplot(2, 4, 1);
% Number of days that COVID-19 has been in Italy (as of May 26)
Italy_days = 320;
% Multiply the number of cases to our "base" matrix
Italy_Z = Z*Italy_cases;
% Filter data to obtain data just for Italy
Italy = data(data.location == "Italy", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Italy.val/365*Italy_days;
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
contour(X, Y, Italy_Z, [1e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0055, 1.07, '10k', 'Color', 'w')
text(0.008, 7.6, '100k', 'Color', 'w')
text(0.0375, 7.6, '500k', 'Color', 'w')
text(0.0099, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.012, 2.9, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.017, 1.8, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% SPAIN (First case: February 1, 2020)
ax2 = subplot(2, 4, 2);
% Number of days that COVID-19 has been in Spain (as of May 26)
Spain_days = 319;
% Multiply the number of cases to our "base" matrix
Spain_Z = Z*Spain_cases;
% Filter data to obtain data just for Spain
Spain = data(data.location == "Spain", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Spain.val/365*Spain_days;
level = [min(Spain_Z(:)); top3];
% Plot contour
contourf(X, Y, Spain_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap_spain(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Spain_Z, [1e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.006, 1.07, '10k', 'Color', 'w')
text(0.0083, 7.6, '100k', 'Color', 'w')
text(0.0392, 7.6, '500k', 'Color', 'w')
text(0.0057, 5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.008, 3.3, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.008, 2, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% UNITED KINGDOM (First case: February 1, 2020)
ax3 = subplot(2, 4, 3);
% Number of days that COVID-19 has been in the UK (as of May 26)
UK_days = 319;
% Multiply the number of cases to our "base" matrix
UK_Z = Z*UK_cases;
% Filter data to obtain data just for the UK
UK = data(data.location == "United Kingdom", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = UK.val/365*UK_days;
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
contour(X, Y, UK_Z, [1e4, 5e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0055, 1.07, '10k', 'Color', 'w')
text(0.008, 7.6, '100k', 'Color', 'w')
text(0.0373, 7.6, '500k', 'Color', 'w')
text(0.0105, 4.3, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0115, 2.8, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0145, 1.6, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Russia (First case: February 1, 2020)
ax4 = subplot(2, 4, 4);
% Number of days that COVID-19 has been in the Russia (as of May 26)
Russia_days = 319;
% Multiply the number of cases to our "base" matrix
Russia_Z = Z*Russia_cases;
% Filter data to obtain data just for the Russia
Russia = data(data.location == "Russian Federation", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Russia.val/365*Russia_days;
level = [min(Russia_Z(:)); top3];
% Plot contour
contourf(X, Y, Russia_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Russia_Z, [1e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0036, 1.07, '10k', 'Color', 'w')
text(0.037, 1.07, '100k', 'Color', 'k')
text(0.026, 7.6, '500k', 'Color', 'w')
text(0.0297, 5.3, {'Ischemic \rightarrow', 'heart disease'}, 'Color', 'k', 'HorizontalAlignment', 'right')
text(0.0292, 3.5, {'Stroke \rightarrow'}, 'Color', 'k', 'HorizontalAlignment', 'right')
text(0.014, 2.2, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
hold off;
title('Russia')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CHINA (First case: December 31, 2019)
% Note: it doesn't matter if we also took extrapolated from 2019 because
% max(China_Z) wouldn't even be large enough to surpass even the smaller
% value between the two years (2019, 2020)
ax5 = subplot(2, 4, 5);
% Number of days that COVID-19 has been in China (as of May 26)
China_days = 351;
% Multiply the number of cases to our "base" matrix
China_Z = Z*China_cases;
% Filter data to obtain data just for China
China = data(data.location == "China", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = China.val/365*China_days;
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
contour(X, Y, China_Z, [5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.042, 1.07, '5k', 'Color', 'w')
text(0.015, 7.6, '10k', 'Color', 'w')
hold off;
title('China')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CANADA (First case: January 27, 2020)
ax6 = subplot(2, 4, 6);
% Number of days that COVID-19 has been in Canada (as of May 26)
Canada_days = 324;
% Multiply the number of cases to our "base" matrix
Canada_Z = Z*Canada_cases;
% Filter data to obtain data just for Canada
Canada = data(data.location == "Canada", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Canada.val/365*Canada_days;
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
contour(X, Y, Canada_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 1.07, '10k', 'Color', 'w')
text(0.015, 7.6, '50k', 'Color', 'w')
text(0.029, 7.6, '100k', 'Color', 'w')
text(0.017, 5.9, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.01375, 3.7, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0175, 2.4, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('Canada')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% USA (First case: January 23, 2020)
ax7 = subplot(2, 4, 7);
% Number of days that COVID-19 has been in the USA (as of May 26)
USA_days = 328;
% Multiply the number of cases to our "base" matrix
USA_Z = Z*USA_cases;
% Filter data to obtain data just for the USA
USA = data(data.location == "United States", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
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
title('United States')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
xticklabels({0.1, 1, 2, 3, 4, 5});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Brazil (First case: February 27, 2020)
ax8 = subplot(2, 4, 8);
% Number of days that COVID-19 has been in the Brazil (as of May 26)
Brazil_days = 293;
% Multiply the number of cases to our "base" matrix
Brazil_Z = Z*Brazil_cases;
% Filter data to obtain data just for the Brazil
Brazil = data(data.location == "Brazil", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Brazil.val/365*Brazil_days;
level = [min(Brazil_Z(:)); top3];
% Plot contour
contourf(X, Y, Brazil_Z, level, 'LineStyle', 'none');
% Set the y axis to logarithmic scale
set(gca, 'YScale', 'log')
% Adjust the colormap on the contour plots
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
% Add white contour lines as guides for number of death
contour(X, Y, Brazil_Z, [5e4, 5e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.008, 1.07, '50k', 'Color', 'k')
text(0.04, 1.445, '500k', 'Color', 'w')
text(0.02, 7.6, '1M', 'Color', 'w')
text(0.0041, 5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0042, 3.2, {'\leftarrow Stroke'}, 'Color', 'k')
text(0.0052, 2.1, {'     Lower', '\leftarrow respiratory', '     infection'}, 'Color', 'k')
hold off;
title('Brazil')
% Change x-axis values to percentages
xticks([0.001, linspace(0.01, 0.05, 5)]);
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
set(gcf, 'Position', [100, 100, 950, 850])