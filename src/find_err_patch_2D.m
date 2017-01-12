function [ err_patch ] = find_err_patch_2D( T, patch, overlap)
    diff = T(1 : overlap, :) - patch(1 : overlap, :);
    err_patch = diff .* diff;


end

