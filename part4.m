% read the image (it should be with sides equalto a power of 2)
[im, map] = imread('images/ndg-bellecour.png');
im = double(im);

% apply the fourier transform
IM = fftshift(fft2(im));

% for better filter representation (it has complex values)
logIM = log(abs(IM)+1);
maxi = max(max(logIM)); 
mini = min(min(logIM));
logIM_n = (logIM-mini)/(maxi-mini)*255;

% get the filtered spectre
K = 0.0001;
l = size(im, 1);
h = size(im, 2);
IM_modified = zeros(size(im));

for x = 1:l
    for y = 1:h
        filter_value = H(K, x - l/2 - 1, y - h/2 - 1);
        IM_modified(x, y) = IM(x, y) * filter_value;
    end
end

% get the filtered image
im_modified = real(ifft2(fftshift(IM_modified)));

% display the initial image
figure;
subplot(1, 3, 1);
gris = ([0:255]/255)' * [1 1 1];
image(im);
title('Image');
colormap(gris);
axis off;
axis square;
% filtered spectra
subplot(1, 3, 2);
image(logIM_n);
title('Filtre');
colormap(gris);
axis off;
axis square;
% and the filtered image
subplot(1, 3, 3);
image(im_modified);
title('Image traitee', K);
colormap(gris);
axis off;
axis square;

function val = H(K, u, v)
    val = exp(-K * (u*u + v*v));
end