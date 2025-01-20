% DOESN"T WORK FOR NOW

K = 0.001;

% reference image
[ref, m1] = imread('images/texte_ref.png');
ref = double(ref);
REF = fftshift(fft2(ref));

% determine the P_I first
P_I = abs(REF) .* abs(REF);  % power spertre

% determine P_B
d_r = h(ref, K);
D_R = H(REF, K);
d_q = ifft2(fftshift(D_R));
bruit = d_q - d_r;
P_B = fftshift(fft2(bruit));
P_B = abs(P_B) .* abs(P_B);

% try to restore the image in a simple way
[im, m2] = imread('images/texte_flou.png');
im = double(im);

% TODO: find bug here
IM_1 = H(im, K);
%IM_1 = IM_1 ./ H(im, K);
%im_1 = real(fftshift(fft2(IM_1)));

figure;
subplot(1, 3, 1);
gris = ([0:255]/255)' * [1 1 1];
image(im);
colormap(gris);
axis off;
subplot(1, 3, 2);
image(IM_1);
colormap(gris);
axis off;


function val = tr(K, u, v)
    val = exp(-K * (u*u + v*v));
end

function IM_mod = H(IM, K)
    l = size(IM, 1);
    h = size(IM, 2);
    IM_mod = zeros(size(IM));
    
    for x = 1:l
        for y = 1:h
            filter_value = tr(K, x - l/2 - 1, y - h/2 - 1);
            IM_mod(x, y) = IM(x, y) * filter_value;
        end
    end
end

function im_mod = h(im, K)
    IM = fftshift(fft2(im));
    IM_mod = H(IM, K);
    im_mod = real(ifft2(fftshift(IM_mod)));
end

function IM_mod = W(IM, K, P_B, P_I)
    H_tensor = H(IM, K);
    H_tensor_2 = abs(H_tensor) .* abs(H_tensor);
    IM_mod  = (1 ./ H_tensor) .* (H_tensor_2)./ (H_tensor_2 + (P_B ./ P_I));
end



