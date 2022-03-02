clc;
clear all;
close all;
load('KNNmodel');
augmented_dataset_loc = 'D:\PROJECTS\dtmf_detect_project\augmented_dataset\';
ads0 = audioDatastore('D:\PROJECTS\dtmf_detect_project\dataset\','IncludeSubfolders',true,'LabelSource','foldernames');
ads = audioDatastore(augmented_dataset_loc);
ads.Labels = repelem(ads0.Labels,10,1);% USE for augmented dataset
ads = shuffle(ads);
[ads_train,ads_test] = splitEachLabel(ads,0.8);
for i = 1:length(ads_test.Files)
    [dataTrain, infoTrain] = read(ads_test);
    featuresTest{i} = HelperComputeGoertzelFreq(dataTrain,infoTrain);
    disp(i/length(ads_test.Files)*100);
end
figure
featuresTest = vertcat(featuresTest{:});
result = HelperTestKNNClassifier(trainedClassifier,featuresTest);
disp('done result');
cm1 = confusionchart(result.Actual,result.Predicted,'title','Test Accuracy for KNN Model using Goertzel features with secondary harmonics (with augmented dataset)');
cm1.Normalization = 'absolute';
cm1.ColumnSummary = 'column-normalized';
cm1.RowSummary = 'row-normalized';