function [ syn_im ] = hole_filling_crimnisi( I, target_mask, patch_size, tol, out_file_name )
    figure(5), imshow(I);
    I = repmat((~target_mask), 1, 1, 3) .* I;
    figure(11), imshow(I);
    out_file_name_mask = strcat('../results/', out_file_name, '_hole_mask.jpg');
    imwrite(I, out_file_name_mask);
    syn_im = I;
    syn_im(syn_im == 0) = -1;
    hp_size = floor(patch_size / 2);
    confidence_map = double(~target_mask);
    i = 1;
    while any(target_mask(:) == 1)
        [t_candi_x, t_candi_y] = fill_front(target_mask);
        [template, y, x, confidence] = choose_template_criminisi(syn_im, t_candi_y, t_candi_x, target_mask, confidence_map, patch_size);
        ssd_map = ssd_patch(syn_im, template);
        ssd_map = set_forbid_region( ssd_map, target_mask, patch_size );
        patch = choose_sample(ssd_map, tol, syn_im, patch_size, 0.0001); 
        %figure(6), imshow(patch); 
        tplt_mask = template >= 0;
        %cut_mask = imdilate((~t_mask), ones(overlap * 2 + 1, overlap * 2 + 1));
        patch = tplt_mask .* template + ~tplt_mask .* patch;
        %figure(7), imshow(patch);
        syn_im(y - hp_size : y + hp_size, x - hp_size : x + hp_size, :) = patch;
        figure(8), imshow(syn_im); 
        target_mask(y - hp_size : y + hp_size, x - hp_size : x + hp_size) = 0;
        %figure(9), imshow(target_mask);
        confidence_map(y - hp_size : y + hp_size, x - hp_size : x + hp_size) =...
            confidence_map(y - hp_size : y + hp_size, x - hp_size : x + hp_size)...
            + ((~tplt_mask(:, :, 1)) * confidence);
        i = i + 1;
    end
figure(10), imshow(syn_im);
out_file_name = strcat('../results/', out_file_name, '_hole.jpg');
imwrite(syn_im, out_file_name);

end

