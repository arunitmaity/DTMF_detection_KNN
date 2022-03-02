# Machine learning based KNN classifier: towards robust, efficient DTMF tone detection for a Noisy environment

Link to publication - https://doi.org/10.1007/s11042-021-11194-3

**NOTE:**

- The entire modelling, simulation and analysis has been done on MATLAB R2019b environment and the code is not backwards-compatible with older versions of MATLAB due to the usage of the novel functions which have been added only in this version such as &#39;audioDataAugmenter&#39; and &#39;audioDatastore&#39; which are part of the &#39;Machine Learning and Deep Learning for Audio Toolbox&#39;.
- The following instructions will be given in the same order as the proposed methodology of the project, i.e. data acquisition, data augmentation, data exploration followed by modelling of all the KNN classifier models (A, B, C, D, E and F).

**INSTRUCTIONS:**

_Data Acquisition: (All files are inside &#39;Data Handling&#39; folder)_

1. The dataset used for the KNN models A, B and C were acquired through repetitive downloading of dual-tone audio files from the website &#39;audiocheck.net&#39; using a selenium script written on python. This python script is named &#39; **autodownload\_dtmftones.py&#39;**. Upon execution, the script starts downloading all 2032 files serially in the default downloads folder of the browser.

**NOTE:** The file directory for the web - driver needs to be changed according to the file location of the user&#39;s default web browser application.

2. All files are downloaded with their filenames in accordance with the nomenclature of &#39;audiocheck.net&#39;. In order to rename the files to a more legible format, run &#39; **rename\_for\_dataset.m&#39;**. This is a MATLAB code which simply renames all files into this format 'lower_freq'+'higher_freq'_'index number'.wav. Ex. '770+1336_522.wav'

**NOTE:** The &#39;source&#39; and &#39;destination&#39; variables need to be changed to the required source (browser&#39;s download folder) and destination file path according to the user&#39;s computer. **The above codes have been executed and the files have already been downloaded, renamed and stored under the folder &#39;dataset&#39;.**

_Data Augmentation: (All files are inside &#39;Data Handling&#39; folder)_

1. The augmented dataset required for training KNN models D, E and F as well as for testing all KNN models is created through the MATLAB code named &#39; **augmented\_dataset\_create.m&#39;**.

**NOTE:** The variable &#39;data\_loc&#39; needs to be changed to the file path of the originally downloaded dataset and the variable &#39;augmented\_dataset\_loc&#39; needs to be changed to the required file path of the augmented dataset. **The above code has been executed and the augmented dataset is already stored in the folder named &#39;augmented\_dataset&#39;.**

_Data Exploration: (All files are inside &#39;Data Exploration&#39; folder)_

1. In order to plot the melspectrogram of various audio files to visually identify if MFCCs are viable features, &#39; **plot\_melspec.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;dest&#39; must be changed to the names of the audio files whose melspectrogram is required to be plotted. The value of the variable &#39;prefix&#39; needs to be changed to the file path of the dataset folder containing the audio files.

1. In order to plot the DFT coefficients values using Goertzel&#39;s algorithm to visually identify if they are viable features, &#39; **plot\_goertzel.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;loc&#39; must be changed to the file path pf the audio file whose plot is to be constructed.

_KNN Classifier Modelling:_

_KNN Model A: (All files are inside &#39;KNN MODEL A&#39; folder)_

1. In order to extract relevant features to train KNN Model A, &#39; **data\_prep\_features\_extract\_without\_da\_mfcc.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;finaldataset\_loc&#39; must be changed to file path of audio file dataset downloaded using &#39;autodownload\_dtmftones.py&#39; which is basically the folder named &#39;dataset&#39; and has been provided.

1. In order to train KNN classifier Model A using features computed from the above-mentioned code, &#39; **KNN\_classifier\_without\_DA\_mfcc.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. In order to test the model using real-world imitating augmented dataset, &#39; **test\_accuracy\_augmented\_data.m**&#39; MATLAB code is executed to feed the augmented testing dataset to the model and plot the resulting confusion chart.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to the file path of the augmented dataset folder which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. The MATLAB codes named &#39; **HelperComputePitchAndMFCC.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.

_KNN Model B: (All files are inside &#39;KNN MODEL B&#39; folder)_

1. In order to extract relevant features to train KNN Model B, &#39; **data\_prep\_features\_extract\_without\_da\_g\_without\_sh.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;finaldataset\_loc&#39; must be changed to file path of audio file dataset downloaded using &#39;autodownload\_dtmftones.py&#39; which is basically the folder named &#39;dataset&#39; and has been provided.

1. In order to train KNN classifier Model B using features computed from the above-mentioned code, &#39; **KNN\_classifier\_without\_DA\_g\_without\_sh.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. In order to test the model using real-world imitating augmented dataset, &#39; **test\_accuracy\_augmented\_data.m**&#39; MATLAB code is executed to feed the augmented testing dataset to the model and plot the resulting confusion chart.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to the file path of the augmented dataset folder which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. The MATLAB codes named &#39; **HelperComputeGoertzelFreq.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.

_KNN Model C: (All files are inside &#39;KNN MODEL C&#39; folder)_

1. In order to extract relevant features to train KNN Model C, &#39; **data\_prep\_features\_extract\_without\_da\_g\_with\_sh.m**&#39;MATLAB code is executed.

**NOTE:** The value of the variable &#39;finaldataset\_loc&#39; must be changed to file path of audio file dataset downloaded using &#39;autodownload\_dtmftones.py&#39; which is basically the folder named &#39;dataset&#39; and has been provided.

1. In order to train KNN classifier Model C using features computed from the above-mentioned code, &#39; **KNN\_classifier\_without\_DA\_g\_with\_sh.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. In order to test the model using real-world imitating augmented dataset, &#39; **test\_accuracy\_augmented\_data.m**&#39; MATLAB code is executed to feed the augmented testing dataset to the model and plot the resulting confusion chart.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to the file path of the augmented dataset folder which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. The MATLAB codes named &#39; **HelperComputeGoertzelFreq.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.

_KNN Model D: (All files are inside &#39;KNN MODEL D&#39; folder)_

1. In order to extract relevant features to train KNN Model D, &#39; **data\_prep\_features\_extract\_with\_da\_mfcc.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to file path of augmented audio file dataset which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. In order to train KNN classifier Model D using features computed from the above-mentioned code, &#39; **KNN\_classifier\_with\_DA\_mfcc.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. The MATLAB codes named &#39; **HelperComputePitchAndMFCC.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.

_KNN Model E: (All files are inside &#39;KNN MODEL E&#39; folder)_

1. In order to extract relevant features to train KNN Model E, &#39; **data\_prep\_features\_extract\_with\_da\_g\_without\_sh.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to file path of augmented audio file dataset which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. In order to train KNN classifier Model E using features computed from the above-mentioned code, &#39; **KNN\_classifier\_with\_DA\_mfcc.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. The MATLAB codes named &#39; **HelperComputeGoertzelFreq.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.

_KNN Model F: (All files are inside &#39;KNN MODEL F&#39; folder)_

1. In order to extract relevant features to train KNN Model F, &#39; **data\_prep\_features\_extract\_with\_da\_g\_with\_sh.m**&#39; MATLAB code is executed.

**NOTE:** The value of the variable &#39;augmented\_dataset\_loc&#39; must be changed to file path of augmented audio file dataset which is basically the folder named &#39;augmented\_dataset&#39; and has been provided.

1. In order to train KNN classifier Model F using features computed from the above-mentioned code, &#39; **KNN\_classifier\_with\_DA\_g\_with\_sh.m**&#39; MATLAB code is executed.The code trains the model and then prints the 5-fold stratified cross validation accuracy and then plots the confusion charts for Validation and Testing Accuracy.
2. The MATLAB codes named &#39; **HelperComputeGoertzelFreq.m**&#39; and &#39; **HelperTestKNNClassifier.m**&#39; are helper functions and do not need to be explicitly executed. They are automatically invoked from the main MATLAB codes mentioned above.
