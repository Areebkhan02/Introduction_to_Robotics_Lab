function f= setPosition(arb, jointAngles) % order from base to wrist in radians
    jointAngles(2) = - jointAngles(2) + pi/2; % the offset in motor 1 is determined to be 90 degrees
    jointAngles(3) = - jointAngles(3);
    jointAngles(4) = - jointAngles(4);
    f = 1;
    for i = 1:4
        if jointAngles(i) >=5*pi/6 || jointAngles(i) <= -5*pi/6
            f = 0;
        end
    end
    if f
        arb.setpos([jointAngles 0],[50,50,50,50,50]);
    end
end
