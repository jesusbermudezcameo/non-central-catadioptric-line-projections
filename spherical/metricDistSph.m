function [dE2,xTilde] = metricDistSph(L,SBar,g,x,camera,th)

S_L = zeros(4,4,8);
for k = 1:8
    S_L(:,:,k) = SBar(:,:,k,1)*x(1) + SBar(:,:,k,2)*x(2) + SBar(:,:,k,3)*x(3);    
end 
C = getCoeffsForSolving4x4Det(S_L);

xTildeSolRaw = roots(C); %The 14 solutions
binReal = imag(xTildeSolRaw)==0;
xTildeSol = xTildeSolRaw(binReal); %% Reject non real solutions

[xTildeSol,yTildeSol] = yComputingFromLineImageQuadric(xTildeSol,triOperator(g));


xTildeSol = xTildeSol(:);
yTildeSol = yTildeSol(:);
binReal = imag(yTildeSol)==0;
xTildeSol = xTildeSol(binReal);
yTildeSol = yTildeSol(binReal);


x_nSol = [xTildeSol';yTildeSol';ones(1,numel(xTildeSol))];
binSel = checkIfLinearLineImageSph(L,x_nSol,camera.Z_s,camera.ZRel,th);

xTildeSol = xTildeSol(binSel);
yTildeSol = yTildeSol(binSel);


[dE2Square,iCloser] = min((xTildeSol-x(1)/x(3)).^2 + (yTildeSol-x(2)/x(3)).^2);
dE2 = sqrt(dE2Square);
xTilde = [xTildeSol(iCloser);yTildeSol(iCloser);1];
