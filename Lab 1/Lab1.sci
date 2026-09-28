clf(); clc;
// Exercise 1.1
x = 1:4;
y = 5:8;
// 1. Vector (x1+1, x2+1, x3+1, x4+1)
v1 = x + 1;
disp("Ex 1.1.1 - Vector (x + 1):", v1);
// 2. Vector (x1*y1, x2*y2, x3*y3, x4*y4)
v2 = x .* y;
disp("Ex 1.1.2 - Vector (x .* y):", v2);
// 3. Vector sin(x)
x_lin = linspace(0, %pi, 10);
v3 = sin(x_lin);
disp("Ex 1.1.3 - Vector sin(linspace(0, %pi, 10)):", v3);

// Exercise 1.2
f0   = 50;
T0   = 1 / f0;
t_5T = 5 * T0;

// 1. x(a) in 5 periods
t  = linspace(0, t_5T, 1000);
xa = 3 * sin(100 * %pi * t);

subplot(3, 1, 1);
plot(t, xa, "b", "thickness", 2);
title("1. Analog Signal xa(t)");
xlabel("t (s)"); ylabel("xa(t)"); xgrid();

// 2. x(n) with Fs = 300 sample/s
Fs = 300;
N  = 6;                   
n  = 0:(5 * N - 1);       
xn = 3 * sin((%pi / 3) * n);

subplot(3, 1, 2);
plot2d3(n, xn, 5); h = gce(); h.children.thickness = 3;
title("2. Sampled Signal x(n)");
xlabel("n (samples)"); ylabel("x(n)"); xgrid();

// 3. xq(n) with Delta = 0.1
Delta = 0.1;
xq    = floor(xn / Delta) * Delta;

subplot(3, 1, 3);
plot2d3(n, xq, 3); h = gce(); h.children.thickness = 3;
title("3. Quantized Signal xq(n)");
xlabel("n (samples)"); ylabel("xq(n)"); xgrid();
