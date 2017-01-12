function [ err_patch ] = find_err_patch( T, patch, overlap)
    err_patch_r = find_err_patch_2D( T(:, :, 1), patch(:, :, 1), overlap);
    err_patch_g = find_err_patch_2D( T(:, :, 2), patch(:, :, 2), overlap);
    err_patch_b = find_err_patch_2D( T(:, :, 3), patch(:, :, 3), overlap);
    err_patch = err_patch_r + err_patch_g + err_patch_b;
   
end

