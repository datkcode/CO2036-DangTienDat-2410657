clear; clc; close(winsid());

// Tạo ảnh giả lập 128x128 (hoặc dùng I = double(rgb2gray(imread('path_to_image.jpg'))))
[X, Y] = meshgrid(1:128, 1:128);
I = uint8(127 + 60 * sin(X/5) .* cos(Y/5) + grand(128, 128, "nor", 0, 20));

// 1. Làm mờ ảnh (Blurring) bằng bộ lọc trung bình 5x5 (2D Convolution)
kernel = ones(5, 5) / 25;
I_blur = uint8(conv2(double(I), kernel, "same"));

// 2. Cân bằng Histogram (Histogram Equalization thủ công không phụ thuộc toolbox)
[counts, cells] = histc(256, double(I(:)), normalization=%f);
cdf = cumsum(counts) / length(I(:));
I_eq = uint8(255 * matrix(cdf(double(I(:)) + 1), size(I)));

// Hiển thị kết quả
scf(1);
subplot(2, 2, 1);
Matplot(I);
title("Original Grayscale Image");

subplot(2, 2, 2);
Matplot(I_blur);
title("Blurred Image (5x5 Average Filter)");

subplot(2, 2, 3);
bar(0:255, counts);
title("Histogram of Original Image");
xlabel("Pixel Intensity"); ylabel("Frequency");

subplot(2, 2, 4);
[counts_eq, _] = histc(256, double(I_eq(:)), normalization=%f);
bar(0:255, counts_eq);
title("Equalized Histogram");
xlabel("Pixel Intensity"); ylabel("Frequency");
