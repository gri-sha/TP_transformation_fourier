N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s1 = cos(2*pi*1*t);  % f = 1 Hz
S1 = tfour(s1);
s1_rec = tfourinv(S1);

figure;
subplot(1,2,1);
plot(t, s1, 'b', t, s1_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
xlim([-1 1]);
axis square;

subplot(1,2,2);
plot(f, real(S1));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-3 3]);
axis square;


