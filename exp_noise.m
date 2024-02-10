function new_img = exp_noise(img, a)
    img = double(img);
    [h, w, ~] = size(img);

    for i = 1:255
        num_of_pixel = round((a * exp((-1 * a * i))) * w * h);
        for j = 1:num_of_pixel
            row = ceil(rand(1, 1) * h);
            colum = ceil(rand(1, 1) * w);
            img(row, colum) = img(row, colum) + i;
        end
    end

    for k = 1:size(img, 3)
        mn = min(img(:, :, k), [], 'all');
        mx = max(img(:, :, k), [], 'all');
        new_img(:, :, k) = ((img(:, :, k) - mn) / (mx - mn)) * 255;
    end
    new_img = uint8(new_img);
end