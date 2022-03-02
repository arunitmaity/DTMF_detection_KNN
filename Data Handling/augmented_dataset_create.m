clc
clear all
close all
data_loc = 'C:\Users\maity\Desktop\DTMF Paper Software Code\Software Code\dataset\';
ads = audioDatastore(data_loc,'IncludeSubfolders',true,'LabelSource','foldernames');
augmented_dataset_loc = 'C:\Users\maity\Desktop\DTMF Paper Software Code\Software Code\augmented_dataset\';
aug = audioDataAugmenter('NumAugmentations',15,'TimeStretchProbability',0.95,'TimeShiftProbability',0.95 ...
    ,'PitchShiftProbability',0.03,'AugmentationParameterSource','random','AddNoiseProbability',0.95,'SNRRange',[15,25], ...
    'VolumeControlProbability',0.95);

while hasdata(ads)
    [audioIn,info] = read(ads);
    data = augment(aug,audioIn,info.SampleRate);
    [~,fn] = fileparts(info.FileName);
    for i = 1:size(data,1)
        augmentedAudio = data.Audio{i};
        % If augmentation caused an audio signal to have values outside of -1 and 1, 
        % normalize the audio signal to avoid clipping when writing.
        if max(abs(augmentedAudio),[],'all')>1
            augmentedAudio = augmentedAudio/max(abs(augmentedAudio),[],'all');
        end  
        audiowrite(append(augmented_dataset_loc,'\',sprintf('%s_%d.wav',fn,i)),augmentedAudio,info.SampleRate)
    end
end
disp('Done Augmenting Data');