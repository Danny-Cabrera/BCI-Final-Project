function [sub_eval scoreTrain] = PredictFlex(Mtrain,Mtest, DataTrain, DataGlove, DataTest)
%PredictFlex returns the 200000x5 predictions for 1 subject
%scoreTrain to show you if things went OK, should be pretty high ~0.65
tic
% FEATURE EXTRATION ON DATA
% load Data Matrix for R

M = Mtrain;

%note feats are normalized in FeatExt.m

%%
% DOWNSAMPLE DATAGLOVE
clear Y_down

Y_down = downsampleGlove(DataGlove); %glove should be on same timescale as features
%for now we have features in windows  50ms apart

%%
% LINEAR REGRESSION
t = 3; %# of windows to lag  note 3 seems to optimal, did some testing
% Create R Matrix
R = Rmatrix(M,t);
%!! should not be including current , only previous 3 windows

%%

% Compute Beta (for each Finger of Glove)


% Compute size of R Matrix
[rC, cC] = size(R);

% Create Beta Matrix - of Coefficients
B = NaN(cC,5);

% Loop through each channel of Y
for i = 1:5

    % Compute size of downsampled Y
    [rY, cY] = size(Y_down(i,:));
    
    % 
    Y_segment = Y_down(i,(cY - rC+1):end)';
    B(:,i) = mldivide((R'*R),(R'*Y_segment));
    
end

%%
%Compute Prediction

clear Y_pred


% Create Prediction Matrix
[rC, cC] = size(R);
Y_pred = NaN(5,rC);

% For each finger, compute a prediction based on Rtest

for i = 1:5

    Y_pred(i,:) = (R*B(:,i))';

end
Y_pred = [zeros(5,length(Y_down)-rC) Y_pred];


%%
% INTERPOLATE PREDICTION

Y_pred_int = interpolationGlove(Y_pred);

%%

% CHECK CORRELATION against the training data
correlation = NaN(5,1);
for i = 1:5
    correlation(i) = corr(Y_pred_int(i,:)', DataGlove(i,1:length(Y_pred_int))'); %this is against the same data it was trained on
end
scoreTrain= (correlation(1)+correlation(2)+correlation(3)+correlation(5))/4 %not using 4th finger




%%
%TESTING
%need to make R matrix for this testing data


% Create Data Matrix for R
 
% Create R Matrix
Rtest = Rmatrix(Mtest,t); %must keep t the same
%%
%Compute Predictions for validation
clear Y_pred_test
for i = 1:5

    Y_pred_test(i,:) = (Rtest*B(:,i))'; %must keep B the same from Training

end
Y_pred_test = [zeros(5,length(Y_down)-rC) Y_pred_test]; %zero padding the ones we couldn't predict in beginning

%%
% INTERPOLATE PREDICTION

Y_pred_test_int = interpolationGlove(Y_pred_test);
sub_eval = Y_pred_test_int'; %they want 200,000x5
toc


