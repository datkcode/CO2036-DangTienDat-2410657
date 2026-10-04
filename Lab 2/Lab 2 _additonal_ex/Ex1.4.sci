clf(); clc;

//  GCD function
function g = my_gcd(a, b)
    while b ~= 0
        t = b;
        b = pmodulo(a, b);
        a = t;
    end
    g = abs(a);
endfunction

// TÍNH TOÁN VÀ IN KẾT QUẢ CHI TIẾT TỪNG GIÁ TRỊ k RA CONSOLE

// Với N = 7 ---
N_b = 7;
k_b = 0:(N_b - 1);
Np_b = zeros(1, length(k_b));

mprintf("========================================\n");
mprintf("=== KẾT QUẢ CÂU (b): N = 7 ===\n");
mprintf("========================================\n");
for i = 1:length(k_b)
    Np_b(i) = N_b / my_gcd(k_b(i), N_b);
    mprintf("k = %2d  -->  Np = %2d\n", k_b(i), Np_b(i));
end
mprintf("\n");

// Với N = 16 ---
N_c = 16;
k_c = 0:(N_c - 1);
Np_c = zeros(1, length(k_c));

mprintf("========================================\n");
mprintf("=== KẾT QUẢ CÂU (c): N = 16 ===\n");
mprintf("========================================\n");
for i = 1:length(k_c)
    Np_c(i) = N_c / my_gcd(k_c(i), N_c);
    mprintf("k = %2d  -->  Np = %2d\n", k_c(i), Np_c(i));
end
mprintf("\n");

// =============================================================================
// 3. TRỰC QUAN HÓA TRÊN ĐỒ THỊ
// =============================================================================
f = gcf();
f.figure_size = [1200, 800];
set(f, "figure_name", "Exercise 1.4 - Fundamental Period Analysis");

// Đồ thị 1: Phân bố chu kỳ Np theo k với N = 7
subplot(2, 2, 1);
plot2d3(k_b, Np_b, 2); h = gce(); h.children.thickness = 3;
plot(k_b, Np_b, "bo");  h = gce(); h.children.mark_size = 8;
title("(b) Fundamental Period Np vs k (N = 7)");
xlabel("Harmonic index k"); ylabel("Period Np"); xgrid();
gca().font_size = 2;

// Đồ thị 2: Phân bố chu kỳ Np theo k với N = 16
subplot(2, 2, 2);
plot2d3(k_c, Np_c, 5); h = gce(); h.children.thickness = 3;
plot(k_c, Np_c, "ro");  h = gce(); h.children.mark_size = 8;
title("(c) Fundamental Period Np vs k (N = 16)");
xlabel("Harmonic index k"); ylabel("Period Np"); xgrid();
gca().font_size = 2;

// Đồ thị 3: Dạng sóng kiểm chứng N = 16, k = 4 -> Np = 4
n_demo = 0:16;
s_demo1 = cos(2 * %pi * 4 * n_demo / 16);
subplot(2, 2, 3);
plot2d3(n_demo, s_demo1, 3); h = gce(); h.children.thickness = 3;
plot(n_demo, s_demo1, "go");  h = gce(); h.children.mark_size = 7;
title("Waveform for N=16, k=4 (Repeats every Np = 4)");
xlabel("n"); ylabel("Real{s_k(n)}"); xgrid();
gca().font_size = 2;

// Đồ thị 4: Dạng sóng kiểm chứng N = 16, k = 2 -> Np = 8
s_demo2 = cos(2 * %pi * 2 * n_demo / 16);
subplot(2, 2, 4);
plot2d3(n_demo, s_demo2, 6); h = gce(); h.children.thickness = 3;
plot(n_demo, s_demo2, "mo");  h = gce(); h.children.mark_size = 7;
title("Waveform for N=16, k=2 (Repeats every Np = 8)");
xlabel("n"); ylabel("Real{s_k(n)}"); xgrid();
gca().font_size = 2;
