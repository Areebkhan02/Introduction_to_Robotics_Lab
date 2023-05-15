function solution = findOptimalSolution(arb,x,y,z,phi)

%IK solutions for the point
solutions = findJointAngles(x,y,z,phi);

%removing unrecognizable solutions from the set of solutions
B = cellfun(@checkJointLimits, num2cell(solutions,2),'UniformOutput',false);
B = cell2mat(B);
solutions = B(:,1:4); %seperate solution from flag
B = B(:,5);
z = find(~B);
s_z = size(z);
for i=1:s_z(1)
    solutions(i,:)=[];
end

%the current angular pos of the robot
currentJointAngles = getCurrentPose(arb);

%the abs errors for all joints of all recognizable solutions
delta = abs(solutions - currentJointAngles(1,1:4));

%the accumulative error for all solutions
s = sum(delta,2);

%finding the solution with the minimum total error
[tmp,idx] = min(s);
solution = solutions(idx,:);
end