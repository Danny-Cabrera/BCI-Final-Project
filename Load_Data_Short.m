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

% Subject 1

subject1TrainingECoG = IEEGSession('I521_A0009_D001', 'penns', 'penn_ieeglogin');
subject1TrainingGlove = IEEGSession('I521_A0009_D002', 'penns', 'penn_ieeglogin');
subject1TestingECoG = IEEGSession('I521_A0009_D003', 'penns', 'penn_ieeglogin');


%%
% Same for all data sets
samplingRate = subject1TrainingECoG.data.channels.sampleRate;
freq = 1/samplingRate;

% Load the data
trainingDuration =(subject1TrainingECoG.data.channels(1).get_tsdetails.getDuration/10^6);
testingDuration =(subject1TestingECoG.data.channels(1).get_tsdetails.getDuration/10^6);

numTraining = trainingDuration*samplingRate;
numTraining = numTraining+2;
numTesting = testingDuration*samplingRate;
numTesting = numTesting+2; 

subj1TrainingEcog = zeros(62,numTraining);
subj1TrainingGlove = zeros(5,numTraining);
subj1TestingEcog = zeros(62,numTesting);

count1 = 0
for i=1:62
    subj1TrainingEcog(i,:) = subject1TrainingECoG.data.getvalues(1:numTraining,i);
    subj1TestingEcog(i,:) = subject1TestingECoG.data.getvalues(1:numTesting,i);
    count1 = count1 + 1
end


count2 = 0
for i=1:5
    subj1TrainingGlove(i,:) = subject1TrainingGlove.data.getvalues(1:numTraining,i);
    count2 = count2+1
end

subj1TestingEcog(:,200001) = [];
subj1TrainingEcog(:,400001) = [];
subj1TrainingGlove(:,400001) = [];




