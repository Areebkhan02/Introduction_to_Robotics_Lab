function solution = optimial_org(allsolutions)
%before this we have already add the mod with all the 4 solutions and if
%any of the 4 soltuions is not within the range of -150 to 150 it will be
%dropped 
 %position = arb.getpos();
    position = [pi/2 -pi/2 0 0];
    position(1) = position(1) - pi/2;
    position(2) = position(2) + pi/2;

    error = 0;
    a = [];
    
    for i=1:4
        error = abs(real(allsolutions(i,1))-position(1))+ abs(real(allsolutions(i,2))-position(2)) + abs(real(allsolutions(i,3))-position(3)) + abs(real(allsolutions(i,4))-position(4));
        a(i)=error;
    end
    
    perfect = find(min(a));
    solution = allsolutions(perfect,:)
end