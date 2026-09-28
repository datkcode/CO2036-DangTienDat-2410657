clf();
n = -1:3;
x1 = [0, 0, 1, 3, -2];
x2 = [0, 1, 2, 3, 0];
y  = x1 .* x2; 

// x1(n) signal
subplot(3, 1, 1);
plot2d3(n, x1, 2);
h1 = gce(); h1.children.thickness = 3; 
title("Signal x1(n)");
xlabel("n"); ylabel("x1(n)");
xgrid();

//x2(n) signal
subplot(3, 1, 2);
plot2d3(n, x2, 5);
h2 = gce(); h2.children.thickness = 3;
title("Signal x2(n)");
xlabel("n"); ylabel("x2(n)");
xgrid();

// y(n) signal
subplot(3, 1, 3);
plot2d3(n, y, 3);
h3 = gce(); h3.children.thickness = 3;
title("Product Signal y(n) = x1(n) . x2(n)");
xlabel("n"); ylabel("y(n)");
xgrid();
