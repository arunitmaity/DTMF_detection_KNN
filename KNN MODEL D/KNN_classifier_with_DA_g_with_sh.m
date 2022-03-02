clc;
clear all;
close all;
load('workspace_variables_features');
ads_test = shuffle(ads_test);
%KNN CLASSIFIER TRAINING
predictorNames = features.Properties.VariableNames;
predictors     = features(:, predictorNames(1:16));
response       = features.Label;
% rng(1)
% Mdl = fitcknn(predictors,response,'OptimizeHyperparameters','all',...
%     'HyperparameterOptimizationOptions',...
%     struct('AcquisitionFunctionName','expected-improvement-plus'))


trainedClassifier = fitcknn(predictors,response,'NumNeighbors',138,'Distance','correlation', ... 
    'DistanceWeight','squaredinverse','Standardize',false);
disp('done training');
% Cross-Validation
k = 5;
group = response;
c = cvpartition(group,'KFold',k); % 5-fold stratified cross validation
partitionedModel = crossval(trainedClassifier,'CVPartition',c);
disp('done partitioned model');
validationAccuracy = 1 - kfoldLoss(partitionedModel)
fprintf('\nValidation accuracy = %.2f%%\n', validationAccuracy*100);
% % % Visualise Confusion Chart
validationPredictions = kfoldPredict(partitionedModel);
figure
cm = confusionchart(features.Label,validationPredictions,'title','Validation Accuracy for KNN Model (trained using augmented dataset) using Goertzel features with second harmonics');
cm.Normalization = 'absolute';
cm.RowSummary = 'row-normalized';
cm.ColumnSummary = 'column-normalized';
for i = 1:length(ads_test.Files)
    [dataTrain, infoTrain] = read(ads_test);
    featuresTest{i} = HelperComputeGoertzelFreq(dataTrain,infoTrain);
    disp(i/length(ads_test.Files)*100);
end
figure
featuresTest = vertcat(featuresTest{:});
result = HelperTestKNNClassifier(trainedClassifier,featuresTest);
cm1 = confusionchart(result.Actual,result.Predicted,'title','Test Accuracy for KNN Model (trained using augmented dataset) using Goertzel features with second harmonics');
cm1.Normalization = 'absolute';
cm1.ColumnSummary = 'column-normalized';
cm1.RowSummary = 'row-normalized';
save('KNNmodel','trainedClassifier');