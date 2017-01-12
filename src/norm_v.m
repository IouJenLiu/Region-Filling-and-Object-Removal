function [ norm_vec ] = norm_v( target_mask, y, x )
    window = target_mask(y - 1 : y + 1, x - 1 : x + 1);
    center_value = window(2, 2);
    window(window == 0) = center_value;
    fx = window(2, 3) - window(2, 1);
    fy = window(3, 2) - window(1, 2);
    if fx == 0 && fy == 0
        norm_vec = [1; 1] / norm([1; 1]); 
    else
        norm_vec = [fx; fy] / norm([fx; fy]);
    end

end

