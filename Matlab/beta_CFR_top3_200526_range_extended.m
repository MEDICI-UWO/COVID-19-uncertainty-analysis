%% Uncertainty analysis based on number of COVID-19 cases, a correction factor, and the case fatality rate
% Date updated: June 3, 2020

%% Set up
% Set range of x axis (represents case fatality rate)
xmin = 0.001;
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

% Number of confirmed cases as of May 26 (source: WHO sitrep 127)
Italy_cases = 230158;
Spain_cases = 235400;
UK_cases = 261188;
Russia_cases = 362342;
China_cases = 84543;
Canada_cases = 85103;
USA_cases = 1618757;
Brazil_cases = 363211;

% Read in estimated values for top 3 causes of death
data = readtable('../Data/predict_values.csv');
data.Value = str2double(data.val);

% Set colormap
CMAP = jet(4);

%% FIGURE
figure

%% ITALY (First case: January 31, 2020)
ax1 = subplot(2, 4, 1);
% Number of days that COVID-19 has been in Italy (as of May 26)
Italy_days = 115;
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
text(0.042, 1.06, '10k', 'Color', 'w')
text(0.031, 7.6, '50k', 'Color', 'w')
text(0.06, 7.6, '100k', 'Color', 'w')
text(0.0295, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.036, 2.9, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.049, 1.8, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% SPAIN (First case = February 1, 2020)
ax2 = subplot(2, 4, 2);
% Number of days that COVID-19 has been in Spain (as of May 26)
Spain_days = 114;
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
text(0.04, 1.06, '10k', 'Color', 'k')
text(0.03, 7.6, '50k', 'Color', 'w')
text(0.058, 7.6, '100k', 'Color', 'w')
text(0.014, 5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0115, 3.3, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.02, 2, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% UNITED KINGDOM (First case: February 1, 2020)
ax3 = subplot(2, 4, 3);
% Number of days that COVID-19 has been in the UK (as of May 26)
UK_days = 114;
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
contour(X, Y, UK_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0385, 1.06, '10k', 'Color', 'w')
text(0.027, 7.6, '50k', 'Color', 'w')
text(0.052, 7.6, '100k', 'Color', 'w')
text(0.027, 4.3, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.029, 2.8, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.037, 1.6, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Russia (First case: February 1, 2020)
ax4 = subplot(2, 4, 4);
% Number of days that COVID-19 has been in the Russia (as of May 26)
Russia_days = 114;
% Multiply the number of cases to our "base" matrix
Russia_Z = Z*Russia_cases;
% Filter data to obtain data just for the Russia
Russia = data(data.location == "Russian Federation", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Russia.Value/365*Russia_days;
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
contour(X, Y, Russia_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.027, 1.06, '10k', 'Color', 'w')
text(0.019, 7.6, '50k', 'Color', 'k')
text(0.037, 7.6, '100k', 'Color', 'k')
text(0.0785, 5.3, {'Ischemic heart \rightarrow', 'disease     '}, 'Color', 'k', 'HorizontalAlignment', 'right')
text(0.078, 3.5, {'Stroke \rightarrow'}, 'Color', 'k', 'HorizontalAlignment', 'right')
text(0.0375, 2.2, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
hold off;
title('Russia')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CHINA (First case: December 31, 2019)
% Note: it doesn't matter if we also took extrapolated from 2019 because
% max(China_Z) wouldn't even be large enough to surpass even the smaller
% value between the two years (2019, 2020)
ax5 = subplot(2, 4, 5);
% Number of days that COVID-19 has been in China (as of May 26)
China_days = 147;
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
text(0.059, 1.06, '5k', 'Color', 'w')
text(0.016, 7.6, '10k', 'Color', 'w')
text(0.082, 7.6, '50k', 'Color', 'w')
hold off;
title('China')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% CANADA (First case: January 27, 2020)
ax6 = subplot(2, 4, 6);
% Number of days that COVID-19 has been in Canada (as of May 26)
Canada_days = 119;
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
contour(X, Y, Canada_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0585, 1.06, '5k', 'Color', 'w')
text(0.014, 7.6, '10k', 'Color', 'k')
text(0.081, 7.6, '50k', 'Color', 'w')
text(0.034, 5.9, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0275, 3.7, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.035, 2.4, {"\leftarrow Lung cancer"}, 'Color', 'k')
hold off;
title('Canada')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% USA (First case: January 23, 2020)
ax7 = subplot(2, 4, 7);
% Number of days that COVID-19 has been in the USA (as of May 26)
USA_days = 124;
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
contour(X, Y, USA_Z, [5e4, 1e5, 5e5, 1e6], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.03, 1.06, '50k', 'Color', 'w')
text(0.008, 7.6, '100k', 'Color', 'k')
text(0.043, 7.6, '500k', 'Color', 'w')
text(0.085, 7.6, '1M', 'Color', 'w')
text(0.0265, 4.5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.023, 2.45, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0315, 1.35, {'\leftarrow Lung cancer'}, 'Color', 'k')
hold off;
title('United States')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
% Fix the appearance of the y-axis values
yticks(linspace(ymin, ymax, 8));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8});

%% Brazil (First case: February 27, 2020)
ax8 = subplot(2, 4, 8);
% Number of days that COVID-19 has been in the Brazil (as of May 26)
Brazil_days = 88;
% Multiply the number of cases to our "base" matrix
Brazil_Z = Z*Brazil_cases;
% Filter data to obtain data just for the Brazil
Brazil = data(data.location == "Brazil", :);
% Adjust the number of deaths so it is over the duration of the same number
% of days
top3 = Brazil.Value/365*Brazil_days;
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
contour(X, Y, Brazil_Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.027, 1.06, '10k', 'Color', 'w')
text(0.019, 7.6, '50k', 'Color', 'w')
text(0.037, 7.6, '100k', 'Color', 'w')
text(0.023, 5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0265, 3.2, {'\leftarrow Stroke'}, 'Color', 'k')
text(0.0315, 2.1, {'     Lower', '\leftarrow respiratory', '     infection'}, 'Color', 'k')
hold off;
title('Brazil')
% Change x-axis values to percentages
xticks([0.001, linspace(0.02, 0.1, 5)]);
xticklabels({0.1, 2, 4, 6, 8, 10});
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