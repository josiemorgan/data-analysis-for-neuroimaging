%% make a figure with 3 panels (from FSL data)

%% some things to think about:
    % 1) the script lives in a particular place, where are you going to
    %    save it
    % 2) data? where are they?
    % 3) load nifti images?
    % 4) what is the function to make a histogram?
    % 5) read in text files to get data points - what functions do you need
    %    to load in text
    
%% 
% 1) where to keep code 
    % keep it with the rest of the dafni code 
    
% 2) where to store data 

datadir = '~/Data/subject-C/subjectC.feat';

addpath(genpath('~/Data/subject-C'))

%%
% change directory to data directory 
currentworkingdirectory = pwd();
cd (datadir)

%%

fig = figure();
% make panel A- slice of the anatomy file
    % hint - returnSlice , reg (look in folder), imagesc
    
subplot(2,2,1)

%%
anatomy = niftiread('rendered_thresh_zstat1.nii');
size(anatomy)

%% use return slice to get one slice out 

% changes the colourmap and the orientation

s= returnSlice(anatomy, 60, 1);
imagesc(s)
colormap(gray())
axis('off')
view(-90,90)
axis('image')
load('renderMap.txt')
colormap(renderMap)
colorbar

title('(A) Example activated Image')

%%

% panel B - histogram
    % hint- if data is 3d array - data(:)

subplot(2,2,2)

% omly show non-zero voxels in the histogram
idx=(anatomy > 0);
robustRange = prctile(anatomy(idx), [1 99]);
histogram(anatomy, 'BinLimits', robustRange, 'NumBins', 35, 'FaceColor', 'b', 'EdgeColor', 'w')


title('(B) Histogram of intensities')
xlabel('Intensity')
ylabel('Count')

%%

% panel C - timecourse plot
    % hint- folder tsplot, load
    % tsplot_zstat1.txt - info from the best voxel highest zstat value

subplot(2,2,[3,4])

ts= load('tsplot_zstat1.txt')
plot (ts(:,[1,2]))
legend('data (highest Z)','Partial Model')
title('(C) General Linear Model fit')
xlabel('Time (Volumes)') 
ylabel('fMRI response (image intensity')

%%
    
% return back to where my script is 
cd(currentworkingdirectory)

% change the dimensions of the pdf when the figure is produced

fig.PaperSize =[15 10];
fig.PaperUnits = 'centimeters';
fig.PaperPosition = [0 0 15 10];
