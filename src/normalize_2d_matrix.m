function [ norm_m ] = normalize_2d_matrix( m )
    norm_m = (m - min(min(m))) / (max(max((m)) - min(min(m))));
end

