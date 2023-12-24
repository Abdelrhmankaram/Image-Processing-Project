function [filteredImage] = max_filter(inputImage, filterSize)
    [rows, cols,L] = size(inputImage);
    halfSize = floor(filterSize / 2);
    paddedImage = padarray(inputImage, [halfSize, halfSize], 'replicate');
    filteredImage = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            for k = 1 : L
            neighborhood = paddedImage(i:i+filterSize-1, j:j+filterSize-1,k);
            maxValue = max(neighborhood(:));
            filteredImage(i, j,k) = maxValue;
            end
        end
    end
    filteredImage=uint8(filteredImage);
end
