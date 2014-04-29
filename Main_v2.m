
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
importfile('Data.mat')

%%

%Load_Data

% FEATURE EXTRATION ON DATA
% Create Data Matrix for R
NumSamps = 50000; %number of samples to run for now to save time
M = dataInputR(subj1TrainingEcog(:,1:NumSamps)); 

%%
% DOWNSAMPLE DATAGLOVE

Y_down = downsampleGlove(subj1TrainingGlove(:,1:NumSamps)); %first 100,000 samples for now

% LINEAR REGRESSION

% Create R Matrix
R = Rmatrix(M,3);

% Compute Beta (for each Finger of Glove)

for i = 1:5
    Y_segment = Y(i,:)';
    B(:,i) = mldivide(R'*R,R'*Y_segment);
end

%Compute Prediction

for i = 1:5

    Y_pred(i,:) = (R*B(:,i))'

end

% INTERPOLATE PREDICTION

Y_pred_int = interpolationGlove(Y_pred);

% CHECK CORRELATION 

correlation = corr(Y_pred_int, subj1TrainingGlove(:,1:NumSamps)); %this is against the same data it was trained on
