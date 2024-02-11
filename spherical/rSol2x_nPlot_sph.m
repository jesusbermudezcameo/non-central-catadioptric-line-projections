function x_nPlot = rSol2x_nPlot_sph(rSol,thetaParam,RCam)

xSol = bsxfun(@times,rSol,cos(thetaParam));
ySol = bsxfun(@times,rSol,sin(thetaParam));   

sSol = diag([1,-1,-1])*[[xSol(1,:),xSol(2,:),xSol(3,:),xSol(4,:)];
                        [ySol(1,:),ySol(2,:),ySol(3,:),ySol(4,:)];
                         ones(1,numel(xSol))];                    
x_nPlot = RCam'*sSol;
x_nPlot = bsxfun(@rdivide,x_nPlot,x_nPlot(3,:));




