Kp=1;
Ti=0.2;
Td=0.04;
Kp_pos=Kp/2*(1+sqrt(1-4*Td/Ti));
Ti_pos=Ti/2*(1+sqrt(1-4*Td/Ti));
Td_pos=Td/2*(1+sqrt(1-4*Td/Ti));



Ts=0.1;

[a,L]=h2aL(out.output1);

%a=0.2964%
[Ko,T,L,Tmax]=h2KTL(out.output1);

%Ko =1%
%T=5.8455%
%L=2.5553%
%Tmax=8.6218%

[Ko,T,L]=h2Strejc(out.output1,0.85)

%Ko =1%
%T=4.6811%
%L=3.451%

[K,Ti,Td]=PIDtun_ZN2(0.24,7.71,'PID')

%K=0.144%
%Ti=3.855%
%Td=0.9637%

[K,Ti,Td]=PIDtun_CC(1,4.6811,3.451,'PID')
%K = 2.0742%
%Ti = 6.8287%
%Td = 1.1200%

[K,Ti,Td]=PIDtun_ZN1(0.2964,2.5553,'PID')
%K = 4.0486%
%Ti = 5.1106%
%Td = 1.2776%

[K,Ti,Td,B]=PIDtun_AHtau(1,4.6811,3.451,'PID',2)
%K = 1.1321%
%Ti = 4.9421%
%Td = 1.2242%
%b = 0.2926%
