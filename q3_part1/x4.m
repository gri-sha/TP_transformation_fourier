N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s4 = exp(1i * 2 * pi * 5 * t);  % f = 5 Hz
S4 = tfour(s4);

figure;
subplot(1,2,1);
plot(f, real(S4));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-10 10]);
axis square;

subplot(1,2,2);
plot(f, imag(S4));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-10 10]);
axis square;