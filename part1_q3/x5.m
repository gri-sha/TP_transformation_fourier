N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

T_rect = 0.04;
rect = @(t) (abs(t) <= T_rect/2);
s5 = rect(t);  % rectangle (S=0.04)
S5 = tfour(s5);
s5_rec = tfourinv(S5);

figure;
subplot(1,3,2);
plot(f, real(S5));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-600 600]);
ylim([-20 60]);
axis square;

subplot(1,3,3);
plot(f, imag(S5));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-600 600]);
ylim([-20 20]);
axis square;


subplot(1,3,1);
plot(t, s5, 'b', t, s5_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-0.1 0.1]);
axis square;