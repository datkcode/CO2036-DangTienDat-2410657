// Bai 2.26: Tinh va ve dap ung zero-input y_zi(n)
clc; clear;
ym1 = 5; // Dieu kien dau y(-1) = 5
ym2 = 0; // Dieu kien dau y(-2) = 0
n = 0:5;

// Tinh theo cong thuc giai tich
C1 = (-1/5)*ym1 + (4/5)*ym2;
C2 = (16/5)*ym1 + (16/5)*ym2;
y_zi = C1 * ((-1).^n) + C2 * (4.^n);

disp("Dap ung zero-input y_zi(n) voi n = 0..5:", y_zi);

scf(); clf();
plot2d3(n, y_zi, style=2);
plot(n, y_zi, 'ro');
xgrid();
xtitle("Bai 2.26: Dap ung zero-input y_zi(n)", "n", "Bien do");
