% Build input for making X matrix
[l,w]=size(subj1TrainingEcog);
n = length(FeatExt(subj1TrainingEcog(1,:)));

M=NaN(197,6*l);

j = 1;

for i=1:6:(6*l)
    if j <=l
        M(1:197,i:i+5)=FeatExt(subj1TrainingEcog(j,1:10000))';
        j=j+1;
    end
end


