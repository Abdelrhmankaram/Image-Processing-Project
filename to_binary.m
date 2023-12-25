function [bin] = to_binary(rgb)
    
        gray = to_gray(rgb); % takes the RGB photo and converts it into a gray photo
        % using the function we implemented before
        
        [N, M] = size(gray); % takes the size of the gray photo, H -> number of rows, W -> number of columns

        bin = zeros(N, M); % new photo, all it's pixels intialized with 0

        mid_point = 128;% midpoint where the values differ

        for i = 1 : N
            for j = 1 : M
                if (gray(i, j) > mid_point)
                    bin(i, j) = 255;
                else
                    bin(i, j) = 0;
                end
            end
        end
    
    bin = uint8(bin);
end