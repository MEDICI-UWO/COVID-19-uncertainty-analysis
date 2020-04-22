% ==========================================================================
% AUTHOR: EYSC
% UPDATED: April 20, 2020
% 
% Redistributes the colourmap according to the contour levels, so that each
% level is coloured a specific color
% 
% INPUT
%   cmap: Colormap
%   level: Vector of contour levels
% 
% OUTPUT
%   new_cmap: New colormap
% ==========================================================================
function new_cmap = revise_cmap(cmap, level)
  if (size(cmap, 1) ~= length(level))
    error("Sizes of cmap and level doesn't match");
  end
  L = sort(level);
  C = abs(diff(L));
  M = max(floor(sum(C)./C));
  D = round(C/sum(C)*(M+3));
  new_cmap = [];
  for i = 1:length(C)
    new_cmap = [new_cmap; repmat(cmap(i, :), D(i), 1)];
  end
  new_cmap = [new_cmap; cmap(end, :)];
end