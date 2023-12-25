function [padded_img] = padding(img , top, bottom, left, right, value)
    [h, w, l] = size(img);

        newRow = h + top + bottom;
        newCol = w + left + right;
    
        padded_img = ones(newRow, newCol) * value;

        for i = 1 : h
            for j = 1 : w
                for k = 1 : l
                    padded_img(i + top, j + left, k) = img(i, j, k);
                end
            end
        end
end