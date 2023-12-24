function [new_image] =Point_Detection(img)
[w,h,l]=size(img);
img=im2double(img);
new_image=zeros(w-1,h-1);
mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
sum=0;
aa=zeros(1:3);
    for i=2:w-1
       for j=2:h-1
           for k=1:l
           for w=1:3
               for s=1:3
                  aa(w,s) = img((i-2)+w,(j-2+s),k)*mask(w,s);
                  sum=sum+aa(w,s);
               end
           end
           new_image(i-1,j-1,k)=sum;
           sum=0;
           end
       end
    end
end
