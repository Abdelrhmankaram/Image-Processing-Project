function new_image = line_sharpening(img, type)
    [w, h, l] = size(img);
    img = im2double(img);
    new_image = zeros(w - 1, h - 1);
    if type == 'H' %it means horizontal sharpening
        mask = [0 1 0; 0 1 0; 0 -1 0];
    end
    if type == 'V' %it means vertical sharpening
        mask = [0 0 0; 1 1 -1; 0 0 0];
    end
    if type == "DR" %it means right diagonal sharpening
        mask=[0 0 1; 0 1 0; -1 0 0];
    end 
    if type == "DL" %it means left diagonal sharpening
        mask=[1 0 0; 0 1 0; 0 0 -1];
    end
    sum=0;
    aa=zeros(1:3);
    for i = 2 : w - 1
       for j = 2 : h - 1
            for k = 1 : l
                for w = 1 : 3
                    for s = 1 : 3
                        aa(w,s) = img((i-2)+w,(j-2+s),k)*mask(w,s);
                        sum=sum+aa(w,s);
                    end
                end
            if sum>255
               sum=255;
            end
           if sum<0
               sum=0;
           end
           new_image(i-1,j-1,k)=sum;
           sum=0;
           end
       end
    end
end
