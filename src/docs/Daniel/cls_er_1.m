      % ��������� �� �������� � ���������� �� ������������
function f=cls_er_1 (pid);
      % ��������������� ��������� �� ��������� ���� ��������.
global k ti td T S
      % pid - ������ � ��������������� ��������� k, ti � td,
      % f     - ������ �� �������� � ����� �������� �� ���������� T
      %  ��� ���� �� ��������� S.         
k=pid(1); ti=pid(2); td=pid(3);
      % ���������� �� ����������� ������� � ��� s_cls_1 ���� 
      % ��������� sim � ��������� �� 0 �� T ���. 
[t,x,y]=sim ('s_cls_1', T);
      % ������� ������������� �� ������������ �� �������������
      % �������� ���� �������� �� S (��������� �����) ���. ����
      % ���������� ����������� N (N=1+T/S) �����, ����� �������
      % �������� ��� �������� �������� �� ��������a �� 
      % ������������� �� ����������� ������� �� ���������� 
e=interp1 (t, y(:,1), 0:S:T);
      % ��������� �� ��������.
f=e*(e');
      % ���� �� ���������.
end