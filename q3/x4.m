N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;

s4 = exp(1i * 2 * pi * 5 * t);  % f = 5 Hz
S4 = tfour(s4);

figure;
subplot(1,2,1);
plot(t, real(S3));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-0.03 0.03]);
axis square;

subplot(1,2,2);
plot(t, imag(S3));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-0.03 0.03]);
axis square;