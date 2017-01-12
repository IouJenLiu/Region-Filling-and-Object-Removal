function [ template, y, x, conf] = choose_template_criminisi(I, t_candi_y, t_candi_x, target_mask, confidence_map,  patch_size)
   
    data = zeros(size(t_candi_y));
    confidence = zeros(size(t_candi_y));
    hp_size = floor(patch_size / 2);
    
    
    for i = 1 : size(t_candi_y, 1)
        yy = t_candi_y(i); xx = t_candi_x(i);
        if xx == 121 && yy == 253
            xx;
        end
        norm_vec = norm_v(target_mask, yy, xx);
        iso_v = isophote(I(:, :, 1), yy, xx);
        confidence(i) = point_fil(confidence_map, ones(size(patch_size)), patch_size, yy, xx) / (patch_size^2);
        data(i) = abs(dot(iso_v, norm_vec(:, 1)));
    end
    priority = confidence + data;
    [priority, sorted_id] = sort(priority, 'descend');
    t_candi_y = t_candi_y(sorted_id);
    t_candi_x = t_candi_x(sorted_id);
    confidence = confidence(sorted_id);
    data = data(sorted_id);
    y = t_candi_y(1); x = t_candi_x(1);
    conf = confidence(1);
    template = I(y - hp_size : y + hp_size, x - hp_size : x + hp_size, : );


end

