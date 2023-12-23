function [new_img] = noise_gaussian(img,v,m)
img=double(img);
[h w l]=size(img);
for i=1:255
    num_of_pixel=round((exp(-1*(((i-m)^2/(2*v*v)))/(sqrt(2*3.14*v*v)))*w*h));
    for x=1:num_of_pixel
        row=ceil(rand(1,1)*h);
        column=ceil(rand(1,1)*w);
        img(row,column)= img(row,column)+i;
    end
end
for k=1:1
    mn=min(min(img(:,:,k)));
    mx=max(max(img(:,:,k)));
    new_img(:,:,k)=((img(:,:,k)-mn)/(mx-mn))*255;
end    
new_img=uint8(new_img);
end