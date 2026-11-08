clear; clc; close(winsid());

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);
M = length(h);

// 1. Phuong phap Folding and Shifting (Circular)
y_circ_fold = zeros(1, N);
for n = 0:(N - 1)
    acc = 0;
    for k = 0:(M - 1)
        idx = pmodulo(n - k, N) + 1; // Chi so mang trong Scilab bat dau tu 1
        acc = acc + h(k + 1) * x(idx);
    end
    y_circ_fold(n + 1) = acc;
end
disp("y(n) - Circular Folding and Shifting (Ex 7):", y_circ_fold);

// 2. Phuong phap Matrix (Circulant Matrix)
C = zeros(N, M);
for row = 0:(N - 1)
    for col = 0:(M - 1)
        C(row + 1, col + 1) = x(pmodulo(row - col, N) + 1);
    end
end
y_circ_mat = (C * h(:))';
disp("y(n) - Circular Matrix Method (Ex 7):", y_circ_mat);

// 3. Tinh nang luong va ve do thi x(n), y(n), E_x(n), E_y(n)
n_idx = 0:(N - 1);
Ex = x .^ 2;
Ey = y_circ_fold .^ 2;

scf(7);
subplot(2, 2, 1);
plot2d3(n_idx, x, style=2); plot(n_idx, x, 'bo');
title("Periodic Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(2, 2, 2);
plot2d3(n_idx, y_circ_fold, style=5); plot(n_idx, y_circ_fold, 'ro');
title("Circular Convolution y(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(2, 2, 3);
plot2d3(n_idx, Ex, style=3); plot(n_idx, Ex, 'go');
title("Energy of x(n): E_x(n) = |x(n)|^2 (Total = " + string(sum(Ex)) + ")");
xlabel("n"); ylabel("Energy"); xgrid();

subplot(2, 2, 4);
plot2d3(n_idx, Ey, style=6); plot(n_idx, Ey, 'mo');
title("Energy of y(n): E_y(n) = |y(n)|^2 (Total = " + string(sum(Ey)) + ")");
xlabel("n"); ylabel("Energy"); xgrid();
