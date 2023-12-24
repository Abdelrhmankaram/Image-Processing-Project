function [after] = weighted_filter(img)
mask =[
    1, 2, 1;
    2, 4, 2;
    1, 2, 1
    ] / 16;
  [H, W, L] = size(img);
    [X, Y] = size(mask);
    
    after = double(zeros(H, W, L));
    
    img = double(padding(img, 1, 1, 1, 1, 0));

    mask = double(mask);
    div = 0;
    
    for i = 1 : X
        for j = 1 : Y
           div = div + mask(i, j); 
        end
    end

    for i = 1 : X
        for j = 1 : Y
            mask(i, j) = mask(i, j) / div;
        end
    end
 
    for i = 2 : H 
        for j = 2 : W       
            for k = 1 : L
                sum = double(0);
                ind = 1;
                for x = i - 1 : i + X - 2
                    idx = 1;
                    for y = j - 1 : j + Y - 2
                        sum = sum + (mask(ind, idx) * img(x, y, k));
                        idx = idx + 1;
                    end
                    ind = ind + 1;
                end

                after(i - 1, j - 1, k) = sum;
            end
        end
    end
    after = uint8(after);
end

