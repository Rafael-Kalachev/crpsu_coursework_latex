function [a,L]=h2aL(he)
%
% Апроксимиране на преходна характе-
% ристика с  дву-параметричен модел
%
% Определяне на инфлексната точка
[n,m]=size(he);
for i=1:n-2
  ind=infl_ind(he(i,:),he(i+1,:),he(i+2,:));
  if (ind==2) | (ind==3)
   ipn=i;
   break;
  end
end
% Изчислява коефициентите на 
% допирателните y=coefi(1)*x+coefi(2)
x1=[he(ipn-1,1) he(ipn,1) he(ipn+1,1)];
y1=[he(ipn-1,2) he(ipn,2) he(ipn+1,2)];
coef1=polyfit(x1,y1,1);
x2=[he(ipn,1) he(ipn+1,1) he(ipn+2,1)];
y2=[he(ipn,2) he(ipn+1,2) he(ipn+2,2)];
coef2=polyfit(x2,y2,1);
% Осредняване на двете допирателни
coef=(coef1+coef2)/2;
% Координати на пресечната точка с 
% абцисата
coor1(1)=-coef(2)/coef(1);
coor1(2)=0;
% Изчертава преходната характеристика
plot(he(:,1),he(:,2),'b-'), hold on, grid
% Отбелязва координатите на 
% инфлексната точки
x_infl=(he(ipn,1)+he(ipn+1,1))/2;
y_infl=(he(ipn,2)+he(ipn+1,2))/2;
plot(x_infl,y_infl,'*'); 
% Изчертава допирателната
line([0 x_infl],[coef(2) y_infl]);
% Изчертава абцисната ос
line([0 he(n,1)],[0 0]);	
% Отбелязва координатите на пресеч-
% ните точки на допирателната
plot(coor1(1),coor1(2),'o'); % (с абцисата)
plot(0,coef(2),'o'); % (с ординатата)
hold off
a=abs(coef(2)); L=coor1(1);
