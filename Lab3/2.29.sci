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
a = 0.8; N = 8; M = 5;
n1 = 0:(N-1); h1n = a.^n1;
n2 = 0:(M-1); h2n = ones(1, M);

[hn, horigin] = convolution(h1n, 1, h2n, 1)
disp("hn = ", hn);
disp("horigin = ", horigin);
