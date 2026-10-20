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
N_max = 15;
n_pos = 0:N_max;

// (b) h(n)
h1 = [0.5, 0.25, 0.5];
h2 = n_pos + 1;                      // (n + 1)u(n)
h3_conv_h4 = [0, 0, h2(1:$-2)];      // h3(n) * delta(n - 2) = h2(n - 2)
h234 = h2 - h3_conv_h4;              // h2(n) - h3(n)*h4(n)

h_full = conv(h1, h234);
hn = h_full(1:(N_max + 1));       
disp("Bai 2.35(b) - Dap ung xung h(n) voi 0 <= n <= 10:", hn(1:11));

xn = [1, 0, 0, 3, 0, -4];
xorigin = 3;
[yn_full, yorigin] = convolution(xn, xorigin, hn, 1);
ny = (1:13) - yorigin;
yn = yn_full(1:13);
disp("Bai 2.35(c) - Truc thoi gian ny:", ny);
disp("Bai 2.35(c) - Ngo ra y(n):", yn);
