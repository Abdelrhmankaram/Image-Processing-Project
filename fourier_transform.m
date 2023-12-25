function [fm] = fourier_transform(image)
    fi = fft2(image);
    fshift = fftshift(fi);
    fabs = abs(fshift);
    flog = log(fabs+1);
    fm = mat2gray(flog);
end
