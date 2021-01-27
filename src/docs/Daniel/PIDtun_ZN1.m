function [K,Ti,Td]=PIDtun_ZN1(a,L,str)
% ��������������
% ����������� �� �, �� � ��� ���������� �� �����a �� Ziegler-Nichols
% ���� ���-������������ ����� �� ������
%  W(p)=a/L*e^(-Lp)
% ������ ���������: 
% � � ���������� (������);
% L � ����� ���������� (������);
% str � �������� ���������� �� ���� �� 
% ���������� (������),
%  str = �ϒ � ����������� �� � ���������;
%  str = ��Ȓ � ����������� �� �� �����.;
%  str = ���Ē � ����������� �� ��� �����.;	% ������� ���������: 
% K � ����. �� �������� �� �����.(������);
% Ti � ������. ��������������(������);
% Td � �����. �������������� (������).
if nargin<3
   error('Don''t miss the third input argument!'), return,
end 
if strcmp(str,'P')        K=1/a;
   elseif strcmp(str,'PI')  K=0.9/a; Ti=3*L;
   elseif strcmp(str,'PID') K=1.2/a; Ti=2*L; Td=L/2;
   else error('Wrong name of the controller!')
end
