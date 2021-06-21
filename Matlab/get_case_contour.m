% ==========================================================================
% AUTHOR: EYSC
% LAST MODIFIED: June 17, 2021
% 
% Calculate the matrices to create a contour plot to show the number of
% COVID-19 cases that is required to be the top 3 cause of death in a given
% country, in a given year
% 
% INPUT
%   x: Vector, with the range of CFR we are interested in
%   data: Table, data containing the number of deaths for each cause of
%   death
%   country: String, country of interest
%   year: Integer, year of interest (can only be 2020 or 2021)
%   Nx: Integer, length of the x-axis of the contour plot
%   Ny: Integer, length of the y-axis of the contour plot
% 
% OUTPUT
%   X: Matrix, where each row is a copy of the x-values
%   Y: Matrix, where each column is a copy of the y-values
%   Z: Matrix, theoretical number of deaths
%   level: contour levels
% ==========================================================================
function [X, Y, Z, level] = get_case_contour(x, data, country, year, Ny)
    country_data = data(data.location == country & data.year == year, :);
    top3 = country_data.val;
    % Make vector for y axis
    y = make_y_vector(min(x), max(x), top3, Ny);
    [X, Y] = meshgrid(x, y);
    % Calculate the theoretical number of deaths over a matrix
    % (using formula # of cases * CFR)
    Z = X.*Y;
    level = [min(Z(:)); sort(top3)];
end