function [output_img] = ideal_f(img, d0, h_or_l)
f1 = fft2(img);
% Real=real(f1);
% Imag=imag(f1);
f2 = fftshift(f1);
[h, w, l] = size(img);
f = zeros(h, w);
for i = 1 : h
    for j = 1 : w
        for k = 1 : l
            D = sqrt((i - (h / 2))^2 + (j - (w / 2))^2);
            if(h_or_l == 'l')
                if(D <= d0)
                    f(i, j, k) = 1;
                else
                    f(i, j, k) = 0;
                end
            end
            if(h_or_l == 'h')
                if(D <= d0)
                    f(i, j, k) = 0;
                else
                    f(i, j, k) = 1;
                end
            end
        end
    end
end
% filter=(Real.*f)+(Imag.*f);
filter = f2.*f;
f3 = ifftshift(filter);
f4 = ifft2(f3);
output_img = abs(f4);
output_img = mat2gray(output_img);
end