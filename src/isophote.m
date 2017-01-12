function [ isoV ] = isophote(im, y, x)
    window = im(y - 1 : y + 1, x - 1 : x + 1);
    center_value = window(2, 2);
    window(window == -1) = center_value;
    fx = window(2, 3) - window(2, 1);
    fy = window(3, 2) - window(1, 2);
    if fx == 0 && fy == 0
       isoV = [0; 0]; 
    else
        I = sqrt(fx^2 + fy^2);
        theta = acot(fy / fx);
        [isoV_x, isoV_y] = pol2cart(theta, I); 
        isoV = [isoV_x; isoV_y];
    end
end

