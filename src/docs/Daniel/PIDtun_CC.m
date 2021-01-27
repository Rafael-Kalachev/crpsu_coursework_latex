function [K,Ti,Td]=PIDtun_CC(Ko,T,L,str)
% Предназначение
% Настройване на П, ПИ и ПИД регулатори по методa на Cohen-Coon
% чрез три-параметричен модел 
% W(p)=Ko/(1+Tp)*e^(-Lp).
% Входни аргументи: 
% Ko – коефициент на усилване (скалар);
% T – времеконстанта (скалар);
% L – чисто закъснение (скалар).
% str – символна променлива за типа на
% регулатора (скалар),
%   str = ‘П’ – настройване на П регулатор;
%   str = ‘ПИ’ – настройване на ПИ регул.;
%   str = ‘ПИД’ – настройване на ПИД регул.;
% Изходни аргументи: 
% K – коеф. на усилване на регул.(скалар);
% Ti – интегр. времеконстанта (скалар);
% Td – дифер. времеконстанта (скалар).
if nargin<4
 error('Don''t miss the 4th input argument!'), return,
end
alfa=Ko*L/T; tau=L/(L+T); 
if strcmp(str,'P')
     K=(1+0.35*tau/(1-tau))/alfa;
 elseif strcmp(str,'PI')
     K=0.9*(1+0.92*tau/(1-tau))/alfa;
     Ti=L*(3.3-3*tau)/(1+1.2*tau);
 elseif strcmp(str,'PID')
     K=1.35*(1+0.18*tau/(1-tau))/alfa;
     Ti=L*(2.5-2*tau)/(1-0.39*tau);
     Td=L*(0.37-0.37*tau)/(1-0.81*tau);
 else error('Wrong name of the controller!')
end
