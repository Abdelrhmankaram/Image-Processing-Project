function [noisy_image] = exp_noise(image,a)

[h, w, L] = size(image);

num_of_pixels= round((-log(1-rand(1, 1))/a) * w *h  );

for level=1:L
    
    for i=1:256
        for j= num_of_pixels
            row=ceil(rand(1,1)*h);
            col=ceil(rand(1,1)*w);
            image(row,col,level)= image(row,col,level) +i;
        end
    end
   
end
image = min(max(image, 0), 255);
noisy_image=uint8(image);
end