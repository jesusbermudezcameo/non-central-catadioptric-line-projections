% Computer Vision and Image Understanding - Fitting line projections in non-central catadioptric cameras with revolution symmetry:
% J. Bermudez-Cameo, G. Lopez-Nicolas, J.J. Guerrero
% Supplementary Material - CVIU-17-288
% ==============================================================================
% Copyright (C) 2017 Jesus Bermudez-Cameo.
% This code has been implemented by Jesus Bermudez-Cameo and supervised 
% by G.Lopez-Nicolas and J.J. Guerrero
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% Acknowledgement:
% This code has been implemented by Jesus Bermudez-Cameo and supervised 
% by G.Lopez-Nicolas and J.J. Guerrero
% 
% One may refer to the following paper:
% 	
% “Fitting line projections in non-central catadioptric cameras with revolution symmetry”,
% J. Bermudez-Cameo, G. Lopez-Nicolas and J. J. Guerrero,  
% Computer Vision and Image Understanding. 2018. Number 167C (2018) pp. 134-152. 
% DOI: 10.1016/j.cviu.2018.01.003	 
% 
% This work has been supported by the University of Zaragoza , the 
% Spanish project s DPI2015-65962-R (MINECO/FEDER, UE) and DPI2014-61792-EXP.


close all;
clear;
dbstop if error;
iptsetpref('ImshowBorder','tight');

if isunix
    path(path,'calib/'); 
    path(path,'conical/'); 
    path(path,'spherical/'); 
    path(path,'tools/');    
else
    path(path,'calib\');
    path(path,'conical/'); 
    path(path,'spherical/');
    path(path,'tools/'); 
end


[conicalMirrorCam,sphCam] = defineSimConicalSphCamPlot;
mRows = sphCam.mRows;
nColumns = sphCam.nColumns;
imgBackground = ones(mRows,nColumns,3)*255;

%% L is the 3D line in Plucker coordinates
L =[ 0;1.0000;0;-0.9572;0;0.7660];
%% xImg is the 2D point in image coordinates
xImg = [788.3653;395.5571;1];

thetaParam = -pi:pi/1440:pi;

%% Conical mirror example

w = lTil2wConical([L(1:2);L(4:6)],conicalMirrorCam.tau,conicalMirrorCam.Z_m);

figure(1);
imshow(imgBackground);
hold on;
line([0,nColumns],[mRows/2,mRows/2],'LineStyle','--','Color','b');
line([nColumns/2,nColumns/2],[0,mRows],'LineStyle','--','Color','b');

% Plot the point
plot(xImg(1),xImg(2),'r*');

% Plot the parametric line
[x_nPlot,binVisible] = parametricConicalLineImage(w,thetaParam);   
xPlot = conicalMirrorCam.KK*x_nPlot;
% xPlot = distortionCamForwardProjection(x_nPlot,conicalMirrorCam.KK,conicalMirrorCam.kc); 
plot(xPlot(1,:)./xPlot(3,:),xPlot(2,:)./xPlot(3,:),'g.','MarkerSize',1);    

% Transform to the normalized plane
x_nConic = conicalMirrorCam.KK\xImg;


[dE2,x_c] = metricDistConical(L,w,x_nConic,conicalMirrorCam,1e-3);

x_cImg = conicalMirrorCam.KK*x_c;
plot(x_cImg(1)/x_cImg(3),x_cImg(2)/x_cImg(3),'bx');

fprintf('Conical mirror; Euclidean on n-plane distance d_E2 = %f\n',dE2);



%% Spherical mirror example

figure(2);
imshow(imgBackground);
hold on;
line([0,nColumns],[mRows/2,mRows/2],'LineStyle','--','Color','b');
line([nColumns/2,nColumns/2],[0,mRows],'LineStyle','--','Color','b');

plot(xImg(1),xImg(2),'r*');

G_cs = transformP5Coordinates(eye(3),zeros(1,3),sphCam.tCam,1);


% Plot the line image (revisar)
nu = 2*sphCam.ZRel^2-1;
L_sph = G_cs\L;
qs = getPolynomialSphericalQuadric(L_sph(1)*sphCam.Z_s,L_sph(2)*sphCam.Z_s,L_sph(4),L_sph(5),L_sph(6),nu);
x_nPlotSph = plotSphQuartic(qs,thetaParam,sphCam);
binSel = checkIfLinearLineImageSph(L_sph,x_nPlotSph,sphCam.Z_s,sphCam.ZRel,1e-3);
xPlotSph = sphCam.KK*x_nPlotSph(:,binSel);

plot(xPlotSph(1,:)./xPlotSph(3,:),xPlotSph(2,:)./xPlotSph(3,:),'g.','MarkerSize',1);


LHatLifted = defineLHatLifted(L_sph(1:3)*sphCam.Z_s/norm(L_sph(4:6)),L_sph(4:6)/norm(L_sph(4:6)));
N = defineNSph(sphCam.ZRel);

g = LHatLifted'*N;
h_x = LHatLifted'*N*defineJSphMatrix(1,0,0);
h_y = LHatLifted'*N*defineJSphMatrix(0,1,0);
h_z = LHatLifted'*N*defineJSphMatrix(0,0,1);

SBar = getSBar(g,h_x,h_y,h_z);


x_nSph = sphCam.KK\xImg;
x0Map = diag([1,-1,-1])*sphCam.RCam*x_nSph;

[dE2,xTilde] = metricDistSph(L_sph,SBar,g,x0Map,sphCam,1e-3);

pMapSolImgB = sphCam.KK*xTilde;
plot(pMapSolImgB(1)/pMapSolImgB(3),pMapSolImgB(2)/pMapSolImgB(3),'bx');

fprintf('Spherical mirror; Euclidean on n-plane distance d_E2 = %f\n',dE2);