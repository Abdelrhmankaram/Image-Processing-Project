function new_image = point_detection(img)
    [w, h, l] = size(img);
    img = im2double(img);
    new_image = zeros(w - 1, h - 1, l);
    mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    for i = 2 : w - 1
        for j = 2 : h - 1
            for k = 1 : l
                aa = zeros(3, 3);
                sum = 0;
                for x = -1 : 1
                    for y = -1 : 1
                        aa(x + 2, y + 2) = img(i + x, j + y, k) * mask(x + 2, y + 2);
                        sum = sum + aa(x + 2, y + 2);
                    end
                end
                new_image(i - 1, j - 1, k) = sum;
            end
        end
    end
end
