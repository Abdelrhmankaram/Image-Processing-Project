function [gray] = to_gray(rgb)
    
    [H, W , L] = size(rgb); % takes the size of the gray photo, H -> number of rows, W -> number of columns

     gray = rgb; % new photo, all it's pixels intialized with 0
    if L == 3
        gray = zeros(H, W);
        for i = 1 : H
            for j = 1 : W
                % get the average of the three colors
                gray(i, j) = (double(rgb(i, j, 1)) + double(rgb(i, j, 2)) + double(rgb(i, j, 3))) / 3;
            end
        end
    end
    gray = uint8(gray); % converts the photo back to int to avoid negative numbers or fractions

end