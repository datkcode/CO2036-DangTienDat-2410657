clc; clear;
n = 0:10;
yp = (8/5) * (2.^n);

disp("Nghiem rieng y_p(n) tai n = 0..5:", yp(1:6));

scf(); clf();
plot2d3(n, yp, style=5);
plot(n, yp, 'bo');
xgrid();
xtitle("Bai 2.27: Nghiem rieng y_p(n) = (8/5) * 2^n * u(n)", "n", "Bien do");
