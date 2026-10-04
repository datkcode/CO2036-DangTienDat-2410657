clf(); clc;

f = gcf();
f.figure_size = [1200, 850];
set(f, "figure_name", "Exercise 1.2 - Periodicity of Sinusoids (Enlarged)");

// (a) x(n) = cos(0.01*pi*n)
na = 0:100; 
xa = cos(0.01 * %pi * na);

subplot(3, 2, 1);
plot2d3(na, xa, 2); h = gce(); h.children.thickness = 2;
title("(a) x(n) = cos(0.01*%pi*n) [N = 200]");
xlabel("n"); ylabel("x_a(n)"); xgrid();
ax = gca(); ax.font_size = 2;

// (b) x(n) = cos(30*pi*n / 105) 
nb = 0:21;
xb = cos(%pi * 30 * nb / 105);

subplot(3, 2, 2);
plot2d3(nb, xb, 5); h1 = gce(); h1.children.thickness = 3;
plot(nb, xb, "ro"); h2 = gce(); h2.children.mark_size = 7;
title("(b) x(n) = cos(30*%pi*n/105) [N = 7]");
xlabel("n"); ylabel("x_b(n)"); xgrid();
ax = gca(); ax.font_size = 2;

// (c) x(n) = cos(3*pi*n) = (-1)^n 
nc = 0:12;
xc = cos(3 * %pi * nc);

subplot(3, 2, 3);
plot2d3(nc, xc, 3); h1 = gce(); h1.children.thickness = 3;
plot(nc, xc, "go"); h2 = gce(); h2.children.mark_size = 7;
title("(c) x(n) = cos(3*%pi*n) [N = 2]");
xlabel("n"); ylabel("x_c(n)"); xgrid();
ax = gca(); ax.font_size = 2;

// (d) x(n) = sin(3*n)
nd = 0:30;
xd = sin(3 * nd);

subplot(3, 2, 4);
plot2d3(nd, xd, 1); h1 = gce(); h1.children.thickness = 2;
plot(nd, xd, "ko"); h2 = gce(); h2.children.mark_size = 6;
title("(d) x(n) = sin(3*n) [Aperiodic]");
xlabel("n"); ylabel("x_d(n)"); xgrid();
ax = gca(); ax.font_size = 2;

// (e) x(n) = sin(62*pi*n / 10) 
ne = 0:20; 
xe = sin(%pi * 62 * ne / 10);

subplot(3, 2, 5);
plot2d3(ne, xe, 6); h1 = gce(); h1.children.thickness = 3;
plot(ne, xe, "mo"); h2 = gce(); h2.children.mark_size = 7;
title("(e) x(n) = sin(62*%pi*n/10) [N = 10]");
xlabel("n"); ylabel("x_e(n)"); xgrid();
ax = gca(); ax.font_size = 2;
