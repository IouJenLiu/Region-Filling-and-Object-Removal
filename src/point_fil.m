function [ value ] = point_fil( I, h, patch_size, y, x )
hp_size = floor(patch_size / 2);
value = sum(sum(I(y - hp_size : y + hp_size, x - hp_size : x + hp_size) .*  h));

end

