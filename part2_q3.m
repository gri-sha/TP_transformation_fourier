N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
%t = linspace(a, b, N);
t=(0:N-1)*Te+a;
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

Df = 30;
f2 = 1280;

function g = gf(k, Df, t)
g = sin(2 * pi * k * t) + ...
    sin(2 * pi * (k + Df) * t) - ...
    2 * sin(2 * pi * (k + 2 * Df) * t);
end

figure;
plot(1);
plot(f, imag(tfour(gf(f2, Df, t))));
title('G_1280(f)');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-1000 1000]);
