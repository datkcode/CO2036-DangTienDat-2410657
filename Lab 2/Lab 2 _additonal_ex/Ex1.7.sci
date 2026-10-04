clf(); clc;
f = gcf();
f.figure_size = [1150, 750];
set(f, "figure_name", "Exercise 1.7 - Aliasing Simulation");

Fs = 8000;      
Ts = 1 / Fs;       
t_end = 0.002;     


t_fine = linspace(0, t_end, 2000);
n = 0:floor(t_end * Fs);
t_samples = n * Ts;

//(b): F1 = 5 kHz sampling at Fs = 8 kHz -> Alias F_app = 3 kHz
F1 = 5000;
F_app1 = abs(F1 - Fs);

xa1    = cos(2 * %pi * F1 * t_fine);
xn1    = cos(2 * %pi * F1 * t_samples);
x_rec1 = cos(2 * %pi * F_app1 * t_fine);

subplot(2, 1, 1);
plot(t_fine * 1000, xa1, "b-", "thickness", 1.5);       
plot(t_fine * 1000, x_rec1, "r--", "thickness", 2.5);    
plot2d3(t_samples * 1000, xn1, 3);
h = gce(); h.children.thickness = 2;
plot(t_samples * 1000, xn1, "go");                       
h = gce(); h.children.mark_size = 7;

title("(b) Sampling F1 = 5 kHz at Fs = 8 kHz: Aliased into F_app = 3 kHz");
xlabel("t (ms)"); ylabel("Amplitude");
legend(["Original Analog (5 kHz)", "Reconstructed Alias (3 kHz)", "Discrete Samples"], 1);
xgrid();
gca().font_size = 2;

// (c): F2 = 9 kHz sampling at Fs = 8 kHz -> Alias F_app = 1 kHz
F2 = 9000;
F_app2 = abs(F2 - Fs); 

xa2    = cos(2 * %pi * F2 * t_fine);
xn2    = cos(2 * %pi * F2 * t_samples);
x_rec2 = cos(2 * %pi * F_app2 * t_fine);

subplot(2, 1, 2);
plot(t_fine * 1000, xa2, "b-", "thickness", 1.5);         
plot(t_fine * 1000, x_rec2, "r--", "thickness", 2.5);    
plot2d3(t_samples * 1000, xn2, 3);
h = gce(); h.children.thickness = 2;
plot(t_samples * 1000, xn2, "go");                      
h = gce(); h.children.mark_size = 7;

title("(c) Sampling F2 = 9 kHz at Fs = 8 kHz: Aliased into F_app = 1 kHz");
xlabel("t (ms)"); ylabel("Amplitude");
legend(["Original Analog (9 kHz)", "Reconstructed Alias (1 kHz)", "Discrete Samples"], 1);
xgrid();
gca().font_size = 2;
