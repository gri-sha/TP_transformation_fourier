N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s6 = exp(-pi*t.^2);
S6 = tfour(s6);
s6_rec = tfourinv(S6);

figure;
subplot(1,3,2);
plot(f, real(S6));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-7 7]);
ylim([-10 1500]);
axis square;

subplot(1,3,3);
plot(f, imag(S6));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-fe/2 fe/2]);
ylim([-10 10]);
axis square;


subplot(1,3,1);
plot(t, s6, 'b', t, s6_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-10 10]);
axis square;