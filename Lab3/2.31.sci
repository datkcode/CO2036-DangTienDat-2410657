clc; clear;
n = 0:6;
hn = (-1/5)*((-1).^n) + (6/5)*(4.^n);

disp("Dap ung xung h(n) voi n = 0..6:", hn);

scf(); clf();
plot2d3(n, hn, style=5); plot(n, hn, 'bo'); xgrid();
xtitle("Bai 2.31: Dap ung xung h(n)", "n", "Bien do");
