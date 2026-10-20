clc; clear;
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    yorigin = xorigin + horigin - 1;
    
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    x_left = min([nx, nh, ny]) - 1;
    x_right = max([nx, nh, ny]) + 1;
    y_bot = min([xn, hn, yn, 0]) - 1;
    y_top = max([xn, hn, yn, 0]) + 1;
    
    scf(); clf();
    
    subplot(3, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xgrid();
    xtitle("x(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
    
    subplot(3, 1, 2);
    plot2d3(nh, hn, style=3);
    plot(nh, hn, 'go');
    xgrid();
    xtitle("h(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xgrid();
    xtitle("y(n) = x(n) * h(n)", "n", "Bien do");
    gca().data_bounds = [x_left, y_bot; x_right, y_top];
endfunction
xn = ones(1, 7);    
xorigin = 3;    

hn = 2 * ones(1, 4); 
horigin = 2;         

[yn, yorigin] = convolution(xn, xorigin, hn, horigin)
disp("yn = ", yn);
disp("yorigin = ", yorigin);
