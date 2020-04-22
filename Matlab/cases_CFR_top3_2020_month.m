%% Uncertainty analysis based on number of COVID-19 cases and the case fatality rate
% Date updated: April 20, 2020

%% Set up
% Set range of x axis (represents case fatality rate)
xmin = 0.02;
xmax = 0.1;
x = linspace(xmin, xmax, 1000);

% Set length of y axis
N = 10000;

% Read data as table
data = readtable('../Data/predict_values.csv');
data.Value = str2double(data.val)/12;

% Set color map
CMAP = jet(4);

%% FIGURE
figure

%% ITALY
ax1 = subplot(2, 3, 1);
% Filter data to obtain data just for Italy
Italy = data(data.location == "Italy", :);
top3 = Italy.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.022, 2.48e5, '5k', 'Color', 'k')
text(0.0245, 4.125e5, '10k', 'Color', 'w')
text(0.0272, 3e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0375, 1.7e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.054, 1e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% SPAIN
ax2 = subplot(2, 3, 2);
% Filter data to obtain data just for Spain
Spain = data(data.location == "Spain", :);
top3 = Spain.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0205, 0.5e5, '1k', 'Color', 'w')
text(0.024, 2.22e5, '5k', 'Color', 'w')
text(0.046, 2.22e5, '10k', 'Color', 'w')
text(0.0275, 1.6e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0437, 1e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0455, 0.6e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% UNITED KINGDOM
ax3 = subplot(2, 3, 3);
% Filter data to obtain data just for United Kingdom
UK = data(data.location == "United Kingdom", :);
top3 = UK.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.022, 2.48e5, '5k', 'Color', 'k')
text(0.0245, 4.05e5, '10k', 'Color', 'w')
text(0.0275, 2.9e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.036, 1.6e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0415, 1e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('United Kingdom')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% CHINA
ax4 = subplot(2, 3, 4);
% Filter data to obtain data just for China
China = data(data.location == "China", :);
top3 = China.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [5e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0215, 2.45e6, '50k', 'Color', 'w')
text(0.021, 4.9e6, '100k', 'Color', 'k')
text(0.042, 8.75e6, '500k', 'Color', 'w')
text(0.0286, 6.7e6, {'\leftarrow Stroke'}, 'Color', 'k')
text(0.042, 3.6e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0455, 2e6, '\leftarrow COPD', 'Color', 'k')
hold off;
title('China')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% USA
ax5 = subplot(2, 3, 5);
% Filter data to obtain data just for United States
USA = data(data.location == "United States", :);
top3 = USA.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0205, 0.5e6, '10k', 'Color', 'w');
text(0.022, 2.38e6, '50k', 'Color', 'w');
text(0.043, 2.38e6, '100k', 'Color', 'w');
text(0.0275, 1.72e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0284, 0.8e6, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0374, 0.42e6, {'\leftarrow Lung', '     cancer'}, 'Color', 'k')
hold off;
title('United States')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% CANADA
ax6 = subplot(2, 3, 6);
% Filter data to obtain data just for Canada
Canada = data(data.location == "Canada", :);
top3 = Canada.Value;
% Make vector for y axis
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
% Calculate the theoretical number of deaths over a matrix
% (using formula # of cases * CFR) 
Z = X.*Y;
level = [min(Z(:)); top3];
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
contour(X, Y, Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% Add text annotations
text(0.0205, 0.5e5, '1k', 'Color', 'w')
text(0.0235, 2.225e5, '5k', 'Color', 'w')
text(0.046, 2.225e5, '10k', 'Color', 'w')
text(0.027, 1.6e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0295, 0.75e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0435, 0.4e5, {"\leftarrow Lung", '     cancer'}, 'Color', 'k')
hold off;
title('Canada')
% Change x-axis values to percentages
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

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
ylabel('Number of Cases');

% Fix size of plot
set(gcf, 'Position', [100, 100, 750, 850])