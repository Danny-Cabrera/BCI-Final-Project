function[samples_1000hz] = interpolationGlove (samples_20hz)
    
% What it does: Upsamples Glove Data
% Input: 5 by A matrix of glove data (downsampled)
% Output: 5 by 50*A matrix of gloves data (interpolated upsampled)


    lengthData = length(samples_20hz);
    
    dt = 1/50;
    x = (1:lengthData);
    xx = (dt:dt:lengthData);
    
    samples_1000hz = NaN(5,ceil(lengthData/dt));
    
    for i = 1:5

        samples_1000hz(i,:) = spline(x,... 
            [samples_20hz(i,1) samples_20hz(i,:) samples_20hz(i,end)], xx);

    end
   
    
    
end


