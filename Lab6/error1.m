function [corr_theta] = error1(theta)
corr_theta = mod(theta+pi,2*pi) - pi;
if ((corr_theta > 150*(pi/180) && corr_theta < pi) |  (corr_theta  < -150*(pi/180) && corr_theta  > -pi))
            disp("Angles limits are outside 150 degrees or -150 degrees")
            disp([theta])
         
        end
end
