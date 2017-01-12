function [patch] = choose_sample( ssd_map, tol, I, patch_size, small_cost_value)
    min_c = min(min(ssd_map));
    min_c = max(min_c,small_cost_value);
    [y, x] = find(ssd_map <= min_c * (1 + tol));
    index = randi(size(y, 1));
    hp_size = floor(patch_size / 2);
    y = y(index) + hp_size; % transfrom to I coordinate
    x = x(index) + hp_size;
    patch = I((y - hp_size) : (y + hp_size), (x - hp_size) : (x + hp_size), :);
end

