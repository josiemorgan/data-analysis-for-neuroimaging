function makeMontage(fname, nDisplay)
% makeMontage - make a montage from data in file

% specify a filename
% specifiy nDisplay - how many slices to display from start to end

% makeMontage('~/data/subject-C/mprage.nii.gz',20)


% 1) load image 
fname = '~/Data/subject-C/hr/rendered_thresh_zstat4.nii';

data= niftiread(fname);
montage(data);
load('renderMap.txt') % load render map for colourmap which was extracted 
                      % from FSL and made matlab friendly 

% 2) robustRange

robustRange= prctile(data(:), [5,95])

% 3) figure out indices

nSlices = size(data,3);

idx= round(linspace(1,nSlices, nDisplay) )

% 4) permute step

dataP= permute(data, [2, 1, 3]);

% 5) make montage with matlab command

montage(dataP, 'Indices', idx, 'DisplayRange', robustRange)

% 6) change the colourmap, axis and the title
axis('image')
colormap(renderMap)
colorbar
title ('Rendered FSL image')


