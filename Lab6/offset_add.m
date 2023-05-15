function offset_sol = offset_add(jointangles)
    jointangles(1) = jointangles(1) - pi/2;
    jointangles(2) = jointangles(2) + pi/2;
    jointangles(3) = jointangles(3);
    jointangles(4) = jointangles(4);
    offset_sol = jointangles;
end
