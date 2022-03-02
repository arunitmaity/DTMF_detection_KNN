clc;
clear all;
close all;
load('workspace_variables_features');
ads_test = shuffle(ads_test);
%KNN CLASSIFIER TRAINING
predictorNames = features.Properties.VariableNames;
predictors     = features(:, predictorNames(1:14));
response       = features.Label;

trainedClassifier = fitcknn(predictors,response,'NumNeighbors',9,'Distance','minkowski', ... 
    'DistanceWeight','inverse','Standardize',true);
% % Cross-Validation
k = 5;
group = response;
c = cvpartition(group,'KFold',k); % 5-fold stratified cross validation
partitionedModel = crossval(trainedClassifier,'CVPartition',c);
validationAccuracy = 1 - kfoldLoss(partitionedModel)
fprintf('\nValidation accuracy = %.2f%%\n', validationAccuracy*100);

% % Visualise Confusion Chart
validationPredictions = kfoldPredict(partitionedModel);
figure
cm = confusionchart(features.Label,validationPredictions,'title','Validation Accuracy for KNN Model using MFCC features (without Data Augmentation)');
cm.Normalization = 'absolute';
cm.RowSummary = 'row-normalized';
cm.ColumnSummary = 'column-normalized';
for i = 1:length(ads_test.Files)
    [dataTrain, infoTrain] = read(ads_test);
    featuresTest{i} = HelperComputePitchAndMFCC(dataTrain,infoTrain);
end
figure
featuresTest = vertcat(featuresTest{:});
result = HelperTestKNNClassifier(trainedClassifier,featuresTest);
cm1 = confusionchart(result.Actual,result.Predicted,'title','Test Accuracy for KNN Model using MFCC features (without Data Augmentation)');
cm1.Normalization = 'absolute';
cm1.ColumnSummary = 'column-normalized';
cm1.RowSummary = 'row-normalized';
save('KNNmodel','trainedClassifier');