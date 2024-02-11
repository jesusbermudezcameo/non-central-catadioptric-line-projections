%% OJO: Sistema de referencia del Pottman en vez del ICPR
function w = lTil2wConical(LTil,tau,Z_m)


l1 = Z_m*LTil(1,:); l2 = Z_m*LTil(2,:); lBar1 = LTil(3,:); lBar2 = LTil(4,:); lBar3 = LTil(5,:);

w_1 = +(1-cos(2*tau))*l2-lBar1*cos(2*tau);
w_2 = -(1-cos(2*tau))*l1-lBar2*cos(2*tau);
w_3 = lBar3*sin(2*tau);
w_4 = sin(2*tau)*(lBar1+l2);
w_5 = sin(2*tau)*(lBar2-l1);
w_6 = lBar3*cos(2*tau);

w = [w_1;w_2;w_3;w_4;w_5;w_6];

% 
% vx = Z_m*lTil(1); vy = Z_m*lTil(2); nx = lTil(3); ny = lTil(4); nz = lTil(5);
% 
% w_1 = -(1-cos(2*tau))*vy-nx*cos(2*tau);
% w_2 = (1-cos(2*tau))*vx-ny*cos(2*tau);
% w_3 = nz*sin(2*tau);
% w_4 = sin(2*tau)*(nx-vy);
% w_5 = sin(2*tau)*(ny+vx);
% w_6 = nz*cos(2*tau);
% 
% w = [w_1;w_2;w_3;w_4;w_5;w_6];
% 
