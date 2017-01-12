function [ ssd_map ] = ssd_patch_2d( I, T )
    mask = T >= 0; % -1 represents empty
    ssd_map = filter2(mask, I .* I, 'valid') + sum(sum(T .* T)) - 2 * filter2(mask .* T, I, 'valid');


end

