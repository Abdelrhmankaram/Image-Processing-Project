function [output_img] = gaussian_ff(img, d0, h_or_l)
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
                    f(i, j, k) = exp(-D^2 / ((2 * d0)^2));
                end
                
                if(h_or_l == 'h')
                    f(i, j, k) = 1 - exp(-D^2 / ((2 * d0)^2));
                end  
            end
        end    
    end
    filter = f2 .* f;
    f3 = ifftshift(filter);
    f4 = ifft2(f3);
    output_img = abs(f4);
    output_img = mat2gray(output_img);
end