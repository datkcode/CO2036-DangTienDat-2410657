clf(); clc;

f = gcf();
f.figure_size = [1200, 850];
set(f, "figure_name", "Exercise 1.11 - A/D, D/A Conversion and Filtering");

T_ad = 0.005;
Fs_ad = 1 / T_ad;

T_da = 0.001;
Fs_da = 1 / T_da;

t_max = 0.04;
t_fine = linspace(0, t_max, 2000); o

//Signal simulation
// xa(t) = 3*cos(100*pi*t) + 2*sin(250*pi*t)
xa = 3 * cos(100 * %pi * t_fine) + 2 * sin(250 * %pi * t_fine);
n = 0:floor(t_max / T_ad);
t_samples = n * T_ad;
xn = 3 * cos(100 * %pi * t_samples) + 2 * sin(250 * %pi * t_samples);

// ya(t) = 3*cos(500*pi*t) - 2*sin(750*pi*t)
ya = 3 * cos(500 * %pi * t_fine) - 2 * sin(750 * %pi * t_fine);

// Figure 1: input signal xa(t) and after samlping x(n)
subplot(3, 1, 1);
plot(t_fine * 1000, xa, "b-", "thickness", 2);
plot2d3(t_samples * 1000, xn, 5); h1 = gce(); h1.children.thickness = 3;
plot(t_samples * 1000, xn, "ro"); h2 = gce(); h2.children.mark_size = 7;
title("1. Input Signal xa(t) and A/D Sampling Points (T = 5 ms, Fs = 200 Hz)");
xlabel("t (ms)"); ylabel("xa(t)"); xgrid();
legend(["Analog xa(t)", "Sampled points"], 1);
gca().font_size = 2;

// Figure 2: x(n)
subplot(3, 1, 2);
plot2d3(n, xn, 3); h1 = gce(); h1.children.thickness = 3;
plot(n, xn, "go"); h2 = gce(); h2.children.mark_size = 7;
title("2. Discrete-Time Signal x(n) = 3*cos(pi*n/2) - 2*sin(3*pi*n/4)");
xlabel("Sample index n"); ylabel("x(n)"); xgrid();
gca().font_size = 2;

// Figure 3: ya(t) signal
subplot(3, 1, 3);
plot(t_fine * 1000, ya, "m-", "thickness", 2.5);
title("3. Output Signal ya(t) = 3*cos(500*pi*t) - 2*sin(750*pi*t) (T'' = 1 ms, Fs'' = 1000 Hz)");
xlabel("t (ms)"); ylabel("ya(t)"); xgrid();
gca().font_size = 2;
