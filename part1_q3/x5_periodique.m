N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

T_rect = 0.04;
rect = @(t) (abs(t) <= T_rect/2);
s5_periodique = rect(mod(t, T_rect));
S5_periodique = tfour(s5_periodique);
s5_per_rec = tfourinv(S5_periodique);

figure;
subplot(1,2, 2);
plot(f, real(S5_periodique));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-600 600]);
axis square;

subplot(1,2, 1);
plot(t, s5_periodique, 'b', t, s5_per_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-0.1 0.1]);
axis square;