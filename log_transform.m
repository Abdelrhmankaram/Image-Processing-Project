function output_image = log_transform(input_image, c)
    if numel(size(input_image)) == 2
        output_image = c * log(1 + double(input_image));

    elseif numel(size(input_image)) == 3 && size(input_image, 3) == 3
        output_image = zeros(size(input_image));
        
        for i = 1 : 3
            output_image(:, :, i) = c * log(1 + double(input_image(:, :, i)));
        
        end
    end

    output_image = uint8((255 / max(output_image(:))) * output_image);
end