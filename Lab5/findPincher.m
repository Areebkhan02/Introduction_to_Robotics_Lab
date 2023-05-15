function [x,y,z] = findPincher(jointAngles)
theta_1 = jointAngles(1);
theta_2 = jointAngles(2);
theta_3 = jointAngles(3);
theta_4 = jointAngles(4);
T =[cos(theta_2 + theta_3 + theta_4)*cos(theta_1), -sin(theta_2 + theta_3 + theta_4)*cos(theta_1), sin(theta_1), cos(theta_1)*(92*cos(theta_2 + theta_3 + theta_4) + 103*cos(theta_2 + theta_3) + 103*cos(theta_2)); cos(theta_2 + theta_3 + theta_4)*sin(theta_1),    -sin(theta_2 + theta_3 + theta_4)*sin(theta_1), -cos(theta_1), sin(theta_1)*(92*cos(theta_2 + theta_3 + theta_4) + 103*cos(theta_2 + theta_3) + 103*cos(theta_2)); sin(theta_2 + theta_3 + theta_4), cos(theta_2 + theta_3 + theta_4), 0, 92*sin(theta_2 + theta_3 + theta_4) + 103*sin(theta_2 + theta_3) + 103*sin(theta_2) + 141; 0, 0, 0, 1];
format short
x = round(T(1,4),3);
y = round(T(2,4),3);
z = round(T(3,4),3);
R = [T(1,1:3); T(2,1:3); T(3,1:3)];
end