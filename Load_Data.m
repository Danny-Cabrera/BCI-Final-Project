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
subject1TrainingECoG = IEEGSession( 'I521_A0009_D001', 'Cabrera', 'Cab_ieeglogin.bin');
subject1TrainingGlove = IEEGSession( 'I521_A0009_D002', 'Cabrera', 'Cab_ieeglogin.bin');
subject1TestingECoG = IEEGSession( 'I521_A0009_D003', 'Cabrera', 'Cab_ieeglogin.bin');

% Subject 2
subject2TrainingECoG = IEEGSession( 'I521_A0010_D001', 'Cabrera', 'Cab_ieeglogin.bin');
subject2TrainingGlove = IEEGSession( 'I521_A0010_D002', 'Cabrera', 'Cab_ieeglogin.bin');
subject2TestingECoG = IEEGSession( 'I521_A0010_D003', 'Cabrera', 'Cab_ieeglogin.bin');

% Subject 3
subject3TrainingECoG = IEEGSession( 'I521_A0011_D001', 'Cabrera', 'Cab_ieeglogin.bin');
subject3TrainingGlove = IEEGSession( 'I521_A0011_D002', 'Cabrera', 'Cab_ieeglogin.bin');
subject3TestingECoG = IEEGSession( 'I521_A0011_D003', 'Cabrera', 'Cab_ieeglogin.bin');

% Same for all data sets
samplingRate = subject1TrainingECoG.data.channels.sampleRate;
freq = 1/samplingRate;

% Load the data
trainingDuration =(subject1TrainingECoG.data.channels(1).get_tsdetails.getDuration/10^6);
testingDuration =(subject1TestingECoG.data.channels(1).get_tsdetails.getDuration/10^6);

numTraining = trainingDuration*samplingRate;
numTraining = numTraining+1;
numTesting = testingDuration*samplingRate;
numTesting = numTesting+1; 

subj1TrainingEcog = zeros(62,numTraining);
subj1TrainingGlove = zeros(5,numTraining);
subj1TestingEcog = zeros(62,numTesting);

subj2TrainingEcog = zeros(48,numTraining);
subj2TrainingGlove = zeros(5,numTraining);
subj2TestingEcog = zeros(48,numTesting);

subj3TrainingEcog = zeros(64,numTraining);
subj3TrainingGlove = zeros(5,numTraining);
subj3TestingEcog = zeros(64,numTesting);


for i=1:62
    subj1TrainingEcog(i,:) = subject1TrainingECoG.data.getvalues(1:numTraining,i);
    subj1TestingEcog(i,:) = subject1TestingECoG.data.getvalues(1:numTesting,i);
end

for i=1:48
    subj2TrainingEcog(i,:) = subject2TrainingECoG.data.getvalues(1:numTraining,i);
    subj2TestingEcog(i,:) = subject2TestingECoG.data.getvalues(1:numTesting,i);
end

for i=1:64
    subj3TrainingEcog(i,:) = subject3TrainingECoG.data.getvalues(1:numTraining,i);
    subj3TestingEcog(i,:) = subject3TestingECoG.data.getvalues(1:numTesting,i);
end

for i=1:5
    subj1TrainingGlove(i,:) = subject1TrainingGlove.data.getvalues(1:numTraining,i);
    subj2TrainingGlove(i,:) = subject2TrainingGlove.data.getvalues(1:numTraining,i);
    subj3TrainingGlove(i,:) = subject3TrainingGlove.data.getvalues(1:numTraining,i);
end
