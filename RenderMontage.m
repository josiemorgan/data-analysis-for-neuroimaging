%% Make an image of rendered FSl images

% load a special colormap
load('renderMap.txt') 
% This was retrieved from FSL and made to be Matlab friendly

% load stats image
renderedImage = niftiread('rendered_thresh_zstat4.nii');

% display the image
figure
imagesc(returnSlice(renderedImage, 36, 3))
axis('image')
colormap(renderMap)
colorbar
title ('Rendered FSL image')
