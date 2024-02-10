function new_img = erlang_noise(img, a, b)
    img = double(img);
    [h, w, channels] = size(img);
    a = double(a);
    b = double(b);
    
    if channels == 1 % Grayscale image
        for i = 1:255
            num_of_pixel = round((((a^b) * (i^(b-1)) * exp(-1*a*i)) / factorial(b-1)) * h * w);
            for j = 1:num_of_pixel
                row = ceil(rand(1, 1) * h);
                column = ceil(rand(1, 1) * w);
                img(row, column) = img(row, column) + i;
            end
        end

        mn = min(img(:));
        mx = max(img(:));
        new_img = ((img - mn) / (mx - mn)) * 255;
        new_img = uint8(new_img);

    elseif channels == 3 % RGB image
        new_img = zeros(h, w, channels);
        for k = 1:channels
            for i = 1:255
                num_of_pixel = round((((a^b) * (i^(b-1)) * exp(-1*a*i)) / factorial(b-1)) * h * w);
                for j = 1:num_of_pixel
                    row = ceil(rand(1, 1) * h);
                    column = ceil(rand(1, 1) * w);
                    img(row, column, k) = img(row, column, k) + i;
                end
            end

            mn = min(img(:, :, k));
            mx = max(img(:, :, k));
            new_img(:, :, k) = ((img(:, :, k) - mn) / (mx - mn)) * 255;
        end
        new_img = uint8(new_img);
    else
        error('Input image should be grayscale or RGB.');
    end
end
