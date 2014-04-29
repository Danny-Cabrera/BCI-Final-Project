function[subj1TrainingGlove_down] = downsampleGlove (subj1TrainingGlove, t)

% What it does: Downsampling Glove Data
% Input: 5 x A matrix of glove data
% Output: 5 x A/50 matrix of gloves data (downsampled)

lengthData = length(subj1TrainingGlove);
r = 50;
subj1TrainingGlove_down = NaN(5,lengthData/r);

% Loops row by row
for i = 1:5
    subj1TrainingGlove_down(i,:) = decimate(subj1TrainingGlove(i,:), r);
end


subj1TrainingGlove_down = subj1TrainingGlove_down(:,t+1:end);

end