function [ front_x, front_y ] = fill_front( target_mask )
    front = imdilate(target_mask, ones(3,3)) & ~target_mask;
    [front_y, front_x] = find(front);

    


end

