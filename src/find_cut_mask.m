function [ mask ] = find_cut_mask(template, patch, overlap)
    t_size = size(template, 1);
    mask = zeros(t_size);
    mask_up = zeros(overlap, t_size);
    mask_left = zeros(t_size, overlap);
    is_up = nnz(template(1 : overlap, ceil(t_size / 2), 1) >= 0);
    is_left = nnz(template(ceil(t_size / 2), 1 : overlap, 1) >= 0);
    if is_up > 0
        err_patch = find_err_patch(template, patch, overlap);
        mask_up = cut_dp(err_patch);
    end
    if is_left > 0
        err_patch = find_err_patch(permute(template, [2 1 3]), permute(patch, [2 1 3]), overlap);
        mask_left = cut_dp(err_patch)';
    end
    mask(1 : overlap, :) = mask(1 : overlap, :) | mask_up;
    mask(:, 1 : overlap) = mask(:, 1 : overlap) | mask_left;
    mask;

end



