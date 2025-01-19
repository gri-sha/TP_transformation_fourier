N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;

s0 = 3 * ones(1, N);
S0 = tfour(s0);

s0_rec = tfourinv(S0);  % signal reconstruit

figure;

subplot(1,3,2);
plot(t, real(S0));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-5 5]);
ylim([-5 5]);
axis square;

subplot(1,3,3);
plot(t, imag(S0));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-5 5]);
ylim([-5 5]);
axis square;


subplot(1,3,1);
plot(t, s0, 'b', t, s0_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-5 5]);
ylim([-5 5]);
axis square;