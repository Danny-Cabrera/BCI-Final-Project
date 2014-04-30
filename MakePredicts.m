
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
%first we extract features into M matrices and save them so we don't have
%to every time

% SUBJECT 1

%Mtrain1 = dataInputR(subj1TrainingEcog(:,:)); 
importfile('Mtrain1.mat')

%%
%Mtest1 = dataInputR(subj1TestingEcog(:,:));
importfile('Mtest1.mat')

%%
[sub1test_dg scoreTrain1] = PredictFlex(Mtrain1, Mtest1, subj1TrainingEcog, subj1TrainingGlove, subj1TestingEcog);


%%
% SUBJECT 2

%Mtrain2 = dataInputR(subj2TrainingEcog(:,:)); 
importfile('Mtrain2.mat')

%%
%Mtest2 = dataInputR(subj2TestingEcog(:,:));
importfile('Mtest2.mat')

%%
[sub2test_dg scoreTrain2] = PredictFlex(Mtrain2, Mtest2, subj2TrainingEcog, subj2TrainingGlove, subj2TestingEcog);


%%
% SUBJECT 3

%Mtrain3 = dataInputR(subj3TrainingEcog(:,:)); 
importfile('Mtrain3.mat')

%%
%Mtest3 = dataInputR(subj3TestingEcog(:,:));
importfile('Mtest3.mat')

%%
[sub3test_dg scoreTrain3] = PredictFlex(Mtrain3, Mtest3, subj3TrainingEcog, subj3TrainingGlove, subj3TestingEcog);

