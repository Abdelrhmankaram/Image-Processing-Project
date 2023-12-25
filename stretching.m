function [new_img] = stretching(img)
    mn = [255, 255, 255];
    mx = [0, 0, 0];
    [n, m, d] = size(img);
    new_img = zeros(n,m);
    for i = 1 : n
        for j = 1 : m
            if d == 3
                for l = 1 : d
                    if(mn(l) > img(i, j, l))
                        mn(l) = img(i,j, l);
                    end
                    if(mx(l) < img(i, j, l))
                        mx(l) = img(i, j, l);
                    end
                end
            else
                if(mn(1) > img(i, j))
                    mn(1) = img(i, j);
                end
                if(mx(1) < img(i, j))
                    mx(1) = img(i, j);
                end
            end
        end
    end
    new_mn = 0;
    new_mx = 255;
    mul = [ (new_mx - new_mn) / (mx(1) - mn(1))
            (new_mx - new_mn) / (mx(2) - mn(2))
            (new_mx - new_mn) / (mx(3) - mn(3))
          ];
    for i = 1 : n 
        for j = 1 : m
            if d == 3
                for l =1 : 3
                    new_img(i,j,l) = ((img(i,j,l) - mn(1)) * mul(1)) - new_mn;
                end 
            else
                new_img(i,j,1) = ((img(i,j,1) - mn(1)) * mul(1)) - new_mn;
            end
        end
    end
    new_img = uint8(new_img);
end