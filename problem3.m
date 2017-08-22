% David House
% CS 440 Aritifical Intelligence
% Neural Networks - Project 2
% problem3.m

load data.mat

%% Define Training & Test Vectors
vectors_TEST                = makeVectors([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
sLabelVectors_TRAIN 		= makeVectors(train_samples_labels);
sLabelVectors_TEST  		= makeVectors(test_samples_labels);
sVectors_TRAIN              = transpose(train_samples);
sVectors_TEST               = transpose(test_samples);

%% Define Network
nn_hidden_layers = [250, 128, 64, 32, 10];
nn = newpr(sVectors_TRAIN, sLabelVectors_TRAIN, nn_hidden_layers,{'tansig', 'tansig', 'tansig', 'tansig', 'tansig'},'traingdx');

%% Change Default Parameters
nn.trainParam.epochs = 350;
nn.trainParam.goal = 1e-4;
nn.trainParam.lr = 0.05;
nn.trainParam.show = 60;

%% Train Network on Sample
[nn,tr] = train(nn, sVectors_TRAIN, sLabelVectors_TRAIN);

%% Test Network on Sample
o = sim(nn, sVectors_TEST);

[cl, confusion_matrix, ind, per] = confusion(sLabelVectors_TEST, o);

%% Print NN Details
fprintf('\nNN Accuracy: %6.2f%%\n', 100*(1-cl));
fprintf('Confusion Marix:\n');
confusion_matrix

%% Print Notification
fprintf('\nInput vectors have been changed.\n');
fprintf('Now re-training and re-testing Neural Network.\n');

%% Zero-out temporary training vectors
[featureNum, vectorNum] = size(sVectors_TRAIN);
sVectors_TRAIN2 = zeros(featureNum/2, vectorNum);

%% Copy Sample Training Vector into Temp Training Vector
for x = 1:vectorNum
    for y = 1:(featureNum/2)
        sVectors_TRAIN2(y, x) = (sVectors_TRAIN((2*y)-1, x) + sVectors_TRAIN(2*y, x)) / 2;
    end
end

%% Zero-out temporary test vectors
[featureNum, vectorNum] = size(sVectors_TEST);
sVectors_TEST2 = zeros(featureNum/2, vectorNum);

%% Copy Sample Test Vectors into Temp Test Vectors
for x = 1:vectorNum
    for y = 1:(featureNum/2)
        sVectors_TEST2(y, x) = (sVectors_TEST((2*y)-1, x) + sVectors_TEST(2*y, x)) / 2;
    end
end

%% Define Network
nn = newpr(sVectors_TRAIN, sLabelVectors_TRAIN, nn_hidden_layers,{'tansig', 'tansig', 'tansig', 'tansig', 'tansig'},'traingdx');

%% Change Default Parameters
nn.trainParam.epochs = 350;
nn.trainParam.goal = 1e-4;
nn.trainParam.lr = 0.05;
nn.trainParam.show = 60;

%% Train Network on Sample
[nn,tr] = train(nn, sVectors_TRAIN, sLabelVectors_TRAIN);

%% Test Network on Sample
o = sim(nn, sVectors_TEST);

[cl, confusion_matrix, ind, per] = confusion(sLabelVectors_TEST, o);

%% Print Network Details
fprintf('\nNN Accuracy: %6.2f%%\n', 100*(1-cl));
fprintf('Confusion Marix:\n');
confusion_matrix
