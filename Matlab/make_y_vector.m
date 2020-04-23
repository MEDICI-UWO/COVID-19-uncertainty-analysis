% ==========================================================================
% AUTHOR: EYSC
% UPDATED: April 20, 2020
% 
% Determines the range of the y axis of the contour plots and outputs a
% vector of length N with equally-spaced points between the determined
% range
% 
% INPUT
%   xmin: Minimum value of your x range
%   xmax: Maximum value of your x range
%   level: Vector of contour levels
%   N: Length of output vector
% 
% OUTPUT
%   y: Vector of length N with equally-spaced points between a determined
%   range
% ==========================================================================
function y = make_y_vector(xmin, xmax, level, N)
  ymax = max(level)/xmin;
  ymin = min(level)/xmax;
  y = linspace(ymin, ymax, N);
end