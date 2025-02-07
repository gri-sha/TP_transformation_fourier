% Palette de couleurs
gris=([0:255]/255)'*[1 1 1] ;

% Ouverture de l'image
[im,map]=imread('images/ndg-bellecour.png');
[x, y] = size(im);

im_compresse = zeros(x, y);
C = 10 % Paramètre de compression => a faire varier

% Matrice de quantification
Q = ones(8, 8);
for k=-4:3
    for l=-4:3
        Q(k+5, l+5) = 2^(C * max(abs(k), abs(l)));
    end;
end;
Q

for i=1:8:512
    for j=1:8:512
        bloc = im(i:i+7, j:j+7);
        B = fftshift(fft2(bloc));
        % On applique la matrice de quantification
        B = round(B ./ Q) .* Q;
        % Enregistrement dans im_compresse
        im_compresse(i:i+7, j:j+7) = real(ifft2(fftshift(B)));
    end;
end;

% Affichage
im_compresse;
image(im_compresse)
colormap(gris)
title("Image après traitement")