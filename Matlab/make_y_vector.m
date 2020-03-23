function y = make_y_vector(xmin, xmax, level, N)
  ymax = max(level)/xmin;
  ymin = max(level)/xmax;
  temp = (ymax - ymin)/10;
  ymin = ymin - temp;
  y = linspace(ymin, ymax, N);
end