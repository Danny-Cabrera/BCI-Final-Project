
function[ M ] = dataInputR(subj1TrainingEcog)

% Build input for making X matrix

[l,w] = size(subj1TrainingEcog);
n = length(FeatExt(subj1TrainingEcog(1,:)));

M=NaN(n,6*l); 

j = 1;

for i=1:6:(6*l)
    if j <=l
        M(:,i:i+5)=FeatExt(subj1TrainingEcog(j,:))';
        j=j+1;
    end
end

end


