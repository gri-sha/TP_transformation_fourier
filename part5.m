% reference image
[ref, m1] = imread('images/texte_ref.png');
ref = double(ref);
REF = fftshift(fft2(ref));
[x, y] = size(ref);

% Définition de la réponse impulsionnelle du filtre en SPATIAL qui a produit l'image dégradé
h = zeros(x, y);
largeur = 255;
h(257-1:257+1, 257-((largeur - 1)/2):257+((largeur - 1)/2)) = (1/(largeur * 3));
h = double(h);
H = fft2(fftshift(h));
spectre_puissance_H = abs(abs(REF)) .* abs(abs(REF));

% determine the P_I first
P_I = P_I .^ 2; 

% determine P_B
d_r = ref .* h;
D_R = REF .* H;
d_q = ifft2(fftshift(D_R));
bruit = d_q - d_r; % the problem is bruit is 0
P_B = fftshift(fft2(bruit));
P_B = P_B .^ 2;

% try to restore the image in a simple way
[im_d, m2] = imread('images/texte_flou.png');
im_d = double(im_d);

% Restauration simpliste
IM_D = fftshift(fft2(ref));
IM_D_R = IM_D ./ H;
im_d_r = real(ifft2(ifftshift(IM_D_R)));

% Restauration weiner
H_2 = H .^ 2;
IM_D_R_W = IM_D .* ((1 ./ H) .* (H_2)./ (H_2 + (P_B ./ P_I)));
im_d_r_w = real(ifft2(ifftshift(IM_D_R_W)));

figure(1);
subplot(1, 3, 1);
gris = ([0:255]/255)' * [1 1 1];
image(im);
colormap(gris);
axis square;
subplot(1, 3, 2);
image(im_d_r);
title("Restauration simpliste");
colormap(gris);
axis square;
subplot(1, 3, 3);
image(im_d_r_w);
title("Restauration Weiner");
colormap(gris);
axis square;