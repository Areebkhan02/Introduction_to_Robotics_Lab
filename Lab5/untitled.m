clc;clear;
syms z;


x_z_numerator = expand(2.1*(1+0.3*z) +0.3*(1-0.4*z))
x_z_denominator = expand((1-0.4*z)*(1+0.3*z))

h_z_numerator = 1- 3.3*z + 0.36*z^2
h_z_denominator = expand((1-0.3*z)*(1+0.6*z))

p_numerator = expand(x_z_numerator * h_z_numerator)
p_denominator = expand(x_z_denominator * h_z_denominator)

b=[0 459/2500 -819/1000 -741/100 12/5];
a=[27/1250 -9/500 -33/100 1/5 1];
[r,p,k] =residue(b,a)

%%
clc;clear;
real=[50,50,20,0; 10,30,20,0 ; 10 30 5 0 ; 20 30 5 0 ;20 7 0 5 0];
measured=[30,60,28,0 ; 8,35,15,0; 11 26 3 0; 17 27 1 0 ; 10 84 3 0];
accuracy=[0 0 0 0];
for i=1:4
 accuracy(i)=sqrt((real(i,1)-measured(i,1))^2 + (real(i,2)-measured(i,2))^2 +(real(i,3)-measured(i,3))^2 + (real(i,4)-measured(i,4))^2)
end

%%
pick=[120,120,120,0];
place=[x2,y2,z1,phi2];
int1=arb.getpos();
setpos([int1 0],[50,50,50,50,50])

solution= findJointAngles(pick(1),pick(2),pick(3),pick(4));
x=arb.pos();
sum=0;
temp=[];
for i=1:4

end


arb.setpos([solution(mini,:) 0],[50,50,50,50,50])%open jaw and go to that position.

arb.setpos([solution(mini,:) -1],[50,50,50,50,50])%close the jaw

solution= findJointAngles(place(1),place(2),place(3),place(4));
x=arb.pos();
sum=0;
temp=[];
for i=1:4

end

arb.setpos([solution(mini,:) 0],[50,50,50,50,50])%open jaw and go to that place position
%%
arb.setpos([0 0 0 0 0],[50 50 50 50 50])
pause(50)
x=arb.getpos()
solution = findJointAngles_T(120,120,0,0)
arb.setpos([solution(2,:) 0],[50 50 50 50 50])