clf(); clc;

//a) Fs = 5 kHz, n = 0:99, F0 = 0.5, 2, 3, 4.5 kHz
scf(0); clf();
f1 = gcf();
f1.figure_size = [1200, 850];
set(f1, "figure_name", "Exercise 1.15(a) - Aliasing Demonstration (Fs = 5 kHz)");

Fs_a = 5000;
n_a  = 0:99;

// 1. F0 = 0.5 kHz (f = 0.1)
x1 = sin(2 * %pi * (500 / Fs_a) * n_a);
subplot(2, 2, 1);
plot2d3(n_a, x1, 2); h = gce(); h.children.thickness = 2;
title("(a1) F0 = 0.5 kHz (f = 0.1, N = 10 samples)");
xlabel("n"); ylabel("x1(n)"); xgrid();
gca().font_size = 2;

// 2. F0 = 2.0 kHz (f = 0.4)
x2 = sin(2 * %pi * (2000 / Fs_a) * n_a);
subplot(2, 2, 2);
plot2d3(n_a, x2, 5); h = gce(); h.children.thickness = 2;
title("(a2) F0 = 2.0 kHz (f = 0.4, N = 5 samples)");
xlabel("n"); ylabel("x2(n)"); xgrid();
gca().font_size = 2;

// 3. F0 = 3.0 kHz (f = 0.6 -> Alias: f_app = 0.4, dao dau: x3 = -x2)
x3 = sin(2 * %pi * (3000 / Fs_a) * n_a);
subplot(2, 2, 3);
plot2d3(n_a, x3, 3); h = gce(); h.children.thickness = 2;
title("(a3) F0 = 3.0 kHz (Aliased: f_app = 0.4, x3 = -x2)");
xlabel("n"); ylabel("x3(n)"); xgrid();
gca().font_size = 2;

// 4. F0 = 4.5 kHz (f = 0.9 -> Alias: f_app = 0.1, dao dau: x4 = -x1)
x4 = sin(2 * %pi * (4500 / Fs_a) * n_a);
subplot(2, 2, 4);
plot2d3(n_a, x4, 6); h = gce(); h.children.thickness = 2;
title("(a4) F0 = 4.5 kHz (Aliased: f_app = 0.1, x4 = -x1)");
xlabel("n"); ylabel("x4(n)"); xgrid();
gca().font_size = 2;


// b): F0 = 2 kHz, Fs = 50 kHz, Downsampling by 2 (Even samples)
scf(1); clf();
f2 = gcf();
f2.figure_size = [1200, 750];
set(f2, "figure_name", "Exercise 1.15(b) - Decimation / Even-numbered Samples");

F0_b = 2000;
Fs_b = 50000;
f0_val = F0_b / Fs_b;

n_b = 0:50;
xn  = sin(2 * %pi * f0_val * n_b);

ny  = 0:25;
yn  = sin(2 * %pi * (2 * f0_val) * ny);

// figure b1: x(n)
subplot(2, 1, 1);
plot2d3(n_b, xn, 2); h1 = gce(); h1.children.thickness = 3;
plot(n_b, xn, "bo");  h2 = gce(); h2.children.mark_size = 7;
title("(b.1) Signal x(n) with F0 = 2 kHz, Fs = 50 kHz -> f0 = 0.04 (N = 25)");
xlabel("n"); ylabel("x(n)"); xgrid();
gca().font_size = 2;

// figure b2: y(n) = x(2n)
subplot(2, 1, 2);
plot2d3(ny, yn, 5);  h3 = gce(); h3.children.thickness = 3;
plot(ny, yn, "ro");  h4 = gce(); h4.children.mark_size = 7;
title("(b.2) Signal y(n) = x(2n) (Even samples) -> Sinusoidal with fy = 0.08 (N = 25)");
xlabel("n"); ylabel("y(n)"); xgrid();
gca().font_size = 2;
