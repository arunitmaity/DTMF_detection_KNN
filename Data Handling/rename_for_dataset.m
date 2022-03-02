clc
clear all
clearvars
lf = [697,770,852,941];
hf = [1209,1336,1477,1633];
source = "D:\PROJECTS\dsp_project_files\dtmftones\";
destination = "D:\PROJECTS\dsp_project_files\finaldataset\";
files = dir(append(source,"*.wav"));
q = 1;
for i = 1:length(files)
    for j = 1:length(lf)
        for k = 1:length(hf)
            if contains(files(i).name,int2str(lf(j)))
                if contains(files(i).name,int2str(hf(k)))
                        movefile(append(source,files(i).name),append(destination,int2str(lf(j)), ... 
                            "+",int2str(hf(k)),"\",int2str(lf(j)),"+",int2str(hf(k)),"_",int2str(q),".wav"))
                        q=q+1;
                    end
                end
            end
        end
end
