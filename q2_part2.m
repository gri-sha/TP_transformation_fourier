N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

Df = 30;
f1 = 400;
f2 = 900;

function g = gf(k, Df, t)
g = sin(2 * pi * k * t) + ...
    sin(2 * pi * (k + Df) * t) - ...
    2 * sin(2 * pi * (k + 2 * Df) * t);
end

figure;

subplot(2,1,1);
plot(f, imag(tfour(gf(f1, Df, t))));
title('G_400(f)');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-500 500]);

subplot(2,1,2);
plot(f, imag(tfour(gf(f2, Df, t))));
title('G_900(f)');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
