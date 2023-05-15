%Code
N = 5000;
theta_min = -5*pi/6; %here theta_min is about -150 degrees
theta_max = 5 * pi/6; %here theta_max is about 150 degrees
theta1 = theta_min +(theta_max-theta_min)*rand(N,1);  % using the function as provided in the lab
theta2 = theta_min +(theta_max-theta_min)*rand(N,1);  % using the function as provided in the lab
theta3 = theta_min +(theta_max-theta_min)*rand(N,1);  % using the function as provided in the lab
theta4 = theta_min +(theta_max-theta_min)*rand(N,1);  % using the function as provided in the lab
X =[]; %matrix for storing the array
Y=[];
Z=[];
for i = 1:N % run the iterations from 1 till 5000
[x, y, z, R] = findPincher([theta1(i), theta2(i), theta3(i), theta4(i)]);
X(i)=x;
Y(i) = y;
Z(i) = z;
end


plot3(X,Y,Z) % in the 3D plane 
figure;
plot(X,Y) % projecttion in the 2D ( X Y ) plane