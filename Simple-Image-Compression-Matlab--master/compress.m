function [ comp_image ] = compress( rgb_image )
[x,y,z] = size(rgb_image);
comp_image = zeros(x,y);
for r = 1:x
    for c = 1:y
        color = mod(c-1,3)+ 1 + mod(r-1,3);
        if(color > 3)
            color = color - 3;
        end
        if(r > 600)
             one = 1;
        end
        comp_image(r,c) = rgb_image(r,c,color); 
    end
end
comp_image = uint8(comp_image);
end

