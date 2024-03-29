function LHatLifted = defineLHatLifted(lHat,lBar)

l1Hat = lHat(1,:); l2Hat = lHat(2,:);
lBar1 = lBar(1,:); lBar2 = lBar(2,:); lBar3 = lBar(3,:);

LHatLifted = [l1Hat.^2; l1Hat.*l2Hat; l1Hat.*lBar1; l1Hat.*lBar2; l1Hat.*lBar3; ...
    l2Hat.^2; l2Hat.*lBar1; l2Hat.*lBar2; l2Hat.*lBar3; ...
    lBar1.^2; lBar1.*lBar2; lBar1.*lBar3; ...
    lBar2.^2; lBar2.*lBar3; ...
    lBar3.^2];
