function [Feats] = FeatExt(x)
%FeatExt extracts features.
%as of now keeping window size, overlap, freq bands, etc all set

% x is just the data from 1 channel of 1 subject

window = 100; %ms

NOverlap = 50; %ms (here 1 sample is 1 ms)
Fs= 1000; %Hz
F=1:175; % frequencies in Hz of interest
[S,F,T]=spectrogram(x, window,NOverlap,F,Fs); %X should be data from one channel of one subject
%F shows you which rows of S correspond with which Freqs in Hz
%T shows you which columns of S correspond with which times - 2 columns is
%100 ms for now
% S are the fourier transform
% abs function gives the magnitude of complex S
NWindows = length(S)/(window/NOverlap); % right now there's 2 columns per window with the 50% overlap


%surf(T,F,abs(S)) very cool look at the fourier transform

FreqFeats = NaN (5, NWindows);
for i= 1:NWindows
    FreqFeats(1,i) = mean(mean(abs(S(5:15,((2*i-1):(2*i))))));
    FreqFeats(2,i) = mean(mean(abs(S(20:25,((2*i-1):(2*i))))));
    FreqFeats(3,i) = mean(mean(abs(S(75:115,((2*i-1):(2*i))))));
    FreqFeats(4,i) = mean(mean(abs(S(125:160,((2*i-1):(2*i))))));
    FreqFeats(5,i) = mean(mean(abs(S(160:175,((2*i-1):(2*i))))));
end

%these are the frequency features (row) for the one channel for each window
%(columns)

%now to get the one Time domain feature
TimeFeat=NaN(1,NWindows);
for i=1:NWindows
    TimeFeat(1,i)=mean(x(window*i-(window-1):window*i));
end
    
%not sure where Conv fits into time domain feature

Feats = [TimeFeat ; FreqFeats];
%features 1 thru 6 in the 6 rows, for each time window in the column, for
%this 1 channel of 1 subject


    