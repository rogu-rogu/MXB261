%% ----------- MXB261 Problem Solving Task: Part 2 -----------------------]
% Kassia Lembryk-Walsh (n11090677)

%% Initialising

load('sampledata2024.mat')
bins = [10, 20, 40];
seed = int8(83);

%% Visualising histograms
% v) ----------------------------------------------------------------]

N10 = sample_from_dist(Data0, bins(1), seed);
N20 = sample_from_dist(Data0, bins(2), seed);
N40 = sample_from_dist(Data0, bins(3), seed); 
N40.Children(3).YLim = N40.Children(2).YLim; % Matching the y-limits for a better display
% saveas(N10, 'Figure_5.png')
% saveas(N20, 'Figure_6.png')
% saveas(N40, 'Figure_7.png')
% Once again, saveas does not seem to work well with sgtitle. :/