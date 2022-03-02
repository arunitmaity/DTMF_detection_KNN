function result = HelperTestKNNClassifier(trainedClassifier, featuresTest)
result = table();

for idx = 1:length(featuresTest.Label)
    T = featuresTest(idx,:);  % Rows that correspond to one file
    predictedLabel = predict(trainedClassifier,T); % Predict
    result_file.Actual = T.Label;
    result_file.Predicted = predictedLabel;
    result = [result; struct2table(result_file)]; %#ok
end
end