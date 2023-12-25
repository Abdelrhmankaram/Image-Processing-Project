function [after] = laplacian_filter(img)
    mask = [0,-1,0;-1,4,-1;0,-1,0];
    [H, W, L] = size(img);
    [X, Y] = size(mask);
    
    after = double(zeros(H, W, L));
    
    img = double(padding(img, 1, 1, 1, 1, 0));
    mask = double(mask);
    
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

