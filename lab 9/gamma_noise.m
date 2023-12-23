function [new_img] = gamma_noise(img,a,b)
[h w l]=size(img);
for i = 1:255
    num_of_pixels=round((((a.^b)*(i.^(b-1)))/(factorial(b-1)))*exp(-a*i)*h*w);
    for j = 1 :num_of_pixels
        row=ceil(rand(1,1)*h);
        coloumn=ceil(rand(1,1)*w);
        img(row,coloumn)=img(row,coloumn)+i;
    end
end
for k=1:l
    mn=min(min(img(:,:,k)));
    mx=max(max(img(:,:,k)));
    new_img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
end
new_img=uint8(new_img);
end