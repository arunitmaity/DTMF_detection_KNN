function t = HelperComputeGoertzelFreq(data, info)
Fs = info.SampleRate;
f = [697 770 852 941 1209 1336 1477 1633 1394 1540 1704 1882 2418 2672 2894 3266];
N = length(data);
freq_indices = round(f/Fs*N) + 1;
dft_data = abs(goertzel(data,freq_indices));
% dft_data = dft_data./max(dft_data); %normalize values
% Output structure
s = struct();
s.Freq_697 = dft_data(1);
s.Freq_770 = dft_data(2);
s.Freq_852 = dft_data(3);
s.Freq_941 = dft_data(4);
s.Freq_1209 = dft_data(5);
s.Freq_1336 = dft_data(6);
s.Freq_1477 = dft_data(7);
s.Freq_1633 = dft_data(8);
s.Freq_1394 = dft_data(9);
s.Freq_1540 = dft_data(10);
s.Freq_1704 = dft_data(11);
s.Freq_1882 = dft_data(12);
s.Freq_2418 = dft_data(13);
s.Freq_2672 = dft_data(14);
s.Freq_2894 = dft_data(15);
s.Freq_3266 = dft_data(16);
s.Label = info.Label;
t = struct2table(s);
end