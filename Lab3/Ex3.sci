function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    n_min = min(min(nx), min(ny)) - 1;
    n_max = max(max(nx), max(ny)) + 1;
    y_min = min([xn, yn, 0]) - 1;
    y_max = max([xn, yn, 0]) + 1;
    
    scf(); clf();

    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xgrid();
    xtitle("x(n)", "n", "Bien do");
    gca().data_bounds = [n_min, y_min; n_max, y_max];

    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xgrid();
    xtitle("y(n) = x(-n)", "n", "Bien do");
    gca().data_bounds = [n_min, y_min; n_max, y_max];
endfunction
[yn, yorigin] = fold([1, -2, 3, 6], 3);
disp("yn = ", yn);
disp("yorigin = ", yorigin);
