function makeMontage(fname, nDisplay)
% makeMontage - make a montage from data in file

% specify a filename
% specifiy nDisplay - how many slices to display from start to end

% makeMontage('~/data/subject-C/mprage.nii.gz',20)


% 1) load image 

fname = '~/DataFile/subject-C/mprage.nii.gz';
data= niftiread(fname);
montage(data);

% 2) robustRange

robustRange= prctile(data(:), [5,95]);

% 3) permute step

dataP= permute (data, [2, 1, 3]);

% 4) figure out indices

nSlices = size(dataP,3);
idx= round ( linspace(1, nSlices, nDisplay) );


% 5) make montage with matlab command

montage(dataP, 'Indices', idx, 'DisplayRange', robustRange)

end 
