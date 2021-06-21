% ==========================================================================
% AUTHOR: EYSC
% LAST MODIFIED: June 17, 2021
% 
% Calculate the matrix to create a contour plot to show the number of
% COVID-19 cases that is required to be the top 3 cause of death in a given
% country, in a given year
% 
% INPUT
%   covid_data: Table, containing cumulative cases for each country on a
%   given date
%   data: Table, extrapolated results of number of deaths cause by top 3
%   cuases of deaths
%   Z: Matrix, result of correcting factor and CFR being multiplied
%   togehter
%   country: String, country name that you want to perform the uncertainty
%   analysis on
%   year: Integer, year in which you want to compare the results to
%   begin_date: Cell, the date in which you want to start the analysis
%   end_date: Cell, the date in which you want to end the analysis
%   n_days: Integer, number of days between begin_date and end_date
% 
% OUTPUT
%   country_Z: Matrix, theoretical number of deaths
%   level: contour levels
% ==========================================================================

function [country_Z, level] = get_beta_contour(covid_data, data, Z, country, year, begin_date, end_date, n_days)
    % Get number of COVID-19 cases
    covid_cases = covid_data.Cumulative_cases(covid_data.Country == country & covid_data.Date_reported == end_date, :) - covid_data.Cumulative_cases(covid_data.Country == country & covid_data.Date_reported == begin_date, :);
    % Multiply the number of cases to our "base" matrix
    country_Z = Z*covid_cases;
    % Filter data to obtain data just for Italy
    country_data = data(data.location == country & data.year == year, :);
    % Adjust the number of deaths so it is over the duration of the same number
    % of days
    top3 = country_data.val/365*n_days;
    level = [min(country_Z(:)); sort(top3)];
end