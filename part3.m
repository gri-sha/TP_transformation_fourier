N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

f1 = 134;
f2 = 23;

% Low pass filtre
filtre = double(abs(f) <= 25.5);  

% initial signals
s1 = cos(2*pi*5*t) + 2*cos(2*pi*10*t) + 3*cos(2*pi*15*t) + 4*cos(2*pi*20*t) + 5*cos(2*pi*25*t);
s2 = 5*cos(2*pi*5*t) + 4*cos(2*pi*10*t) + 3*cos(2*pi*15*t) + 2*cos(2*pi*20*t) + cos(2*pi*25*t);

% transmitted signal
m = s1 .* cos(2*pi*f1*t) + s2 .* cos(2*pi*f2*t);

% not filtered signals
d1_nf = m .* cos(2*pi*f1*t);
d2_nf = m .* cos(2*pi*f2*t);

% filtered spectres
D1 = real(tfour(d1_nf)) .* filtre*2;
D2 = real(tfour(d2_nf)) .* filtre*2;

% restored signals
d1 = tfourinv(D1);
d2 = tfourinv(D2);

figure;
subplot(1, 2, 1);
plot(t, s1);
title('s1(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
xlim([-1 1]);
axis square;
subplot(1, 2, 2);
plot(t, s2);
title('s1(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
xlim([-1 1]);
axis square;

figure;
subplot(1, 2, 1);
plot(f, real(tfour(s1)));
title('S1(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-30 30]);
axis square;
subplot(1, 2, 2);
plot(f, real(tfour(s2)));
title('S2(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-30 30]);
axis square;

figure;
subplot(1, 2, 1);
plot(t, m);
title('m(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
xlim([-1 1]);
axis square;
subplot(1, 2, 2);
plot(f, real(tfour(m)));
title('M(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-400 400]);
axis square;

figure;
subplot(1, 2, 1);
plot(f, real(tfour(d1_nf)));
title('D1_{no filter}(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-400 400]);
axis square;
subplot(1, 2, 2);
plot(f, real(tfour(d2_nf)));
title('D2_{no filter}(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-400 400]);
axis square;

figure;
subplot(1, 2, 1);
plot(f, D1);
title('D1_{filtered}(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-30 30]);
axis square;
subplot(1, 2, 2);
plot(f, D2);
title('D2_{filtered}(f)');
xlabel('Frequence (Hz)');
ylabel('Amplitude');
grid on;
xlim([-30 30]);
axis square;

figure;
subplot(1, 2, 1);
plot(t, d1);
title('s1_{restored}(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
xlim([-1 1]);
axis square;
subplot(1, 2, 2);
plot(t, d2);
title('s2_{restored}(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
xlim([-1 1]);
axis square;