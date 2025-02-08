% Définition de la palette de couleur
gris=([0:255]/255)'*[1 1 1] ;

% Lecture de l'image dégradé
[im_degrade,map]=imread('texte_flou.png');
[x, y] = size(im_degrade);
im_degrade = double(im_degrade);
IM_degrade = fft2(im_degrade);

% Lecture de l'image de référence
[im_ref,map]=imread('texte_ref.png');
im_ref = double(im_ref);
IM_ref = fft2(im_ref);
% Spectre de puissance de l'image de référence
spectre_puissance_IM_ref = abs(IM_ref) .^2;

% Définition de la réponse impulsionnelle du filtre en SPATIAL qui a produit l'image dégradé
h = zeros(x, y);
largeur = 21;
h(257-1:257+1, 257-((largeur - 1)/2):257+((largeur - 1)/2)) = (1/(largeur * 3));
h = double(h);
H = fft2(fftshift(h)); % Ici on fait un fftshift, car on a construit un rectangle centré sur 0 (plus simple que de faire un rectangle centré sur le coin en haut à gauche)
spectre_puissance_H = abs(H) .^ 2;

% Affichage du filtre
figure;
image((3 * largeur * 255) .* h )
title("filtre")
colormap(gris)

% Spectre de puissance du bruit

% On floute l'image de référence
IM_ref_floutee = IM_ref .* H;
% On passe en représentation spatiale
im_ref_floutee = real(ifft2(IM_ref_floutee));

% Affichage de l'image
figure;
image(im_ref_floutee)
title("image de référence floutée")
colormap(gris)

% Reconstruction de l'image : 
IM_reconstruite = IM_degrade .* H;
im_reconstruite = real(ifft2(IM_reconstruite));
% Affichage
figure;
image(im_reconstruite)
title("Avec filtrage inversé 'simpliste' ")
colormap(gris)