function [x,y,z] = findPincher(jointAngles)

%jointAngles = offset_add(jointAngles);
theta_1 = jointAngles(1);
theta_2 = jointAngles(2);
theta_3 = jointAngles(3);
theta_4 = jointAngles(4);
theta=[theta_1 theta_2 theta_3 theta_4];
a = [0 104 104 80];
d=[142 0  0 0];
alpha=[pi/2 0 0 0];
T=[1 0 0 0;
   0  1 0 0 ;
   0  0  1 0;
   0  0  0  1];
for i=1:4
    A=[cos(theta(i)) -sin(theta(i))*cos(alpha(i)) sin(theta(i))*sin(alpha(i)) a(i)*cos(theta(i));
        sin(theta(i)) cos(theta(i))*cos(alpha(i)) -cos(theta(i))*sin(alpha(i)) a(i)*sin(theta(i));
        0                  sin(alpha(i))                    cos(alpha(i))           d(i);
        0                       0                               0                      1];
    T=T*A;
end
   
format short
x = round(T(1,4),3);
y = round(T(2,4),3);
z = round(T(3,4),3);
R = [T(1,1:3); T(2,1:3); T(3,1:3)];
end
