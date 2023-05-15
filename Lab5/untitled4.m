%% Question 05 [16 points]
%we have assumed the values of alpha and wc
alpha = 0.3; wc = 0.7;
b = [1 0 -1]; %This is the numerator of H(z)
a = [1 -(1+alpha)*cos(wc) alpha]; %This is the denominator of H(z)
w = linspace(0,pi); %This is the p point vector for inserting in the freqz function
H_ejw = freqz(b,a,w); %freqz accepts the filter coefficient 
% vectors b and a, and an integer w specifying the number of points 
% at which to calculate the frequency response. 
Mag = abs(H_ejw); Angle_Hejw = angle(H_ejw); 
figure;
subplot(2,1,1)
plot(w/pi,Mag);
xlabel("Frequency in pi units (from 0 to 1)");
ylabel("The Magnitude");
title("Magnitude Response")
grid on
subplot(2,1,2);
plot(w/pi,Angle_Hejw/pi);
xlabel("Frequency in pi units (from 0 to 1)");
ylabel("The Phase");
title("Phase Response")
grid on
figure;
zplane(b,a)
%%

alpha = [0.1 0.4 0.8 0.6] ;
wc = [0.4 0.9 0.5 0.2];
for i = 1:4
b = [1 0 -1]; %This is the numerator of H(z)
a = [1 -(1+alpha(i))*cos(wc(i)) alpha(i)]; %This is the denominator of H(z)
w = linspace(0,pi); %This is the p point vector for inserting in the freqz function
H_ejw = freqz(b,a,w); %freqz accepts the filter coefficient 
% vectors b and a, and an integer w specifying the number of points 
% at which to calculate the frequency response. 
Mag = abs(H_ejw); Angle_Hejw = angle(H_ejw); 
figure;
subplot(3,1,1)
plot(w/pi,Mag);
xlabel('Frequency in pi units (from 0 to 1)');
ylabel('The Magnitude');
y_t = ['Magnitude Response of alpha = ' num2str(alpha(i)) 'and wc = ' num2str(wc(i))];
title(y_t)
ax = gca;
ax.FontSize = 8;
grid on
subplot(3,1,2);
plot(w/pi,Angle_Hejw/pi);
xlabel('Frequency in pi units (from 0 to 1)');
ylabel('The Phase');
title('Phase Response')
grid on
subplot(3,1,3)
zplane(b,a)
title(['Pole-Zero of alpha = ' num2str(alpha(i)) 'and wc = ' num2str(wc(i))])
ax = gca;
ax.FontSize = 8;
max(Mag)
end
