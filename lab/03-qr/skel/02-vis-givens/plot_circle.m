function plot_circle(radius, angle1, angle2)
  t = linspace(angle1, angle2, 1000);
  
  if angle1 > angle2
    plot_circle(radius, angle1, 2*pi);
    plot_circle(radius, 0, angle2);
    return
  endif

  x = radius * cos(t);
  y = radius * sin(t);
 
  plot(x, y, 'LineStyle', '--', 'LineWidth', 2, '-k'); hold on;
  %plot(x, y, 'LineStyle', '--', 'LineWidth', 2, '-k'); hold on;
  %plot(x - radius, y(1000:-1:1), 'LineStyle', '--', 'LineWidth', 2, '-k'); hold on;
  %plot(x, -y, 'LineStyle', '--', 'LineWidth', 2, '-k'); hold on;
  %plot(x - radius, -y(1000:-1:1), 'LineStyle', '--', 'LineWidth', 2, '-k'); hold on;

endfunction
