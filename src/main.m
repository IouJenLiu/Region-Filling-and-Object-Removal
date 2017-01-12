close all; % closes all figures
clear;

im = im2single(imread('../samples/river.jpg'));
%im = im2single(imread('../samples/water_small.jpg'));
patch_size = 21;
figure(3), hold off, imagesc(im)
[x, y] = ginput;                                                              
target_mask = poly2mask(x, y, size(im, 1), size(im, 2)); 
hole_filling_crimnisi(im, target_mask, patch_size, 0.01, 'river');