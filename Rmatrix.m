function [ R ] = Rmatrix( Data, t )
%Rmatrix Creates Rmatrix.

[A, B] = size(Data); %data should be an 'M' file from dataInputR
%data has each window as a row and the 6 features for each channel in sep
%columns going across 1 channel at a time

% t is the number of windows back we want to go, time delay

% Recursive Time Bins

colsR = B * (t+1) + 1; %channels*features*(lag in windows + 1)
rowsR = A - t; %total windows - the lag windows
R = NaN(rowsR, colsR);
R(:,1) = 1;

col = 1;

for i = 1:B %For each column in the Data
    
    for j = 1:t+1 %We add 4 rows to the R Matrix
    
    col = col + 1;

    R(:,col) = Data((t+2)-j:(end - (j-1)),i);
    
    end
    
end

end