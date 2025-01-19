N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;

s2 = sin(2*pi*2*t);  % f = 2 Hz
S2 = tfour(s2);
s2_rec = tfourinv(S2);


figure;
subplot(1,3,2);
plot(t, real(S2));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-0.1 0.1]);
axis square;

subplot(1,3,3);
plot(t, imag(S2));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-0.1 0.1]);
axis square;


subplot(1,3,1);
plot(t, s2, 'b', t, s2_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-1 1]);
axis square;