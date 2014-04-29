% Downsampling dataglove traces

function[ subj1TrainingGlove_down ] = downsampleGlove (subj1TrainingGlove)

r = 50;
subj1TrainingGlove_down = NaN(5,400000/r);

for i = 1:5
    subj1TrainingGlove_down(i,:) = decimate(subj1TrainingGlove(i,:), r);
end

end