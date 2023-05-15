function solutions = findJointAngles_T(x,y,z,phi) 
% x, y and z are the coordinates of the center of teh end-effector that is
% the 4th frameso
theta_1_1 = mod(atan2(y,x)+pi-pi/2,2*pi)-pi ;
theta_1_2 = mod((- pi + atan2(y,x)+pi-pi/2),2*pi) - pi ;

d_1 = 141;
a_4 = 95;
a_3 = 108;
a_2 = 110;

r = sqrt(x^2 + y^2)
s = z - d_1;
r_2 = r - a_4*cos(phi)
s_2 = s - a_4*sin(phi)

alpha = acos((-(r_2^2 + s_2^2) + a_2^2 + a_3^2)/(2*a_2*a_3))
temp = (a_2^2 + s_2^2 + r_2^2 - a_3^2)/ (2 * a_2 * sqrt(s_2^2 + r_2^2))
beta = atan2(sqrt(1 - temp^2),temp)
gamma = atan2(s_2,r_2)

% theta_2_1 = mod((gamma - beta)+pi,2*pi)-pi +pi/2;
% theta_2_2 = mod((gamma + beta)+pi,2*pi)-pi+pi/2;

theta_2_1 = mod((gamma - beta)+pi+pi/2,2*pi)-pi ;
theta_2_2 = mod((gamma + beta)+pi+pi/2,2*pi)-pi;

theta_3_1 = mod((pi - alpha)+pi,2*pi)-pi;
theta_3_2 = mod((- pi + alpha)+pi,2*pi)-pi;

theta_4_1 = mod((phi - theta_3_1 - theta_2_1)+pi,2*pi)-pi;
theta_4_2 = mod((phi - theta_3_2 - theta_2_2)+pi,2*pi)-pi;



% solutions = [theta_1_1 theta_2_1 theta_3_1 theta_4_1; 
%     theta_1_1 theta_2_2 theta_3_2 theta_4_2;
%     theta_1_2 pi-theta_2_1 -theta_3_1 -theta_4_1; 
%     theta_1_2 pi-theta_2_2 -theta_3_2 -theta_4_2];

solutions = [theta_1_1 theta_2_1 theta_3_1 theta_4_1; 
    theta_1_1 theta_2_2 theta_3_2 theta_4_2;
    theta_1_2 theta_2_1 theta_3_1 theta_4_1; 
    theta_1_2 theta_2_2 theta_3_2 theta_4_2];
end


% ans =
% 
%    -1.5708    0.6490   -1.1889   -2.6017
%    -1.5708    2.5745    1.1889   -0.6218
%     1.5708    2.4926    1.1889    2.6017
%     1.5708    0.5671   -1.1889    0.6218
