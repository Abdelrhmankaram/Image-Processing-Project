function output_image = gamma_correction(input_image, gamma)
    
    if numel(size(input_image)) == 2
        output_image = uint8(255 * (double(input_image) / 255).^ gamma);
    elseif numel(size(input_image)) == 3 && size(input_image, 3) == 3
        output_image = zeros(size(input_image));
        for i = 1:3
            output_image(:, :, i) = uint8(255 * (double(input_image(:, :, i)) / 255).^ gamma);
        end
    end
end