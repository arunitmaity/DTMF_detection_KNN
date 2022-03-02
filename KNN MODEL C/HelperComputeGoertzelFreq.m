function t = HelperComputeGoertzelFreq(data, info)
Fs = info.SampleRate;
f = [697 770 852 941 1209 1336 1477 1633];
N = length(data);
freq_indices = round(f/Fs*N) + 1;
dft_data = abs(goertzel(data,freq_indices));
dft_data = dft_data./max(dft_data); %normalize values
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
s.Label = info.Label;
t = struct2table(s);
end