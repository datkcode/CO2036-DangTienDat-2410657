clear; clc; close(winsid());

x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

// 1. Phuong phap Folding and Shifting
y_fold = zeros(1, Ny);
x_pad = [zeros(1, Nh-1), x, zeros(1, Nh-1)];
h_flipped = h($:-1:1); // Lat tin hieu h(k) -> h(-k)

for n = 1:Ny
    x_segment = x_pad(n : n + Nh - 1);
    y_fold(n) = sum(x_segment .* h_flipped);
end
disp("y(n) - Folding and Shifting (Ex 6):", y_fold);

// 2. Phuong phap Matrix (Toeplitz Matrix)
H = zeros(Ny, Nx);
for col = 1:Nx
    H(col : col + Nh - 1, col) = h(:);
end
y_mat = (H * x(:))';
disp("y(n) - Matrix Method (Ex 6):", y_mat);

// 3. Tinh nang luong tuc thoi |x(n)|^2, |y(n)|^2 va ve do thi
nx = 0:(Nx - 1);
ny = 0:(Ny - 1);
Ex = x .^ 2;
Ey = y_fold .^ 2;

scf(6);
subplot(2, 2, 1);
plot2d3(nx, x, style=2); plot(nx, x, 'bo');
title("Signal x(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(2, 2, 2);
plot2d3(ny, y_fold, style=5); plot(ny, y_fold, 'ro');
title("Linear Convolution y(n)"); xlabel("n"); ylabel("Amplitude"); xgrid();

subplot(2, 2, 3);
plot2d3(nx, Ex, style=3); plot(nx, Ex, 'go');
title("Energy of x(n): E_x(n) = |x(n)|^2 (Total = " + string(sum(Ex)) + ")");
xlabel("n"); ylabel("Energy"); xgrid();

subplot(2, 2, 4);
plot2d3(ny, Ey, style=6); plot(ny, Ey, 'mo');
title("Energy of y(n): E_y(n) = |y(n)|^2 (Total = " + string(sum(Ey)) + ")");
xlabel("n"); ylabel("Energy"); xgrid();
