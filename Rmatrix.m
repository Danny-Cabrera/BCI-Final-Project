function [ R ] = Rmatrix( Data, t )

[A, B] = size(Data);

% Recursive Time Bins

colsR = B * (t+1);
rowsR = A - t;
R = NaN(rowsR, colsR);
R(:,1) = 1;

col = 0;

for i = 1:B %For each column in the Data
    
    for j = 1:t+1 %We add 4 rows to the R Matrix
    
    col = col + 1

    R(:,col) = Data((t+2)-j:(end - (j-1)),i);
    
    end
    
end

end