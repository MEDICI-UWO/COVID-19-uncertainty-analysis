xmin = 0.02;
xmax = 0.1;
x = linspace(xmin, xmax, 1000);

ymin = 1;
ymax = 10;
y = linspace(ymin, ymax, 10000);

[X, Y] = meshgrid(x, y);

Z = X.*Y;

% Number of confirmed cases on March 28
Italy_cases = 86498;
Spain_cases = 64059;
UK_cases = 14543;
China_cases = 81439;
USA_cases = 103321;
Canada_cases = 4757;

% % Number of deaths on March 28
% Italy_deaths = 9136;
% Spain_deaths = 4858;
% UK_deaths = 759;
% China_deaths = 3300;
% USA_deaths = 1668;
% Canada_deaths = 55;

data = readtable('../Data/top3_extrapolation.csv');

CMAP = jet(4);

%% FIGURE
figure

%% ITALY (First case: January 31, 2020)
ax1 = subplot(2, 3, 1);
Italy_days = 57;
Italy_Z = Z*Italy_cases;
Italy = data(data.Country == "Italy", :);
top3 = Italy(Italy.Year == 2020, :).Val/365*Italy_days;
level = [min(Italy_Z(:)); top3];
contourf(X, Y, Italy_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Italy_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, Italy_Z, [Italy_deaths, Italy_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.021, 2.9, '5k', 'Color', 'w')
text(0.021, 5.75, '10k', 'Color', 'k')
text(0.048, 9.6, '50k', 'Color', 'w')
text(0.025, 7, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.033, 4, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.051, 2.3, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Italy')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

%% SPAIN (First case = January 31, 2020)
ax2 = subplot(2, 3, 2);
Spain_days = 57;
Spain_Z = Z*Spain_cases;
Spain = data(data.Country == "Spain", :);
top3 = Spain(Spain.Year == 2020, :).Val/365*Spain_days;
level = [min(Spain_Z(:)); top3];
contourf(X, Y, Spain_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Spain_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, Spain_Z, [Spain_deaths, Spain_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.0215, 3.85, '5k', 'Color', 'k')
text(0.0205, 7.8, '10k', 'Color', 'w')
text(0.069, 9.6, '50k', 'Color', 'w')
text(0.0225, 5.7, {'\leftarrow Ischemic', '     heart disease'}, 'Color', 'k')
text(0.038, 3.4, {"\leftarrow Alzheimer's", '     disease'}, 'Color', 'k')
text(0.04, 2, {'\leftarrow Stroke'}, 'Color', 'k')
hold off;
title('Spain')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

%% UNITED KINGDOM (First case: January 31, 2020)
ax3 = subplot(2, 3, 3);
UK_days = 57;
UK_Z = Z*UK_cases;
UK = data(data.Country == "United Kingdom", :);
top3 = UK(UK.Year == 2020, :).Val/365*UK_days;
level = [min(UK_Z(:)); top3];
contourf(X, Y, UK_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, UK_Z, [1e3, 5e3, 1e4], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, UK_Z, [UK_deaths, UK_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.0205, 3.4, '1k', 'Color', 'w')
text(0.038, 9.6, '5k', 'Color', 'w')
text(0.06, 9.6, '10k', 'Color', 'k')
text(0.091, 7.8, {"Alzheimer's \rightarrow", 'disease           '}, 'Color', [0.5, 0.5, 0.5], 'HorizontalAlignment', 'right')
text(0.09, 6, {'Stroke \rightarrow'}, 'Color', 'w', 'HorizontalAlignment', 'right')
hold off;
title('United Kingdom')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

%% CHINA (First case: December 1, 2019)
% Note: it doesn't matter if we also took extrapolated from 2019 because
% max(China_Z) wouldn't even be large enough to surpass even the smaller
% value between the two years (2019, 2020)
ax4 = subplot(2, 3, 4);
China_days = 118;
China_Z = Z*China_cases;
China = data(data.Country == "China", :);
top3 = China(China.Year == 2020, :).Val/365*China_days;
level = [min(China_Z(:)); top3];
contourf(X, Y, China_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, China_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, China_Z, [China_deaths, China_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.0215, 3, '5k', 'Color', 'w')
text(0.0205, 6.1, '10k', 'Color', 'w')
text(0.052, 9.6, '50k', 'Color', 'w')
hold off;
title('China')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

%% USA (First case: January 15, 2020)
ax5 = subplot(2, 3, 5);
USA_days = 73;
USA_Z = Z*USA_cases;
USA = data(data.Country == "United States", :);
top3 = USA(USA.Year == 2020, :).Val/365*USA_days;
level = [min(USA_Z(:)); top3];
contourf(X, Y, USA_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, USA_Z, [5e3, 1e4, 5e4], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, USA_Z, [USA_deaths, USA_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.0215, 2.4, '5k', 'Color', 'w')
text(0.0205, 4.9, '10k', 'Color', 'w')
text(0.0535, 9.6, '50k', 'Color', 'k')
text(0.0665, 7.6, {"Alzheimer's \rightarrow", 'disease           '}, 'Color', [0.5, 0.5, 0.5], 'HorizontalAlignment', 'right')
text(0.0675, 5.5, {"Lung \rightarrow", 'cancer  '}, 'Color', 'w', 'HorizontalAlignment', 'right')
hold off;
title('United States')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

%% CANADA (First case: January 25, 2020)
ax6 = subplot(2, 3, 6);
Canada_days = 63;
Canada_Z = Z*Canada_cases;
Canada = data(data.Country == "Canada", :);
top3 = Canada(Canada.Year == 2020, :).Val/365*Canada_days;
level = [min(Canada_Z(:)); top3];
contourf(X, Y, Canada_Z, level, 'LineStyle', 'none');
set(gca, 'YScale', 'log')
caxis([min(level), max(level)]);
cmap = revise_cmap(CMAP(1:length(level), :), level);
colormap(gca, cmap)
hold on;
contour(X, Y, Canada_Z, [5e2, 1e3], 'LineColor', 'w', 'LineWidth', 1);
% contour(X, Y, Canada_Z, [Canada_deaths, Canada_deaths], 'LineColor', 'm', 'LineWidth', 1);
text(0.0215, 5.2, '500', 'Color', 'w')
text(0.022, 9.6, '1k', 'Color', 'w')
text(0.09, 8.5, {"Lung \rightarrow", 'cancer  '}, 'Color', 'w', 'HorizontalAlignment', 'right')
hold off;
title('Canada')
xticks(linspace(xmin, xmax, 5));
xticklabels({2, 4, 6, 8, 10});
yticks(linspace(ymin, ymax, 10));
yticklabels({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});

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
ylabel('Ratio of true:reported COVID-19 cases');

set(gcf, 'Position', [100, 100, 750, 850])