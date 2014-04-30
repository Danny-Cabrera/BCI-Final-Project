
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%               NotoriousEEG                        %%%%%%%%%%%%
%%%%%%%%%%%%               Daniel Cabrera                      %%%%%%%%%%%%
%%%%%%%%%%%%               Josh Tycko                          %%%%%%%%%%%%
%%%%%%%%%%%%               Spencer Penn                        %%%%%%%%%%%%
%%%%%%%%%%%%               BE 521                              %%%%%%%%%%%%
%%%%%%%%%%%%               Final Project                       %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%New main script for gathering and saving files of predictions

%load data first
%%
Mtrain2 = dataInputR(subj2TrainingEcog(:,:)); 

%%
Mtest2 = dataInputR(subj2TestingEcog(:,:));

%%
[sub2_eval scoreTrain2] = PredictFlex(Mtrain2, Mtest2, subj2TrainingEcog, subj2TrainingGlove, subj2TestingEcog);