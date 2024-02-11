function Xi = getXiConical(x,y,z,tau,R_c,Z_c)

tan2Tau = tan(2*tau);
r = sqrt(x.^2+y.^2);

xi = [x.*(z*tan2Tau-r);y.*(z*tan2Tau-r);r.*(z + tan2Tau*r)];
aux = Z_c*(z*tan2Tau-r) + R_c*(z+r*tan2Tau);
xiBar = [-y.*aux;x.*aux;zeros(1,numel(x))];
Xi = [xi;xiBar];