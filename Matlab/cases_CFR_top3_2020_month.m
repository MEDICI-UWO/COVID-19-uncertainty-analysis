xmin = 0.02;
xmax = 0.1;
x = linspace(xmin, xmax, 1000);
N = 10000;

data = readtable('../Data/top3_extrapolation.csv');

CMAP = jet(4);

%% FIGURE
figure

%% CHINA
ax1 = subplot(1, 4, 1);
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
text(0.028, 6.5e6, {'\leftarrow Stroke'}, 'Color', 'k')
text(0.0425, 3.6e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0455, 2e6, '\leftarrow COPD', 'Color', 'k')
title('China')
hold off;

%% USA
ax2 = subplot(1, 4, 2);
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
text(0.0285, 1.7e6, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.0267, 0.8e6, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.038, 0.42e6, {'\leftarrow Lung', '     cancer'}, 'Color', 'k')
title('USA')
hold off;

%% ITALY
ax3 = subplot(1, 4, 3);
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
title('Italy')
hold off;

%% CANADA
ax4 = subplot(1, 4, 4);
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
text(0.0235, 2.22e5, '5k', 'Color', 'w')
text(0.046, 2.22e5, '10k', 'Color', 'w')
text(0.0275, 1.6e5, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.029, 0.75e5, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.0445, 0.4e5, {"\leftarrow Lung", '     cancer'}, 'Color', 'k')
title('Canada')
hold off;

%% Axes titles
p1 = get(ax1, 'position');
p2 = get(ax2, 'position');
p3 = get(ax3, 'position');
p4 = get(ax4, 'position');
width = p4(1) + p4(3) - p1(1);
ax5 = axes('position', [p1(1) p1(2) width p1(4)], 'visible', 'off');
ax5.XLabel.Visible = 'on';
ax5.YLabel.Visible = 'on';

axes(ax5)
xlabel('Case Fatality Rate');
ylabel('Number of Confirmed Cases');

set(gcf, 'Position', [100, 100, 1000, 525])