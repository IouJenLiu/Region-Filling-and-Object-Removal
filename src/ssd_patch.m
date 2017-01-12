function [ ssd_map ] = ssd_patch(I, T)

    ssd_map_r = ssd_patch_2d(I(:, :, 1), T(:, :, 1));
    ssd_map_g = ssd_patch_2d(I(:, :, 2), T(:, :, 2));
    ssd_map_b = ssd_patch_2d(I(:, :, 3), T(:, :, 3));
    ssd_map = ssd_map_r + ssd_map_g + ssd_map_b;
    
    ssd_map = normalize_2d_matrix(ssd_map);
    
    

end

