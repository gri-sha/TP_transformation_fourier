N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;

T_rect = 0.04;
rect = @(t) (abs(t) <= T_rect/2);
s5_periodique = rect(mod(t, T_rect));
S5_periodique = tfour(s5_periodique);
s5_per_rec = tfourinv(S5_periodique);

figure;
subplot(1,3,2);
plot(t, real(S5_periodique));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-6 6]);
axis square;

subplot(1,3,3);
plot(t, imag(S5_periodique));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-6 6]);
axis square;


subplot(1,3,1);
plot(t, s5_periodique, 'b', t, s5_per_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-0.1 0.1]);
axis square;