clc;
clear all;
close all;
%DATA PREPARATION
finaldataset_loc = 'D:\PROJECTS\dtmf_detect_project\dataset\';
ads = audioDatastore(finaldataset_loc,'IncludeSubfolders',true,'LabelSource','foldernames');
ads=shuffle(ads);
[ads_train,ads_test] = splitEachLabel(ads,0.8);
%FEATURE EXTRACTION
ads_train = shuffle(ads_train);
len_ads_train = length(ads_train.Files);
features = cell(len_ads_train,1);
for i = 1:len_ads_train
    [dataTrain, infoTrain] = read(ads_train);    
    features{i} = HelperComputePitchAndMFCC(dataTrain,infoTrain);
    disp(i/len_ads_train*100);
end
features = vertcat(features{:});
save('workspace_variables_features','features','ads_test');