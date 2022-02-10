clc;
clear;
%% -*-*-*-*-*-*-*-*-*-*-*-
% Aseel Deek - 1190587
%% -*-*-*-*-*-*-*-*-*-*-*-
fm=1; % the message signal frequency 
fc=25; % the carrier frequency 
Am=1; % Amplitude of the message signal 
Ac=1; % Amplitude of the carrier signal
M=0.25; % Sensitivity factor
t = 0:0.001:2; % Time for two periods 
wc=2*pi*fc*t; % angular frequancy for carrier angular 
wm=2*pi*fm*t; % angular frequancy for message signal 
em=Am*cos(wm); % message signal
subplot(4,1,1); 
plot(t,em,'k'); %% plot the message signal 
axis([0 2 -2 2]);
xlabel('Time(sec)');
ylabel('Amplitud(v)');
title('Modulating Signal m(t)');
grid on; 
s = Ac*(1+M*em).*cos(wc); % the modulated signal 
subplot(4,1,2);
plot(t,s,'r');% plot the modulated signal AM signal 
axis([0 2 -2 2]);
xlabel('Time(sec)');
ylabel('Amplitud(v)');
title('Normal AM Signal s(t)');
grid on; 
%%  when passes through ideal envelop detector  ### 
y = abs( Ac*(1+M*em));% output of the  ideal envelop detector
subplot(4,1,3);
plot(t,y,'b'); % print the output of the ideal envelop detector
axis([0 2 -2 2]);
xlabel('Time(sec)');
ylabel('Amplitud(v)');
title(' Demodulated AM Signal y(t)');
grid on; 
