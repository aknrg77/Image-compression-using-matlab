function [ rgb_img ] = decompress( comp_img )
[x,y] = size(comp_img);
rgb_img = zeros(x,y,3);
comp_img = double(comp_img);
for r = 1:x
    for c = 1:y
        p = mod(c-1,3)+ 1 + mod(r-1,3);
        if(p > 3)
            p = p - 3;
        end
        rgb_img(r,c,p) = comp_img(r,c);
        p_dr = p + 1;
        p_ul = p - 1;
        if(p_dr > 3)
            p_dr = 1;
        end
        if(p_ul < 1)
            p_ul = 3;
        end
        color_ul = 0;
        color_dr = 0;
        n_ul = 0;
        n_dr = 0;
        % If not on the top row
        if(r > 1)
            color_ul = color_ul + comp_img(r-1,c);
            n_ul = n_ul + 1;
        end
        % If not on the bottom row
        if(r < x)
            color_dr = color_dr + comp_img(r+1,c); 
            n_dr = n_dr + 1;
        end
        % If not on the left row
        if(c > 1)
            color_ul = color_ul + comp_img(r,c-1);
            n_ul = n_ul + 1;
        end
        % If not on the right row
        if(c < y)
            color_dr = color_dr + comp_img(r,c+1); 
            n_dr = n_dr + 1;
        end
        rgb_img(r,c,p_dr) = color_dr/n_dr;
        rgb_img(r,c,p_ul) = color_ul/n_ul;
    end
end
rgb_img(1,1,3) = (rgb_img(1,2,3)+rgb_img(2,1,3))/2;
rgb_img(end,end,1) = (rgb_img(end,end-1,1)+rgb_img(end-1,end,1))/2;
rgb_img = uint8(rgb_img);
end

