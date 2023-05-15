%%Task 5.3
function solutions = findJointAngles(x,y,z,phi) 
theta_1_1 = atan2(y,x) -pi/2; %%
theta_1_2 = atan2(y,x)-pi -pi/2;

d_1 = 142;
a_4 = 95;
a_3 = 108;
a_2 = 110;

r = sqrt(x^2 + y^2);
s = z - d_1;
x_new= r - a_4*cos(phi);
y_new= s - a_4*sin(phi);

alpha = acos((-(x_new^2 + y_new^2) + a_2^2 + a_3^2)/(2*a_2*a_3));
beta = acos(a_2^2 + y_new^2 + x_new^2 - a_3^2)/ (2 * a_2 * sqrt(y_new^2 + x_new^2))
gamma = atan2(y_new,x_new);

theta_2_1 = gamma - beta +pi/2;
theta_2_2 = gamma + beta+pi/2;

theta_3_1 = pi - alpha;
theta_3_2 = - pi + alpha;

theta_4_1 = phi - theta_3_1 - theta_2_1;
theta_4_2 = phi - theta_3_2 - theta_2_2;

solutions = [theta_1_1 theta_2_1 theta_3_1 theta_4_1;

theta_1_1 theta_2_2 theta_3_2 theta_4_2;

theta_1_2 pi-theta_2_1 -theta_3_1 -theta_4_1;

theta_1_2 pi-theta_2_2 -theta_3_2 -theta_4_2];

end
