function [dE2,xTilde] = metricDistConical(L,w,x,camera,th)

qc = getPolynomialConicQuadric(w(1),w(2),w(3),w(4),w(5),w(6));
Omega = getOmega(w);
xLift = liftPoints(x(1,:),x(2,:),x(3,:));
[xTildeSol,yTildeSol] = closestPointConicalSolution(Omega,qc,xLift);

x_nSol = [xTildeSol';yTildeSol';ones(1,numel(xTildeSol))];
binSel = checkIfLinearLineImageConical(L,x_nSol,camera,th);

xTildeSol = xTildeSol(binSel);
yTildeSol = yTildeSol(binSel);

[dE2Square,iCloser] = min((xTildeSol-x(1)/x(3)).^2 + (yTildeSol-x(2)/x(3)).^2);
dE2 = sqrt(dE2Square);
xTilde = [xTildeSol(iCloser);yTildeSol(iCloser);1];



