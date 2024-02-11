function Xi = getXiSph(x,y,z,Z_s,ZRel)

rSquare = x.^2 + y.^2;
rhoSquare = x.^2 + y.^2 + z.^2;

gamma = -rSquare*ZRel^2+rhoSquare;
chi = sqrt(ZRel^2*gamma);

delta = 2*rSquare*ZRel^4 - 2*z.*chi*ZRel^2-3*rhoSquare*ZRel^2+rhoSquare;
epsilon = (-rSquare+z.^2)*ZRel^2+2*chi.*z+rhoSquare;
zeta = 2*rSquare.*z*ZRel^4-2*chi.*(-rSquare*ZRel^2+rhoSquare)-z.*rhoSquare*(1+ZRel^2);

xi = [x.*delta;y.*delta;-zeta];
xiBar = Z_s*[-y.*epsilon;x.*epsilon;zeros(1,numel(x))];

Xi = [xi;xiBar];