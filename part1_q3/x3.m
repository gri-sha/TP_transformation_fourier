N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s3 = zeros(1, N); s3(N/2 + int64(fe*3)) = 1;  % dirac
S3 = tfour(s3);
s3_rec = tfourinv(S3);

figure;
subplot(1,3,2);
plot(f, real(S3));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;

subplot(1,3,3);
plot(f, imag(S3));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;


subplot(1,3,1);
plot(t, s3, 'b', t, s3_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
axis square;