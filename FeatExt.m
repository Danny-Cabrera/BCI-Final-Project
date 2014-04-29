function [Feats] = FeatExt(x)
%FeatExt extracts features.
%as of now keeping window size, overlap, freq bands, etc all set

% x is just the data from 1 channel of 1 subject

window = 100; %ms %!! could mess with window to improve

NOverlap = 50; %ms (here 1 sample is 1 ms)
Fs= 1000; %Hz
F=1:175; % frequencies in Hz of interest
[S,F,T]=spectrogram(x, window,NOverlap,F,Fs); %X should be data from one channel of one subject
%F shows you which rows of S correspond with which Freqs in Hz
%T shows you which columns of S correspond with which times - 2 columns is
%100 ms for now
% S are the fourier transform
% abs function gives the magnitude of complex S
NWindows = length(S)-2; % right now there's 2 columns per window with the 50% overlap


%surf(T,F,abs(S)) very cool look at the fourier transform

Feats = NaN(6,NWindows); %gonna store the Feats in here. time in first row hten 5 freq feats

for i= 1:NWindows
    Feats(1,i)=mean(x(NOverlap*(i-1)+1:NOverlap*(i-1)+window)); %time feat simultaneously
    Feats(2,i) = mean(mean(abs(S(5:15,i:i+1)))); %the rows correspond with selected freq bands
    Feats(3,i) = mean(mean(abs(S(20:25,i:i+1))));
    Feats(4,i) = mean(mean(abs(S(75:115,i:i+1)))); % note paper uses diff freq bins
    Feats(5,i) = mean(mean(abs(S(125:160,i:i+1))));
    Feats(6,i) = mean(mean(abs(S(160:175,i:i+1))));
    
end

%these are the frequency features (row) for the one channel for each window
%(columns)

%not sure where Conv fits into time domain feature


%features 1 thru 6 in the 6 rows, for each time window in the column, for
%this 1 channel of 1 subject

% !!! in the paper they removed broken channels with flat signals or noise due
%to broken connections, or interictal activity, so we should put some sort
%of screen mechanisms in 
%they might have done it visually

% !!! the paper uses slightly different frequency bins
    