function [ ssd_map ] = set_forbid_region( ssd_map, target_mask, patch_size )
    LARGE_CONST = 100;
    hp_size = floor(patch_size / 2);
    forbid_area = imdilate(target_mask, ones(patch_size, patch_size));
    ssd_map = ssd_map + (forbid_area(hp_size + 1 : size(target_mask, 1) - hp_size,...
          hp_size + 1 : size(target_mask, 2) - hp_size) * LARGE_CONST);

end

