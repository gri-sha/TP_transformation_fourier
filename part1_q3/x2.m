N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s2 = sin(2*pi*2*t);  % f = 2 Hz
S2 = tfour(s2);
s2_rec = tfourinv(S2);


figure;
subplot(1,2, 1);
plot(t, s2, 'b', t, s2_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-1 1]);
axis square;

subplot(1,2,2);
plot(f, imag(S2));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-5 5]);
axis square;


