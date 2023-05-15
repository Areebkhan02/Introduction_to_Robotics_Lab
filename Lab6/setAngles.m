function setAngles(arb,angles)
theta1 = error1(angles(1)+pi/2);
theta2 = error1(angles(2)-pi/2);
theta3 = angles(3);
theta4 = angles(4);
theta5 = angles(5);
arb.setpos([theta1,theta2,theta3,theta4,theta5],[50 50 50 50 50]);
end
