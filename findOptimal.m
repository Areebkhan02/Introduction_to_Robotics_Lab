%%Task 5.3
solutions=findJointAngles_T(0,100,20,0) %% first we find the solution by 
% providing our own end effector frame co-ordinates through joint angles 
% functions written in Task 5.2. This will give our 4 solutions through 
% the formula that we have computed
x=arb.getpos()%to get actual solution from the robotics manipulator itself.
%This tells us the vector [theta1 theta2 theta3 theta4] in radians 
sum=0; % sum variable that calculates the product 
temp=[];% 1x4 vector that stores the sum of solutions
for i=1:4
    
    if (solutions(i,1)>(150*(pi/180)) | solutions(i,1)<(-150*(pi/180)))
        sum=abs(solutions(i,1)-x(1))+ abs(solutions(i,2)-x(2)) + abs(solutions(i,3)-x(3)) + abs(solutions(i,4)-x(4))
        temp(i)=sum;
        sum=0;
    end

end
solution=find(min(temp)) % find the Best solution
%arb.setpos([solutions(solution,:) 0],[50,50,50,50,50]) % the best solution
%is then transmitted to get the end effector orientation co-ordinates
%now we measure the difference between the end effector orientation that we
%fed in and the actual one that we measured to get the error 
