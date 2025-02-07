clc; clear; close all;

% Définition de la palette de couleur (niveau de gris)
gris = ([0:255]/255)' * [1 1 1];

% Lecture de l'image dégradée
im_degrade = double(imread('images/texte_flou.png'));
[x, y] = size(im_degrade);
IM_degrade = fft2(im_degrade);

% Affichage de l'image dégradée
figure;
imshow(uint8(im_degrade));
title("Image Dégradée");

% Définition du Filtre de Dégradation H(u,v)
h = zeros(x, y);
largeur = 21; % Largeur horizontale du rectangle
h(257-1:257+1, 257-((largeur - 1)/2):257+((largeur - 1)/2)) = (1 / (largeur * 3)); 
h = double(h);
H = fft2(fftshift(h)); % Transformée de Fourier du filtre de dégradation

% Affichage du filtre de dégradation
figure;
imshow(255 * (3 * largeur * h));
title("Filtre de Dégradation");
colormap(gris);

% Application du Filtrage Inverse Simpliste
epsilon = 1e-5; % Évite la division par zéro
H_inverse = 1 ./ (H + epsilon); % Inversion du filtre de dégradation

IM_reconstruite = IM_degrade .* H_inverse; % Application du filtre inverse

% Transformée inverse pour retrouver l'image restaurée
im_reconstruite = real(ifft2(IM_reconstruite));

% Affichage de l'image restaurée
figure;
imshow(uint8(im_reconstruite));
title("Image Restaurée par Filtrage Inverse");
colormap(gris);
