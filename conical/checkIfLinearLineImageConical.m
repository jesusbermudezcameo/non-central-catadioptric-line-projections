function binSel = checkIfLinearLineImageConical(L,x_n,camera,th)

%Xi = backForwardConicalProjection(x_n,camera.Z_m,camera.R_c,camera.Z_c);

Xi = getXiConical(x_n(1,:),x_n(2,:),x_n(3,:),camera.tau,camera.R_c,camera.Z_c);
W = [[zeros(3),eye(3)];[eye(3),zeros(3)]];
dmE3 = (L'*W*Xi)./sqrt(sum((crossMatrix(L(1:3))*Xi(1:3,:)).^2));        

binSel = abs(dmE3)<th;
