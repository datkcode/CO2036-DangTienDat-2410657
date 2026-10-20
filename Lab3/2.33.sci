clc; clear;
n = 0:15;

// Cau (a)
ha = 2*(0.4.^n) - (0.2.^n);
sa = (25/12) - (4/3)*(0.4.^n) + (1/4)*(0.2.^n);

// Cau (b)
hb = (-10/3)*(0.5.^n) + (46/3)*(0.2.^n);
hb(1) = hb(1) - 10;
sb = (5/2) + (10/3)*(0.5.^n) - (23/6)*(0.2.^n);

disp("Cau (a) - h(0..5):", ha(1:6), "Cau (a) - s(0..5):", sa(1:6));
disp("Cau (b) - h(0..5):", hb(1:6), "Cau (b) - s(0..5):", sb(1:6));

scf(); clf();
subplot(2, 2, 1); plot2d3(n, ha, style=2); plot(n, ha, 'bo'); xgrid(); xtitle("2.33(a): h(n)", "n", "Bien do");
subplot(2, 2, 2); plot2d3(n, sa, style=5); plot(n, sa, 'ro'); xgrid(); xtitle("2.33(a): s(n)", "n", "Bien do");
subplot(2, 2, 3); plot2d3(n, hb, style=2); plot(n, hb, 'bo'); xgrid(); xtitle("2.33(b): h(n)", "n", "Bien do");
subplot(2, 2, 4); plot2d3(n, sb, style=5); plot(n, sb, 'ro'); xgrid(); xtitle("2.33(b): s(n)", "n", "Bien do");
