function check(x,y,z)
solutions = findJointAngles_T1(x,y,z,0);
array = [1 1 1
    1 1 1
    1 1 1
    1 1 1];
for i=1:4
    [x,y,z]=findPincher(solutions(i,1:4));
    array(i,1:3) = [x,y,z];

end
array
end

