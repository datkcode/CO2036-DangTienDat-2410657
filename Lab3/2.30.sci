clc; clear;
n = 0:6;
y_zs = (-1/25)*((-1).^n) + (26/25)*(4.^n) + (6/5)*n.*(4.^n);

disp("Dap ung y_zs(n) voi n = 0..6:", y_zs);

scf(); clf();
plot2d3(n, y_zs, style=2); plot(n, y_zs, 'ro'); xgrid();
xtitle("Bai 2.30: Dap ung he thong y_zs(n)", "n", "Bien do");
