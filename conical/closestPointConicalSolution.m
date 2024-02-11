function [xTildeSol,yTildeSol] = closestPointConicalSolution(Omega,g,xLift)

C = Omega*xLift;

xTildeSolRaw = roots(C); %The 14 solutions
binReal = imag(xTildeSolRaw)==0;
xTildeSol = xTildeSolRaw(binReal); %% Reject non real solutions

[xTildeSol,yTildeSol] = yComputingFromLineImageQuadric(xTildeSol,triOperator(g));


xTildeSol = xTildeSol(:);
yTildeSol = yTildeSol(:);
binReal = imag(yTildeSol)==0;
xTildeSol = xTildeSol(binReal);
yTildeSol = yTildeSol(binReal);