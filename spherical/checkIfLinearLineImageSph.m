function binSel = checkIfLinearLineImageSph(L,x_n,Z_s,ZRel,th)

Xi = getXiSph(x_n(1,:),x_n(2,:),x_n(3,:),Z_s,ZRel);
W = [[zeros(3),eye(3)];[eye(3),zeros(3)]];
dmE3 = (L'*W*Xi)./sqrt(sum((crossMatrix(L(1:3))*Xi(1:3,:)).^2));        

binSel = abs(dmE3)<th;
