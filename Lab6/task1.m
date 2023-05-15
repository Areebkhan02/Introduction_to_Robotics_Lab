syms('theta_1'); 
syms('theta_2'); 
syms('theta_3');    
syms('theta_4'); 
T0_1 = [cos(theta_1) 0 sin(theta_1) 0; sin(theta_1) 0 -cos(theta_1) 0;0 1 0 141; 0 0 0 1];
T1_2 = [cos(theta_2) -sin(theta_2) 0 103*cos(theta_2); sin(theta_2) cos(theta_2) 0 103*sin(theta_2);0 0 1 0; 0 0 0 1];
T2_3 = [cos(theta_3) -sin(theta_3) 0 103*cos(theta_3); sin(theta_3) cos(theta_3) 0 103*sin(theta_3);0 0 1 0; 0 0 0 1];
T3_4 = [cos(theta_4) -sin(theta_4) 0 103*cos(theta_4); sin(theta_4) cos(theta_4) 0 92*sin(theta_4);0 0 1 0; 0 0 0 1];
T0_4 = T0_1 * T1_2 * T2_3 * T3_4;
T = simplify(T0_4)
%% Error Code of matlab

%%
load handel; % the signal is in y and sampling freq in Fs 
%sound(y,Fs); pause(10); % Play the original sound 
alpha = 200 ; D = 4196; % Echo parameters 
b = [1,zeros(1,D),alpha]; % Filter parameters
x = filter(b,1,y); % Generate sound plus its echo 
%sound(x,Fs); % Play sound with echo
w= filter(1,b,x);%pause(10)
sound(w,Fs)

%%
L = length(y); 
X_FFT = fft(y);
P2 = abs(X_FFT/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); %p1 is the single sided spectrum
f = Fs*(0:(L/2))/L;

figure;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")


N = 8;
fc = 0.2;
num1 = fir1(N,fc,'high');
den1 = [1];
fvtool(num1,den1);
figure;
subplot(2,1,1)
plot(y)
filter1 = filter(num1,den1,y);

subplot(2,1,2)
plot(filter1)

L = length(filter1); 
X_FFT = fft(filter1);
P2 = abs(X_FFT/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); %p1 is the single sided spectrum
f = Fs*(0:(L/2))/L;

figure;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of filter(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
%%
syms z
x= (0.909/(1-(-1)*z^-1)) +(0.2595/(1-(0.7236)*z^-1)) +(-0.3504/(1-(0.2764*z^-1)))
simplify(x)
