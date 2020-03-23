function new_cmap = revise_cmap(cmap, level)
  if (size(cmap, 1) ~= length(level))
    error("Sizes of cmap and level doesn't match");
  end
%   temp_cmap = flipud(cmap);
  L = sort(level);
  C = abs(diff(L));
  M = max(floor(sum(C)./C));
  D = round(C/sum(C)*(M+1));
  new_cmap = [];
  for i = 1:length(C)
    new_cmap = [new_cmap; repmat(cmap(i, :), D(i), 1)];
  end
  new_cmap = [new_cmap; cmap(end, :)];
end