N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

function g = gf(k, Df, t)
g = sin(2 * pi * k * t) + ...
    sin(2 * pi * (k + Df) * t) - ...
    2 * sin(2 * pi * (k + 2 * Df) * t);
end

figure;
subplot(1,2,1)
plot(t, gf(-4*fe-30, Df, t));
title('f = -4*fe - 30');
xlabel('Temps (s)');
ylabel('Amplitude');
xlim([-0.1 0.1]);
axis square;

subplot(1,2,2)
plot(t, gf(2*fe - 15, Df, t));
title('f = 2*fe - 15');
xlabel('Temps (s)');
ylabel('Amplitude');
xlim([-0.1 0.1]);
axis square;