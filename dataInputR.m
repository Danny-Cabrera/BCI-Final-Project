
function[ M ] = dataInputR(x)

% Build input for making X matrix
tic %gonna keep track of how long this takes to run
[NumChannels,w] = size(x); % num of channels and w is num samples
Feats =FeatExt(x(1,:));
n = length(Feats); %number of windows

M=NaN(n,6*NumChannels);%windows as rows, 6 feats per channel for all channels as columns 

j = 1; %j is the channel

for i=1:6:(6*NumChannels) % i jumping in 6's (num of feats) to num of feats * NumChannels
    if j <=NumChannels
        M(:,i:i+5)=FeatExt(x(j,:))';
        j=j+1;
        if mod(j,5)==0
            sprintf('Calculating features for channel %d',j) %status update
            toc %print time elapsed
        end
    end
end

end


