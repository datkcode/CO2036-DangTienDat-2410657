clf(); clc;


// =============================================================================
// THIẾT LẬP TÍN HIỆU GỐC
// =============================================================================
f0 = 1 / 50;
N  = 200;
n  = 0:(N - 1);
x  = sin(2 * %pi * f0 * n);
Px = sum(x.^2) / N; // Công suất tín hiệu gốc = 0.5

L_levels = [64, 128, 256];
b_bits   = [6, 7, 8];

sqnr_trunc = zeros(1, 3);
sqnr_round = zeros(1, 3);
sqnr_theo  = 1.76 + 6.02 * b_bits;

// =============================================================================
// CÂU (a): LƯỢNG TỬ HÓA CẮT BỎ (TRUNCATION)
// =============================================================================
scf(0); clf();
f1 = gcf(); f1.figure_size = [1200, 850];
set(f1, "figure_name", "Exercise 1.16(a) - Quantization using Truncation");

for i = 1:3
    L = L_levels(i);
    Delta = 2 / L;
    
    // Cắt bỏ (Truncation) bằng hàm floor
    xq = floor(x / Delta) * Delta;
    e  = xq - x;
    
    Pq = sum(e.^2) / N;
    sqnr_trunc(i) = 10 * log10(Px / Pq);
    
    // Đồ thị x(n) và xq(n) (lấy 1 chu kỳ 50 mẫu đầu để hiển thị rõ)
    subplot(3, 2, 2 * i - 1);
    plot(n(1:50), x(1:50), "b-", "thickness", 1.5);
    plot(n(1:50), xq(1:50), "r--", "thickness", 1.5);
    title(msprintf("Truncation L = %d (b = %d): x(n) and xq(n)", L, b_bits(i)));
    xlabel("n"); ylabel("Amplitude"); legend(["Original x(n)", "Quantized xq(n)"], 4);
    xgrid(); gca().font_size = 2;
    
    // Đồ thị sai số e(n)
    subplot(3, 2, 2 * i);
    plot2d3(n(1:50), e(1:50), 5); h = gce(); h.children.thickness = 2;
    plot(n(1:50), e(1:50), "ro");  h = gce(); h.children.mark_size = 5;
    title(msprintf("Error e(n) = xq(n) - x(n) | SQNR = %.2f dB", sqnr_trunc(i)));
    xlabel("n"); ylabel("e(n)"); xgrid(); gca().font_size = 2;
end

// =============================================================================
// CÂU (b): LƯỢNG TỬ HÓA LÀM TRÒN (ROUNDING)
// =============================================================================
scf(1); clf();
f2 = gcf(); f2.figure_size = [1200, 850];
set(f2, "figure_name", "Exercise 1.16(b) - Quantization using Rounding");

for i = 1:3
    L = L_levels(i);
    Delta = 2 / L;
    
    // Làm tròn (Rounding) bằng hàm round
    xq = round(x / Delta) * Delta;
    e  = xq - x;
    
    Pq = sum(e.^2) / N;
    sqnr_round(i) = 10 * log10(Px / Pq);
    
    // Đồ thị x(n) và xq(n)
    subplot(3, 2, 2 * i - 1);
    plot(n(1:50), x(1:50), "b-", "thickness", 1.5);
    plot(n(1:50), xq(1:50), "g--", "thickness", 1.5);
    title(msprintf("Rounding L = %d (b = %d): x(n) and xq(n)", L, b_bits(i)));
    xlabel("n"); ylabel("Amplitude"); legend(["Original x(n)", "Quantized xq(n)"], 4);
    xgrid(); gca().font_size = 2;
    
    // Đồ thị sai số e(n)
    subplot(3, 2, 2 * i);
    plot2d3(n(1:50), e(1:50), 3); h = gce(); h.children.thickness = 2;
    plot(n(1:50), e(1:50), "go");  h = gce(); h.children.mark_size = 5;
    title(msprintf("Error e(n) = xq(n) - x(n) | SQNR = %.2f dB", sqnr_round(i)));
    xlabel("n"); ylabel("e(n)"); xgrid(); gca().font_size = 2;
end

// =============================================================================
// IN BẢNG ĐỐI CHIẾU KẾT QUẢ RA CONSOLE
// =============================================================================
mprintf("=========================================================================\n");
mprintf("   BẢNG TỔNG HỢP SQNR THỰC NGHIỆM VÀ LÝ THUYẾT (dB)\n");
mprintf("=========================================================================\n");
mprintf(" Mức L | Bits (b) | Step Delta | Truncation (a) | Rounding (b) | Theory (1.4.32)\n");
mprintf("-------------------------------------------------------------------------\n");
for i = 1:3
    mprintf("  %3d  |    %d     |  %8.5f  |   %6.2f dB    |   %6.2f dB  |    %6.2f dB\n", ...
            L_levels(i), b_bits(i), 2/L_levels(i), sqnr_trunc(i), sqnr_round(i), sqnr_theo(i));
end
mprintf("=========================================================================\n");
