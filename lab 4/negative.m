function [neg_img] = negative(image)
    [n, m, d] = size(image);
    neg_img = zeros(n, m);

    for i = 1 : n
        for j = 1 : m
            if d == 3
                for l = 1 : 3
                    neg_img(i, j, l) = 255 - image(i, j, l) - 1; 
                end
            else
                neg_img(i, j) = 255 - image(i, j) - 1;
            end
        end
    end
    neg_img = uint8(neg_img);
end