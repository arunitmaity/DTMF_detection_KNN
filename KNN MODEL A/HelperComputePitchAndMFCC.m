function t = HelperComputePitchAndMFCC(data, info)
fs = 8000;
[pitch1, mfcc1] = computePitchMFCC(data,fs);
s = struct();
s.Pitch = pitch1;
s.MFCC1 = mfcc1(:,1);
s.MFCC2 = mfcc1(:,2);
s.MFCC3 = mfcc1(:,3);
s.MFCC4 = mfcc1(:,4);
s.MFCC5 = mfcc1(:,5);
s.MFCC6 = mfcc1(:,6);
s.MFCC7 = mfcc1(:,7);
s.MFCC8 = mfcc1(:,8);
s.MFCC9 = mfcc1(:,9);
s.MFCC10 = mfcc1(:,10);
s.MFCC11 = mfcc1(:,11);
s.MFCC12 = mfcc1(:,12);
s.MFCC13 = mfcc1(:,13);
s.Label = repmat({char(info.Label)},size(pitch1));
t = struct2table(s);
end
function [pitch1, mfcc1] = computePitchMFCC(x,fs)
% Audio data will be divided into frames of 30 ms with 75% overlap
frameTime = 30e-3;
samplesPerFrame = floor(frameTime*fs);
increment = floor(0.25*samplesPerFrame);
overlapLength = samplesPerFrame - increment;
[pitch1,~] = pitch(x,fs, ...
    'WindowLength',samplesPerFrame, ...
    'OverlapLength',overlapLength);
mfcc1 = mfcc(x,fs,'WindowLength',samplesPerFrame, ...
    'OverlapLength',overlapLength, 'LogEnergy', 'Replace');
end