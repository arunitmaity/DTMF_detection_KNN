clc
close all
clearvars
loc = 'D:\PROJECTS\dsp_project_files\targetdataset\941+1477_1969_42.wav';
[y,Fs] = audioread(loc);
data = y;
f = [697 770 852 941 1209 1336 1477 1633];
f1= [1394 1540 1704 1882 2418 2672 2894 3266];
N = length(data);
freq_indices = round(f/Fs*N) + 1;
dft_data = abs(goertzel(data,freq_indices));
subplot(2,1,1)
stem(f,dft_data);
ax = gca;
ax.XTick = f;
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Goertzel-DFT for First Harmonics')
% 
subplot(2,1,2)
freq_indices1 = round(f1/Fs*N) + 1;
dft_data1 = abs(goertzel(data,freq_indices1));
stem(f1,dft_data1);
ax1 = gca;
ax1.XTick = f1;
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title('Goertzel-DFT for Second Harmonics')