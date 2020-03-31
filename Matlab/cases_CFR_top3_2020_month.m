xmin = 0.02;
xmax = 0.1;
x = linspace(xmin, xmax, 1000);
N = 10000;

data = readtable('../Data/top3_extrapolation.csv');

CMAP = jet(4);

%% FIGURE
figure

%% ITALY
ax1 = subplot(2, 3, 1);
Italy = data(data.Country == "Italy", :);
top3 = Italy(Italy.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
text(0.022, 2.48e5, '5k', 'Color', 'k')
text(0.0245, 4.125e5, '10k', 'Color', 'w')
text(0.0275, 3e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0365, 1.7e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.054, 1e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% SPAIN
ax2 = subplot(2, 3, 2);
Spain = data(data.Country == "Spain", :);
top3 = Spain(Spain.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
text(0.0205, 0.5e5, '1k', 'Color', 'w')
text(0.024, 2.22e5, '5k', 'Color', 'w')
text(0.046, 2.22e5, '10k', 'Color', 'w')
text(0.0275, 1.6e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.04, 1e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.046, 0.6e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% UNITED KINGDOM
ax3 = subplot(2, 3, 3);
UK = data(data.Country == "United Kingdom", :);
top3 = UK(UK.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
text(0.022, 2.48e5, '5k', 'Color', 'k')
text(0.0245, 4.05e5, '10k', 'Color', 'w')
text(0.0275, 2.9e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0355, 1.6e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.042, 1e5, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('United Kingdom')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% CHINA
ax4 = subplot(2, 3, 4);
China = data(data.Country == "China", :);
top3 = China(China.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [5e4, 1e5, 5e5], 'LineColor', 'w', 'LineWidth', 1);
text(0.0215, 2.45e6, '50k', 'Color', 'w')
text(0.021, 4.9e6, '100k', 'Color', 'k')
text(0.042, 8.75e6, '500k', 'Color', 'w')
text(0.0275, 6.7e6, {'\leftarrow Stroke'}, 'Color', 'k')
text(0.0425, 3.6e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0455, 2e6, '\leftarrow COPD', 'Color', 'k')
hold off;
title('China')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% USA
ax5 = subplot(2, 3, 5);
USA = data(data.Country == "United States", :);
top3 = USA(USA.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [1e4, 5e4, 1e5], 'LineColor', 'w', 'LineWidth', 1);
text(0.0205, 0.5e6, '10k', 'Color', 'w');
text(0.022, 2.38e6, '50k', 'Color', 'w');
text(0.043, 2.38e6, '100k', 'Color', 'w');
text(0.0285, 1.72e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0267, 0.8e6, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.038, 0.42e6, {'\leftarrow Lung', '     cancer'}, 'Color', 'k')
hold off;
title('United States')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% CANADA
ax6 = subplot(2, 3, 6);
Canada = data(data.Country == "Canada", :);
top3 = Canada(Canada.Year == 2020, :).Val/12;
y = make_y_vector(xmin, xmax, top3, N);
[X, Y] = meshgrid(x, y);
Z = X.*Y;
level = [min(Z(:)); top3];
contourf(X, Y, Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
text(0.0205, 0.5e5, '1k', 'Color', 'w')
text(0.0235, 2.225e5, '5k', 'Color', 'w')
text(0.046, 2.225e5, '10k', 'Color', 'w')
text(0.0275, 1.6e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.029, 0.75e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0445, 0.4e5, {"\leftarrow Lung", '     cancer'}, 'Color', 'k')
hold off;
title('Canada')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});

%% Axes titles

% set(gcf, 'Position', [100, 100, 750, 850])

p1 = get(ax1, 'position');
p2 = get(ax2, 'position');
p3 = get(ax3, 'position');
p4 = get(ax4, 'position');
p5 = get(ax5, 'position');
p6 = get(ax6, 'position');

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

width = p3(1) + p3(3) - p1(1);
height = p1(2) + p1(4) - p4(2);
ax7 = axes('position', [p4(1) p4(2) width height], 'visible', 'off');
ax7.XLabel.Visible = 'on';
ax7.YLabel.Visible = 'on';

axes(ax7)
xlabel('Case Fatality Rate (%)');
ylabel('Number of Confirmed Cases');

set(gcf, 'Position', [100, 100, 750, 850])