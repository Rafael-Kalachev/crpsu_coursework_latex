function [K,Ti,Td]= PIDtun_CHRre(a,L,T,str,sigma)
% Предназначение
% Настройване на П, ПИ и ПИД регулатори
% по методa на Chien-Hrones-Reswick
% за компенсиране на заданието чрез дву-
% парам. модел на обекта W(p)=a/L*e^(-Lp)
% и времеконстантата на три-парам. модел
% W(p)=Ko/(1+Tp)*e^(-Lp).
% Входни аргументи:
% а – коефициент (скалар);
% L – чисто закъснение (скалар);
% T – времеконстанта (скалар);
% str – символна променлива за типа на
% регулатора (скалар),
% str = ‘П’ – настройване на П регулатор;
% str = ‘ПИ’ – настройване на ПИ регулатор;
% str = ‘ПИД’ – настройване на ПИД регул.;
% sig – желано пререгулиране в САУ (скалар),
%sigma = 0 – няма пререгулиране;
%sigma =~ 0 – 20 процента пререгулиране.
% Изходни аргументи:
% K – коеф. на усилване на регул. (скалар);
% Ti – интегр. времеконстанта (скалар);
% Td – дифер. времеконстанта (скалар).
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