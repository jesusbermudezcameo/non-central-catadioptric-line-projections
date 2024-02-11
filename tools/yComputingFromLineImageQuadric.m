function [x,y] = yComputingFromLineImageQuadric(x,G)

x_Q = [x.^4,x.^3,x.^2,x,ones(numel(x),1)];
y_Q_Coeffs = x_Q*G;  

y = zeros(numel(x),4);
for k = 1:numel(x)
    y(k,:) = roots(y_Q_Coeffs(k,:))';    
end

x = x*ones(1,4);

