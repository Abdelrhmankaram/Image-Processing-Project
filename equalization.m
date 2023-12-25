function [after] = equalization(before)
 
    [h, w, l] = size(before);
    
    freq = zeros(256, 1);   freq = double(freq);
    after = zeros(h, w, l); after = double(after);

    for i = 1 : h
        for j = 1 : w
            if l == 3
                for k = 1 : l
                    freq(before(i, j, k) + 1) = freq(before(i, j, k) + 1) + 1;
                end
            else
                freq(before(i, j) + 1) = freq(before(i, j) + 1) + 1;
            end
        end
    end
    
    for i = 1 : 256            
        freq(i) = freq(i) / (h * w * l);
    end
    
    pre_sum = freq(1);

    for i = 2 : 256
        pre_sum = pre_sum + freq(i);
        freq(i) = pre_sum;
    end
    
    c = max(max(before(:, :, 1)));
    
    for i = 1 : h
        for j = 1 : w
            if l == 3
                for k = 1 : l
                    after(i, j, k) = round(freq(before(i, j, k) + 1) * c);
                end
            else
                after(i, j) = round(freq(before(i, j) + 1) * c);
            end
        end
    end
    after = uint8(after);
     
    end