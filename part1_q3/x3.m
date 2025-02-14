N = 65536;
a = -25;
b = 25;
Te = (b-a)/N;
t = linspace(a, b, N);
fe = 1/Te;
f = linspace(-fe/2, fe/2, N);

s3 = zeros(1, N); 
%s3(N/2 + int64(fe*3)) = 1; 
deltaT=2;
index = round((deltaT - a) / (b - a) * N);
s3(index) = 1;  % dirac à deltaT
S4 = tfour(s3);
s4_rec = tfourinv(S4);

figure;
% on a un cos pour la partie réelle et un sin pour la partie imaginaire,
% parce que on a un diract, et sa TF c'est une exponentielle complexe =>
% partie cos et sin
subplot(1,3,2);
plot(f, real(S4));
title('Partie réelle');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;

subplot(1,3,3);
plot(f, imag(S4));
title('Partie imaginaire');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
xlim([-4 4]);
axis square;


subplot(1,3,1);
plot(t, s3, 'b', t, s4_rec, 'r--');
title('Signal original vs Reconstruit');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('Original', 'Reconstruit');
axis square;