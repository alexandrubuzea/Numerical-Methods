function plot_vectors(value, color)
  width = 2;

  if isinf(value)
    plot([1, 1], [1, -1], 'LineWidth', width, color); hold on;
    plot([-1, -1], [1, -1], 'LineWidth', width, color); hold on;
    plot([-1, 1], [1, 1], 'LineWidth', width, color); hold on;
    plot([-1, 1], [-1, -1], 'LineWidth', width, color, 'DisplayName', ['p = ', num2str(value)]); hold on;
       
    legend off;
    legend show;
    
    return
  endif
  
  n = 100;
  x = linspace(0, 1, n);
  y = (1 - x .^ value) .^ (1 / value);
  
  plot(x, y, 'LineWidth', width, color); hold on;
  plot(x, -y, 'LineWidth', width, color); hold on;
  plot(x - 1, y(n:-1:1), 'LineWidth', width, color); hold on;
  plot(x - 1, -y(n:-1:1), 'LineWidth', width, color, 'Displayname', ['p = ', num2str(value)]); hold on;
  legend off;
  legend show;
endfunction
