function [ C ] = LeastSquares( X, Y  )

[N,M] = size(X);

%Create A Matrix

Slope = X;
Msin = sin(X);
Intercept = ones(N,1);

A = horzcat(Slope, Msin, Intercept);

%Compute pseudo inverse

At = inv(A'*A)*A';

%Apply pseudo inverse to Y

C = At*Y;
scatter(X,Y)
hold on
x1 = 0:.01:14;
y1 = C(1)*(x1) + C(2)*sin(x1) + C(2);
plot(x1,y1,'r')

end
