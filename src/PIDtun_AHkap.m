function [K,Ti,Td,b]= PIDtun_AHkap(Ko,Ku,Tu,str,M)

kappa=1/(Ko*Ku);
if nargin<4
 error('Don''t miss the fourth input argument!'), return,
end 
if nargin<5
 disp('You choose 1.4 sensitivity!'), M=1.4;
end 
if strcmp(str,'PI')
   if (M==1.4)
    TPI14=[
    0.053   2.9000  -2.6;
    0.900  -4.4000   2.7;
    1.100  -0.0061   1.8];
    a0=TPI14(:,1);
    a1=TPI14(:,2);
    a2=TPI14(:,3);
elseif (M==2)
    TPI20=[
    0.13     1.90   -1.30;
    0.90    -4.40    2.70;
    0.48     0.40   -0.17];
    a0=TPI20(:,1);
    a1=TPI20(:,2);
    a2=TPI20(:,3);
   else
    error('Wrong sensitivity M'), return
   end 
 elseif strcmp(str,'PID')
   if (M==1.4)
    TPID14=[

    0.33  -0.31  -1.00;
    0.76  -1.60  -0.36;
    0.17  -0.46  -2.10;
    0.58  -1.30   3.50];
    a0=TPID14(:,1);
    a1=TPID14(:,2);
    a2=TPID14(:,3);
   elseif (M==2)
    TPID20=[
    0.72  -1.60  1.20; 
    0.59  -1.30  0.38;
    0.15  -1.40  0.56;
    0.25  0.56 -0.12];
    a0=TPID20(:,1);
    a1=TPID20(:,2);
    a2=TPID20(:,3);
   else
    error('Wrong sensitivity M'), return
   end 
 else error('Wrong name of the controller!'), return
end  
fun=a0.*exp(a1*kappa+a2*kappa^2);
K=fun(1)*Ku;
Ti=fun(2)*Tu;
if strcmp(str,'PI')
  b=fun(3); return 
else 
  Td=fun(3)*Tu; b=fun(4);
end
