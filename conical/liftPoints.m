function xLift = liftPointsCVIU(x,y,z)
xLift = [x.^4;x.^3.*y;x.^3.*z;x.^2.*y.^2;x.^2.*y.*z;x.^2.*z.^2;x.*y.^3;x.*y.^2.*z;x.*y.*z.^2;x.*z.^3;y.^4;y.^3.*z;y.^2.*z.^2;y.*z.^3;z.^4];
