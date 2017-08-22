% David House
% CS 440 Aritifical Intelligence
% Neural Networks - Project 2
% problem1.m

% Create Network
net=newff([-1 2; 0 5],[3,1],{'tansig','purelin'},'traingd');

% Formulate batch training input and target labeling
p = [-1 -1 2 2;0 5 0 5]; 
t = [-1 -1 1 1];

% Setup Net with P as input
net=newff(minmax(p),[3,1],{'tansig','purelin'},'traingd');

% Train Network
[net,tr]=train(net,p,t);

% Trained network can now be used to compute responses to varying inputs

% Get response to inputs in training set
o = sim(net,p);

% Change default training parameters
net.trainParam.lr = 0.05;	 %This is the learning rate.
net.trainParam.epochs = 300; %This is the maximum number of epochs to train for.
net.trainParam.goal = 1e-5;	 %This is the training goal in terms of mean squared error.
net.trainParam.show = 50;	 %This is the number of epochs between Matlabs displays of error.

% Re-train Network with new training parameters
[net,tr]=train(net,p,t);

% Get response to test inputs
p = [-1 2 -1 2; 2 2 5 5];
o1 = sim(net,p);

p = [2 0 -2 -4; 0 1 2 3];
o2 = sim(net,p);

p = [1 0;5 5];
o3 = sim(net,p);

p = [1 0;0 0];
o4 = sim(net,p);
