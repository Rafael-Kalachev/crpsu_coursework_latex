function [K,Ti,Td]=PIDtun_ZN1(a,L,str)
% Предназначение
% Настройване на П, ПИ и ПИД регулатори по методa на Ziegler-Nichols
% чрез дву-параметричен модел на обекта
%  W(p)=a/L*e^(-Lp)
% Входни аргументи: 
% а – коефициент (скалар);
% L – чисто закъснение (скалар);
% str – символна променлива за типа на 
% регулатора (скалар),
%  str = ‘П’ – настройване на П регулатор;
%  str = ‘ПИ’ – настройване на ПИ регул.;
%  str = ‘ПИД’ – настройване на ПИД регул.;	% Изходни аргументи: 
% K – коеф. на усилване на регул.(скалар);
% Ti – интегр. времеконстанта(скалар);
% Td – дифер. времеконстанта (скалар).
if nargin<3
   error('Don''t miss the third input argument!'), return,
end 
if strcmp(str,'P')        K=1/a;
   elseif strcmp(str,'PI')  K=0.9/a; Ti=3*L;
   elseif strcmp(str,'PID') K=1.2/a; Ti=2*L; Td=L/2;
   else error('Wrong name of the controller!')
end
