clf();

n = -1:1;
x = [1, 3, -2];
x_fold = x($:-1:1); 

// even and odd components
xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

// Original x(n)
subplot(3, 1, 1);
plot2d3(n, x, 2);
h1 = gce(); h1.children.thickness = 3;     
title("Original Signal x(n)");
xlabel("n"); ylabel("x(n)");
xgrid();               

//Even component
subplot(3, 1, 2);
plot2d3(n, xe, 5);
h2 = gce(); h2.children.thickness = 3;
title("Even Component xe(n)");
xlabel("n"); ylabel("xe(n)");
xgrid();

// Odd component
subplot(3, 1, 3);
plot2d3(n, xo, 3);
h3 = gce(); h3.children.thickness = 3;    
title("Odd Component xo(n)");
xlabel("n"); ylabel("xo(n)");
xgrid();
