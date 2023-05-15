clc;clear;
%first find A1 A2 A3 A4
syms theta_1(t) theta_2(t) theta_3(t) theta_4(t); 
A1 = createA(theta_1(t),142,0,pi/2)
A2 = createA(theta_2(t),0,104,0)
A3 = createA(theta_3(t),0,104,0)
A4 = createA(theta_4(t),0,80,0)
T0_4=simplify(A1*A2*A3*A4)

%NOW WE WILL EXTRACT THE LAST COLUMN OF THIS HOMOGENOUS TRANFORMATION TO
%TAKE POSITION VECTOR OF END EFFECTOR
%syms Jv;syms Jw;

%J=[Jv;Jw];
position_vector=T0_4(1:3,4)

%NOW WE WILL POPULATE THE Jv mattrix by differentiating the positin vector
%WITH RESPECT TO EACH THETA

col_1 =diff(position_vector,theta_1(t));
col_2 =diff(position_vector,theta_2(t));
col_3 =diff(position_vector,theta_3(t));
col_4 =diff(position_vector,theta_4(t));
Jv = [col_1 col_2 col_3 col_4]
simplify(Jv)

%%NOW FINDING THE Jw 3 by 3 matrix
col1 = A1(:,3);
col2 = A2(:,3);
col3 = A3(:,3);
col4 = A4(:,3);
Jw=[col1 col2 col3 col4]

J=[Jv;Jw]%final jacobian