function bezier(xs, ys, t, dt)
  num = round(t / dt);

  n = length(xs);

  colors = ['-r'; '-b'; '-k'; '-m'; '-g'];

  timestamps = linspace(0, 1, num + 1);

  figure(1);
  
  % axis([0.9 * min(xs) - max(xs), 1.1 * max(xs) - 0.1 * min(xs), 0.9 * min(ys) - max(ys), 1.1 * max(ys) - 0.1 * min(ys)]);
  
  title("Bezier curves");
  history = [];

  for t=timestamps
    clf();
    z = xs + j * ys;
    for i = n:-1:2
      x = Re(z);
      y = Im(z);

      color = colors(mod(n - i + 1, length(colors)) + 1, :);

      plot(x, y, 'LineWidth', 2.5, color); hold on;
      plot(x, y, 'MarkerSize', 20, [color(2), '.']); hold on;

      z = (1 - t) * z(1:i-1) + t * z(2:i);
    endfor
    history = [history, z];
    
    x = Re(history);
    y = Im(history);
 
    plot(x, y, 'LineWidth', 4, '-r'); hold on;
    pause(dt);
  endfor
endfunction
