function[samples_1000hz] = interpolationGlove (samples_20hz)

    x = (1:8000);
    xx = (1/50:1/50:8000);
    
    samples_1000hz = NaN(5,400000);
    
    for i = 1:5

        samples_1000hz(i,:) = spline(x,... 
            [samples_20hz(i,1) samples_20hz(i,:) samples_20hz(i,end)], xx);

    end
   
    
    
end


