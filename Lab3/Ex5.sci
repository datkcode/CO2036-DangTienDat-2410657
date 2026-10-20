function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    
    y1 = zeros(1, length(ny));
    y2 = zeros(1, length(ny));
    
    y1((n1 - n_min) + 1) = x1n;
    y2((n2 - n_min) + 1) = x2n;
    
    yn = y1 .* y2;
    yorigin = 1 - n_min;
    
    x_left = n_min - 1;
    x_right = n_max + 1;
    y_bot = min([x1n, x2n, yn, 0]) - 1;
    y_top = max([x1n, x2n, yn, 0]) + 1;
    
    scf(); clf();
    
    subplot(3, 1, 1);
    plot2d3(n1, x1n, style=2);
    plot(n1, x1n, 'bo');
    xgrid();
    xtitle("x1(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
    
    subplot(3, 1, 2);
    plot2d3(n2, x2n, style=3);
    plot(n2, x2n, 'go');
    xgrid();
    xtitle("x2(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xgrid();
    xtitle("y(n) = x1(n) . x2(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
endfunction
[yn, yorigin] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp("yn = ", yn);
disp("yorigin = ", yorigin);
