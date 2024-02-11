function [x,binVisible] = parametricConicalLineImage(w,theta)

x = zeros(3,numel(theta));
x(1,:) = -(w(4)*cos(theta)+w(5)*sin(theta)+w(6)).*cos(theta);
x(2,:) = -(w(4)*cos(theta)+w(5)*sin(theta)+w(6)).*sin(theta);
x(3,:) = w(1)*cos(theta)+w(2)*sin(theta)+w(3);

binVisible = -(w(4)*cos(theta)+w(5)*sin(theta)+w(6))./(w(1)*cos(theta)+w(2)*sin(theta)+w(3))>0;