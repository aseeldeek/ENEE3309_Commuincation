t=0:0.001:2;                 % Sampling time instants
Tm = length(t);              % This the length of time matrix 
fm=1;                        % Message frequency
fc=25;                       % Carrier frequency
wc=2*pi*fc*t;
wm=2*pi*fm*t;
lb=1/fc;                    % Lower bound on Time Constant
hb=1/fm;                    % Upper bound on Time constant
tau=lb:0.0001:hb;           % Varying time constant
tauLen=length(tau);         % Tau Matrix length 
em=cos(wm);                 % Message signal
ec=cos(wc);                 % Carrier signal
M=0.25;                     % Sensitivity factor
s=zeros(1,Tm);              % Modulated signal array 
st1=zeros(1,Tm);            % Will use in calclating MSE 
y=zeros(tauLen,Tm);         % Output of Envelope Detector y(t) 
y(:,1)=1+M;  % All the element in the first column of output has the max value 

 for x=1:Tm
     s(x)=(1+M*em(x))*ec(x); % Finding the modulated signal 
     st1(x)=1+M*em(x);       % Message signal to calculate MSE
 end
 D=zeros(1,tauLen);          % Mean Square Error 'D'
for i=1:tauLen
    for x=1:Tm-1
         if(s(x)<y(i,x)) % When the diode is on 
             y(i,x+1)=y(i,x)*exp(-0.001/tau(i));
         else % otherwise when the diode is off 
             y(i,x+1)=s(x); 
         end
    end
     sum = Function1(i,Tm,y,st1); 
     D(i)=sum/Tm; % The final answer D
    
end
 %% soultion of b)
 [a,b]=min(D);
 minimizedtau=tau(b); 
 disp(minimizedtau); %Optimum Value of Time Constant
 
 %% soultion of a) 
 plot(tau,D);
 xlabel('TAU');
 ylabel('mean squared error between s(t) and y(t)');
 title('D versus 1/fc << Tau << 1/fm');
 figure(2)
  %% soultion of c)
 plot(t,s); % ploting the modulated signal 
 hold on
 plot(t,y(b,:),'r');
 xlabel('Time (sec)');
 ylabel('The Modulated Signal s(t) and the Practical Envelope Output y(t)');
 title('y(t) that corresponds to the minimum D'); 
 
 %% calculating the mean squared error between ?(?) and ?(?)
 function sum = Function1(i,Tm,y,st1)
         e =st1-y(i,:); 
         e_squar=e.^2;
         sum=0;
     for l=1:Tm
         sum=sum+e_squar(l);
     end
 end

