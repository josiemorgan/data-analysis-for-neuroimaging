% create a timeseries plot 

% load in the text file with the first set of MNI coordinates 
y= load ('textfile2.txt')
y1 = load('textfile4.txt')
data= niftiread('filtered_func_data.nii.gz');
y2= squeeze(data(36,17,12, :));
y3= squeeze(data(37, 64, 10, :))


figure
subplot(2,1,1)
plot(y2,'b')
xlabel('Time (s)'), ylabel('fMRI image intensity')
title('MNI (37 19 17)')
hold on 
plot (y, 'r')
legend('filtered data','data')

%%
subplot(2,1,2)
plot(y3, 'b')
xlabel('Time (s)'), ylabel('fMRI image intensity')
title('MNI (43 66 9)')
hold on 
plot(y1, 'r')
legend('filtered data','data')

%
fig.PaperSize =[15 10];
fig.PaperUnits = 'centimeters';
fig.PaperPosition = [0 0 15 10];