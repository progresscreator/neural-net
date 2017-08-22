% David House
% CS 440 Aritifical Intelligence
% Neural Networks - Project 2
% problem2.m

%% Setup the Network
appcr1;

%% Setup Inputs & Error Rates
err = [0, 0.2, 0.4, 0.6, 0.8];
eight = [0;1;1;1;0;1;0;0;0;1;1;0;0;0;1;0;1;1;1;0;1;0;0;0;1;1;0;0;0;1;0;1;1;1;0];
letterDB = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
letterIndex = [find(ismember(letterDB, 'r')==1), find(ismember(letterDB, 'c')==1), find(ismember(letterDB, 'g')==1), find(ismember(letterDB, 'a')==1)];
letters = cell(4,5);

%% Add Error
for x = 1:length(err)
    for y = 1:length(letterIndex)
        letters{y, x} = alphabet(:, letterIndex(y)) + rand(35, 1) * err(x);
    end
end

%% Display Inputs
for x=1:4
    input('Strike return to display next letter', 's');
    for y=1:5
        plotchar(letters{x, y});
        input('Strike return to display next noise level', 's');
    end
end

%% Display Outputs
for x = 1:length(err)
    for y = 1:length(letterIndex)
        oloc = find(compet(compet(sim(netn, letters{y, x}))) == 1);
    	fprintf('\nInput: "%s"   Noise: %d   Output: %s\n', letterDB{letterIndex(y)}, err(x), letterDB{oloc});
    end
end

%% Display 8
plotchar(eight);
oloc = find(compet(compet(sim(netn, letters{y, x}))) == 1);
fprintf('\nInput: 8   Noise: 0   Output: %s\n', letterDB{oloc});

