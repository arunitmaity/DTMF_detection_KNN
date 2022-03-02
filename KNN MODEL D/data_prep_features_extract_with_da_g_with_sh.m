clc;
clear all;
close all;
%DATA PREPARATION
augmented_dataset_loc = 'C:\Users\maity\Desktop\DTMF Paper Software Code\Software Code\augmented_dataset\';
ads0 = audioDatastore('C:\Users\maity\Desktop\DTMF Paper Software Code\Software Code\dataset\','IncludeSubfolders',true,'LabelSource','foldernames');
ads = audioDatastore(augmented_dataset_loc);
ads.Labels = repelem(ads0.Labels,15,1);% USE for augmented dataset
ads = shuffle(ads);
[ads_train,ads_test] = splitEachLabel(ads,0.8);
%FEATURE EXTRACTION
ads_train = shuffle(ads_train);
len_ads_train = length(ads_train.Files);
features = cell(len_ads_train,1);
for i = 1:len_ads_train
    [dataTrain, infoTrain] = read(ads_train);    
    features{i} = HelperComputeGoertzelFreq(dataTrain,infoTrain);
    disp(i/len_ads_train*100);
end
features = vertcat(features{:});
save('workspace_variables_features','features','ads_test');
