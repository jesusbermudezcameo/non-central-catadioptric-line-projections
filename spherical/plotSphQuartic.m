function x_nPlotSph = plotSphQuartic(qs,theta,sphCam)

rSol_s = solveAGenericQuarticForPlotting(theta,qs(1),qs(2),qs(3),qs(4),qs(5),qs(6),qs(7),qs(8),qs(9),qs(10),qs(11),qs(12),qs(13),qs(14),qs(15));
x_nPlotSph = rSol2x_nPlot_sph(rSol_s,theta,sphCam.RCam);
% xPlotSph = distortionCamForwardProjection(x_nPlotSph,sphCam.KK,sphCam.kc);
