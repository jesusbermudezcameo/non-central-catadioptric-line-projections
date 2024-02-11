function qs = getPolynomialSphericalQuadric(l1,l2,lBar1,lBar2,lBar3,nu)

%Recuerda que: l1 = Z_s*l1 l2 = Z_s*l2 l3 = Z_s*l3  
qs = [ 
                                         lBar3.^2*(nu^2 - 1) + l2.^2 + lBar1.^2*nu^2 - 2*l2.*lBar1*nu;      % lBar3.^2*(nu.^2 - 1) + (l2-lBar1*nu).^2
                                                               -2*(l1 + lBar2*nu).*(l2 - lBar1*nu);
                                                                          2*lBar3.*(lBar1 - l2*nu);
 lBar3.^2.*(2*nu^2 - 2) + l1.^2 + l2.^2 + lBar1.^2*nu^2 + lBar2.^2*nu^2 + 2*l1.*lBar2*nu - 2*l2.*lBar1*nu;      % 2*lBar3.^2*(nu.^2 - 1) + (l1+lBar2*nu).^2 + (l2-lBar1*nu).^2
                                                                          2*lBar3.*(lBar2 + l1*nu);
                                  l2.^2 + 2*l2.*lBar1 + (- 2*nu - 1)*lBar1.^2 + (- 2*nu - 1)*lBar3.^2;      % (l2 + lBar1).^2 - 2*(nu + 1)*lBar1.^2 + (- 2*nu - 1)*lBar3.^2
                                                               -2*(l1 + lBar2*nu).*(l2 - lBar1*nu);
                                                                          2*lBar3.*(lBar1 - l2*nu);
                                       2*l2.*lBar2 - 2*l1.*lBar1 - 2*l1.*l2 - lBar1.*lBar2*(4*nu + 2);
                                                                             2*lBar3.*(l2 + lBar1);
                                         lBar3.^2*(nu^2 - 1) + l1.^2 + lBar2.^2*nu.^2 + 2*l1.*lBar2*nu;      %(l1 + lBar2*nu).^2 + lBar3.^2*(nu.^2 - 1)
                                                                          2*lBar3.*(lBar2 + l1*nu);
                                  l1.^2 - 2*l1.*lBar2 + (- 2*nu - 1)*lBar2.^2 + (- 2*nu - 1)*lBar3.^2;
                                                                            -2*lBar3.*(l1 - lBar2);
                                                                                          lBar3.^2];

