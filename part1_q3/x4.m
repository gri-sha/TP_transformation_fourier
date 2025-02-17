% Paramètres
N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

% Création du Dirac à t = deltaT
s3 = zeros(1, N);
deltaT = 1;
index = round((deltaT - a) / (b - a) * N); % Conversion temps → indice
s3(index) = 1;  % Dirac à deltaT

% Transformée de Fourier
S4 = tfour(s3); 
s4_rec = real(tfourinv(S4)); % Reconstruction

figure;
subplot(1,3,1);
plot(t, real(s3), 'b');
title('Partie Réelle de s3 (Dirac)');
xlabel('Temps (s)');
ylabel('Amplitude');
axis square;

subplot(1,3,2);
plot(t, imag(s3), 'r'); % Partie imaginaire (normalement nulle)
title('Partie Imaginaire de s3 (devrait être nulle)');
xlabel('Temps (s)');
ylabel('Amplitude');
axis square;

subplot(1,3,3);
plot(t, s3, 'b');
title('Signal reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
axis square;


figure;
subplot(1,2, 1);
plot(f, real(S4), 'b');
title('Partie Réelle de S4 (TF de s3)');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;

subplot(1, 2,2);
plot(f, imag(S4), 'r');
title('Partie Imaginaire de S4 (TF de s3)');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;