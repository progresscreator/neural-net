% David House
% CS 440 Aritifical Intelligence
% Neural Networks - Project 2
% makeVectors.m

function output = makeVectors(inputLabels)

output = zeros(10, length(inputLabels));
for x = 1:length(inputLabels)
    output(inputLabels(x) + 1, x) = 1;
end