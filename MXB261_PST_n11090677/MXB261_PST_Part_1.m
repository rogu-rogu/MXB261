%% ----------- MXB261 Problem Solving Task: Part 1 -----------------------]
% Kassia Lembryk-Walsh (n11090677)
% Referencing falling and accreting particles, rather than a crowd of
% people, because that doesn't make sense :3

%% Initialising...

% Two arrays, one for all cases N = 100, one for all cases N = 200
p_N100 = zeros(2, 100, 8);
p_N200 = zeros(2, 200, 8);

for i = 1:4 % Loops over probability cases
    % SETTING PROBABILITY
    if i == 1       % case i)------------]
        s = 1/3; w = s;     e = s; %    -]
    elseif i == 2   % case ii)          -]
        s = 2/3; w = 1/6;   e = 1/6; %  -]
    elseif i == 3   % case iii)         -]
        s = 3/5; w = 3/10;  e = 1/10; % -]
    else            % case iv)          -]
        s = 3/5; w = 1/10;  e = 3/10; % -]
    end %--------------------------------]
    for j = 1:2 % Loops over starting position cases
        % SETTING STARTING POSITION
        if j == 1 % -------]
            P = 1;      % -]
        else            % -]
            P = 'rand'; % -]
        end % -------------]

        % GENERATING RESULTS
        [p_N100(:,:, 2*i - 2 + j), ~] = accretion(P, 100, s,w,e);
        [p_N200(:,:, 2*i - 2 + j), ~] = accretion(P, 200, s,w,e);
        % accretion.m was made by me
    end
end 

%% Visualising histograms

bins = 99; % 20 looks way cooler

% Fixed starting position, N = 100
P1_N100_figure = figure; 
P1_N100_title = sgtitle(P1_N100_figure,'Figure 1: Cases for P = 1 and N = 100');
P1_N100_title.FontSize = 18; P1_N100_title.FontWeight = "bold";
for i = 1:4 % Plotting case i, ii, iii and iv for P = 1 and N = 100
    subplot(2,2, i);
    histogram(p_N100(1,:, i*2 - 1), bins); % P = 1 on odd numbers
    title(sprintf('Case %d', i));
    xlabel('x position');
    ylabel('particle count');
    xlim([1 99])
end

% Fixed starting position, N = 200
P1_N200_figure = figure;
P1_N200_title = sgtitle('Figure 2: Cases for P = 1 and N = 200');
P1_N200_title.FontSize = 18; P1_N200_title.FontWeight = "bold";
for i = 1:4 % Plotting case i, ii, iii and iv for P = 1 and N = 200
    subplot(2,2, i);
    histogram(p_N200(1,:, i*2 - 1), bins); % P = 1 on odd numbers
    title(sprintf('Case %d', i));
    xlabel('x position');
    ylabel('particle count');
    xlim([1 99])
end

% Random starting position, N = 100
PR_N100_figure = figure;
PR_N100_title = sgtitle("Figure 3: Cases for P = 'rand' and N = 100");
PR_N100_title.FontSize = 18; PR_N100_title.FontWeight = "bold";
for i = 1:4 % Plotting case i, ii, iii and iv for P = 'rand' and N = 100
    subplot(2,2, i);
    histogram(p_N100(1,:, i*2), bins); % P = 'rand' on even numbers
    title(sprintf('Case %d', i));
    xlabel('x position');
    ylabel('particle count');
    xlim([1 99])
end

% Random starting position, N = 200
PR_N200_figure = figure; 
PR_N200_title = sgtitle("Figure 4: Cases for P = 'rand' and N = 200");
PR_N200_title.FontSize = 18; PR_N200_title.FontWeight = "bold";
for i = 1:4 % Plotting case i, ii, iii and iv for P = 'rand' and N = 200
    subplot(2,2, i);
    histogram(p_N200(1,:, i*2), bins); % P = 'rand' on even numbers
    title(sprintf('Case %d', i));
    xlabel('x position');
    ylabel('particle count');
    xlim([1 99])
end

% Saving figures as images
% saveas(P1_N100_figure, 'Figure_1.png')
% saveas(P1_N200_figure, 'Figure_2.png')
% saveas(PR_N100_figure, 'Figure_3.png')
% saveas(PR_N200_figure, 'Figure_4.png')
% I have so far spent about 4 hours trying to make the above code work
% correctly -- for some reason, sgtitle overlaps with the figure rather
% than existing within its own white space. Even though the saveas function
% supposedly works the same as "Save as" from figure window, doing it
% manually that way *does* save the figures correctly. So I'm doing it that
% way, because I refuse to spend another 4 hours on this.