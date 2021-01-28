function [K,Ti,Td,b]=PIDtun_AHtau(Ko,T,L,str,M)

a=Ko*L/T; tau=L/(L+T);
if nargin<4
 error('Don''t miss the fourth input argument!'), return,
end 
if nargin<5
 disp('You choose 1.4 sensitivity!'), M=1.4;
end 
if strcmp(str,'PI')
   if (M==1.4)
    TPI14=[

    0.29   -2.7    3.7;   % aK
    8.9    -6.6    3.0;   % Ti/L  
    0.81    0.73   1.9];  % b  

    a0=TPI14(:,1);
    a1=TPI14(:,2);
    a2=TPI14(:,3);
   elseif (M==2)
    TPI20=[

    0.78   -4.1     5.7;   % aK
    8.9    -6.6     3.0;   % Ti/L
    0.44    0.78   -0.45]; % b 

    a0=TPI20(:,1);
    a1=TPI20(:,2);
    a2=TPI20(:,3);
   else
    error('Wrong sensitivity M'), return
   end
elseif strcmp(str,'PID')
   if (M==1.4)
    TPID14=[

    3.80  -8.40   7.3;  % aK
    5.20  -2.50  -1.4;  % Ti/L
    0.89  -0.37  -4.1;  % Td/L
    0.40   0.18   2.8]; % b
    a0=TPID14(:,1);
    a1=TPID14(:,2);
    a2=TPID14(:,3);
   elseif (M==2)
    TPID20=[

    8.40  -9.6   9.80;  % aK
    3.20  -1.5  -0.93;  % Ti/L
    0.86  -1.9  -0.44;  % Td/L
    0.22   0.65  0.051]; % b

    a0=TPID20(:,1);
    a1=TPID20(:,2);
    a2=TPID20(:,3);
   else
    error('Wrong sensitivity M'), return
   end 
 else error('Wrong name of the controller!'), return
end

fun=a0.*exp(a1*tau+a2*tau^2);

K=fun(1)/a;
Ti=fun(2)*L;

if strcmp(str,'PI') 
  b=fun(3); return
else 
  Td=fun(3)*L; b=fun(4);
end

end