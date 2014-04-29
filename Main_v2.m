
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%               NotoriousEEG                        %%%%%%%%%%%%
%%%%%%%%%%%%               Daniel Cabrera                      %%%%%%%%%%%%
%%%%%%%%%%%%               Josh Tycko                          %%%%%%%%%%%%
%%%%%%%%%%%%               Spencer Penn                        %%%%%%%%%%%%
%%%%%%%%%%%%               BE 521                              %%%%%%%%%%%%
%%%%%%%%%%%%               Final Project                       %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%                    setup                          %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LOAD DATA


%%

%Load_Data

% FEATURE EXTRATION ON DATA
% Create Data Matrix for R
NumSamps = 40000; %number of samples to run for now to save time
M = dataInputR(subj1TrainingEcog(:,1:NumSamps)); 

%%
% DOWNSAMPLE DATAGLOVE

t = 3
Y_down = downsampleGlove(subj1TrainingGlove(:,1:NumSamps)); %glove should be on same timescale as features
%for now we have features in windows  50ms apart

%%
% LINEAR REGRESSION

% Create R Matrix
R = Rmatrix(M,3);

%%

% Compute Beta (for each Finger of Glove)


% Compute size of R Matrix
[rC, cC] = size(R)

% Create Beta Matrix - of Coefficients
B = NaN(cC,5);

% Loop through each channel of Y
for i = 1:5

    % Compute size of downsampled Y
    [rY, cY] = size(Y_down(i,:))
    
    % 
    Y_segment = Y_down(i,(cY - rC+1):end)';
    B(:,i) = mldivide(R'*R,R'*Y_segment);
    
end

%%

% Create a new R Matrix based on Test Data

% Select Test Data

start = 40001;
NumSamps = 10000; %number of samples to run for now to save time
testData = dataInputR(subj1TrainingEcog(:,start:start + NumSamps)); 
Rnew = Rmatrix(testData,3);


%%
%Compute Prediction

% Create Prediction Matrix
[rCtest, cCtest] = size(Rnew)
Y_pred = NaN(5,rCtest);

% For each finger, compute a prediction based on Rtest
for i = 1:5

    Y_pred(i,:) = (Rnew*B(:,i))';

end

% INTERPOLATE PREDICTION

Y_pred_int = interpolationGlove(Y_pred);

% CHECK CORRELATION 

correlation = corr(Y_pred_int, subj1TrainingGlove(:,1:NumSamps)); %this is against the same data it was trained on
