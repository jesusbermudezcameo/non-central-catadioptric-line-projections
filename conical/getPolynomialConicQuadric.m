function qc = getPolynomialConicQuadric(w1,w2,w3,w4,w5,w6)

qc = [ 
          w1.^2 - w3.^2;
               2*w1.*w2;
    2*w1.*w6 - 2*w3.*w4;
w1.^2 + w2.^2 - 2*w3.^2;
    2*w2.*w6 - 2*w3.*w5;
          w6.^2 - w4.^2;
               2*w1.*w2;
    2*w1.*w6 - 2*w3.*w4;
              -2*w4.*w5;
      zeros(1,numel(w1));
          w2.^2 - w3.^2;
    2*w2.*w6 - 2*w3.*w5;
          w6.^2 - w5.^2;
     zeros(1,numel(w1));
     zeros(1,numel(w1))];
