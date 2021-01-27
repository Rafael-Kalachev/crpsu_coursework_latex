function [K,Ti,Td]= PIDtun_CHRlo(a,L,str,sigma)
% Предназначение
% Настройване на П, ПИ и ПИД регулатори
% по методa на Chien- Hrones-Reswick
% за компенсиране на товарното смущение
% чрез дву-параметричен моде лна обекта
% W(p)=a/L*e^(-Lp).
% Входни аргументи:
% а – коефициент (скалар);
% L – чисто закъснение (скалар);
% str – символна променлива за типа на
% регулатора (скалар),
% str = ‘П’ – настройване на П регулатор;
% str = ‘ПИ’ – настройване на ПИ регулатор;
% str = ‘ПИД’ – настройване на ПИД регул.;
% sig – желано пререгулиране в САУ (скалар),
%sig = 0 – няма пререгулиране;
%sig =~ 0 – 20 процента пререгулиране.
% Изходни аргументи:
% K – коеф. на усилване на регул.(скалар);
% Ti – интегр. времеконстанта(скалар);
% Td – дифер. времеконстанта (скалар).
if nargin<3
error('Don''t miss the third input argument!'),
return,
end

if nargin<4
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
K=0.6/a; Ti=4*L;
else
K=0.7/a; Ti=2.3*L;
end
elseif strcmp(str,'PID')
if(sigma==0)
K=0.95/a; Ti=2.4*L; Td=0.42*L;
else
K=1.2/a; Ti=2*L; Td=0.42*L;
end
else error('Wrong name of the controller!')
end
