valueList = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
load('ex6data3.mat');

optimalC = 0;
optimalSigma = 0;
errorMin = 1e8;
for i = 1:8
    for j = 1:8
        C = valueList(i);
        sigma = valueList(j);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if error < errorMin
            optimalC = C;
            optimalSigma = sigma;
            errorMin = error;
            fprintf('Find a better combo...\n');
        end
    end
end

optimalC

optimalSigma

