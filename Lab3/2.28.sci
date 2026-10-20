clc; clear;
a1 = -0.9;
ym1 = 0; // Gia su y(-1) = 0 (zero-state)
n = 0:40;

y_tr = (ym1 - 1/(1 + a1)) * ((-a1).^(n + 1));
y_ss = (1/(1 + a1)) * ones(1, length(n));
y_total = y_tr + y_ss;

scf(); clf();
subplot(3, 1, 1);
plot2d3(n, y_tr, style=2); plot(n, y_tr, 'bo'); xgrid();
xtitle("Dap ung qua do (Transient response) y_tr(n)", "n", "Bien do");

subplot(3, 1, 2);
plot2d3(n, y_ss, style=3); plot(n, y_ss, 'go'); xgrid();
xtitle("Dap ung xac lap (Steady-state response) y_ss(n)", "n", "Bien do");

subplot(3, 1, 3);
plot2d3(n, y_total, style=5); plot(n, y_total, 'ro'); xgrid();
xtitle("Dap ung tong y(n) = y_tr(n) + y_ss(n)", "n", "Bien do");
