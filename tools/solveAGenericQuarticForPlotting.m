function [rSol,c] = solveAGenericQuarticForPlotting(theta,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15)


c = [ 
 q1*cos(theta).^4 + q11*sin(theta).^4 + q4*cos(theta).^2.*sin(theta).^2 + q2*cos(theta).^3.*sin(theta) + q7*cos(theta).*sin(theta).^3;
                                q3*cos(theta).^3 + q12*sin(theta).^3 + q5*cos(theta).^2.*sin(theta) + q8*cos(theta).*sin(theta).^2;
                                                               q6*cos(theta).^2 + q13*sin(theta).^2 + q9*cos(theta).*sin(theta);
                                                                                             q10*cos(theta) + q14*sin(theta);
                                                                                                    q15*ones(1,numel(theta))];

rSol = zeros(size(c,1)-1,size(c,2));
for k = 1:size(c,2)
   rSol(:,k) = roots(c(:,k));      
end