clc; clear;
hn = (0.5).^(0:4);
yn = [1, 2, 2.5, 3, 3, 3, 2, 1, 0];
xn = zeros(1, 9);

for n = 0:8
    s = 0;
    for k = max(0, n-4):(n-1)
        s = s + hn(n - k + 1) * xn(k + 1);
    end
    xn(n + 1) = (yn(n + 1) - s) / hn(1);
end

disp("Tin hieu dau vao x(n) voi 0 <= n <= 8:", xn);

scf(); clf();
plot2d3(0:8, xn, style=2); plot(0:8, xn, 'ro'); xgrid();
xtitle("Bai 2.34: Tin hieu dau vao x(n) (0 <= n <= 8)", "n", "Bien do");
