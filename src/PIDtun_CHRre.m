function [K,Ti,Td]= PIDtun_CHRre(a,L,T,str,sigma)
if nargin<4
error('Don''t miss the fourth input argument!'),
return,
end
if nargin<5
disp('You choose 0% overshoot!'), sigma=0,
end
if strcmp(str,'P')
if(sigma==0)
K=0.3/a;
else
K=0.7/a;
end
elseif strcmp(str,'PI')
if(sigma==0)
K=0.35/a; Ti=1.2*T;
else
K=0.6/a; Ti=T;
end
elseif strcmp(str,'PID')
if(sigma==0)
K=0.6/a; Ti=T;
Td=0.5*L;
else
K=0.95/a; Ti=1.4*T; Td=0.47*L;
end
else error('Wrong name of the controller!')
end
