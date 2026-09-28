nx = -2:1;
x  = [1, -2, 3, 6];

// First window: x(n) and y1(n)
scf(0); clf();
n1 = -1:2;
y1 = x($:-1:1); // Đảo chiều vector

// x(n)
subplot(2, 1, 1);
plot2d3(nx, x, 2); h = gce(); h.children.thickness = 3;
title("Original Signal x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

// y1(n)
subplot(2, 1, 2);
plot2d3(n1, y1, 5); h = gce(); h.children.thickness = 3;
title("Manipulated Signal y1(n) = x(-n)"); xlabel("n"); ylabel("y1(n)"); xgrid();

// Second window: x(n) and y2(n)
scf(1); clf();
n2 = nx - 3; 
y2 = x;

// x(n)
subplot(2, 1, 1);
plot2d3(nx, x, 2); h = gce(); h.children.thickness = 3;
title("Original Signal x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

// y2(n)
subplot(2, 1, 2);
plot2d3(n2, y2, 5); h = gce(); h.children.thickness = 3;
title("Manipulated Signal y2(n) = x(n+3)"); xlabel("n"); ylabel("y2(n)"); xgrid();

// Third window: x(n) and y3(n)
scf(2); clf();
n3 = -3:0;
y3 = [12, 6, -4, 2];

// x(n)
subplot(2, 1, 1);
plot2d3(nx, x, 2); h = gce(); h.children.thickness = 3;
title("Original Signal x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

// y3(n)
subplot(2, 1, 2);
plot2d3(n3, y3, 3); h = gce(); h.children.thickness = 3;
title("Manipulated Signal y3(n) = 2*x(-n-2)"); xlabel("n"); ylabel("y3(n)"); xgrid();
