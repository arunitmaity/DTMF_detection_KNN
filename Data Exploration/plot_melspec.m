clc;
clear all;
close all;
clearvars;
dest = ["697+1209_1_20.wav","697+1336_159_7.wav","697+1477_168_41.wav","697+1633_332_29.wav","770+1209_563_49.wav",...
    "770+1336_627_39.wav","770+1477_717_30.wav","770+1633_960_49.wav","852+1209_1017_11.wav","852+1336_1215_32.wav",...
    "852+1477_1147_42.wav","852+1633_1197_6.wav","941+1209_1588_17.wav","941+1336_1643_38.wav","941+1477_1608_44.wav","941+1633_1774_35.wav"];
dest_title = strrep(dest,'_','/');
prefix = "D:\PROJECTS\dsp_project_files\targetdataset\";
for k = 1:8
    sgtitle('Melspectrogram Visual Analysis')
    [y,Fs] = audioread(prefix+dest(k));
    subplot(4,2,k);
    melSpectrogram(y,Fs);
    title("File Name: "+dest_title(k));
end
j=k;
figure;
for k = 1:8
    sgtitle('Melspectrogram Visual Analysis')
    [y,Fs] = audioread(prefix+dest(j+k));
    subplot(4,2,k);
    melSpectrogram(y,Fs);
    title("File Name: "+dest_title(k));
end

