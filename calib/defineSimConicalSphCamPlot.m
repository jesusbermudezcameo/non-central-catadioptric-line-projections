function [conicalMirrorCam,sphCam] = defineSimConicalSphCamPlot

mRows = 1024;
nColumns = 1024;

fx = 0.6*nColumns; 
fy = 0.6*mRows;


u0 = 0.5*nColumns;
v0 = 0.5*mRows;

Z_m = 1;
tau = atan(2);

R_c = Z_m*sin(2*tau);
Z_c = Z_m*(1-cos(2*tau));

rSph = 1;


Z_s = 2;
ZRel = Z_s/rSph;


KKConical = [[fx 0 u0];
             [0 fy v0];
             [0  0  1]];
         

kc = [0   0   0   0  0 ]; 


[jImg,iImg] = meshgrid(1:nColumns,1:mRows);
jImg = reshape(jImg,1,nColumns*mRows);
iImg = reshape(iImg,1,nColumns*mRows);       

x_n = KKConical\[jImg;iImg;ones(1,numel(jImg))];

conicalMirrorCam.Z_m = Z_m;
conicalMirrorCam.tau = tau;

conicalMirrorCam.R_c = R_c;
conicalMirrorCam.Z_c = Z_c;

conicalMirrorCam.mRows = mRows;
conicalMirrorCam.nColumns = nColumns;

conicalMirrorCam.u0 = u0;
conicalMirrorCam.v0 = v0;

conicalMirrorCam.fx = fx;
conicalMirrorCam.fy = fy;

conicalMirrorCam.KK = KKConical;
conicalMirrorCam.kc = kc;

conicalMirrorCam.x_n = x_n;



tCam = [0;0;Z_s];
RCam = diag([1,-1,-1]); %rotxRad(pi);
TCam = [[RCam tCam];[zeros(1,3) 1]];

fx = 0.9*nColumns; 
fy = 0.9*mRows;

KKSph = [[fx 0 u0];
         [0 fy v0];
         [0  0  1]];

x_n = KKSph\[jImg;iImg;ones(1,numel(jImg))];
     
     
sphCam.rSph = rSph;
sphCam.ZRel = ZRel;
sphCam.Z_s = Z_s;
sphCam.mRows = mRows;
sphCam.nColumns = nColumns;
sphCam.KK = KKSph;
sphCam.kc = kc;

sphCam.fx = fx;
sphCam.fy = fy;
sphCam.u0 = u0;
sphCam.v0 = v0;

sphCam.TCam = TCam;
sphCam.RCam = RCam;
sphCam.tCam = tCam;
sphCam.x_n = x_n;




return;