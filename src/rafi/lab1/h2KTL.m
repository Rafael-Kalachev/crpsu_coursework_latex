function [Ko,T,L,Tmax]=h2KTL(he)
% Approximation of a transient characteristic 
% in a three-parameter model 
% W(s) = (Ko / (1 + T*s)) * e^(-L * s) 
% by the tangent method

% Input Parameters: 
% he - transient function (vector).
% Output arguments:
% Ko - gain (scalar);
% T - time constant (scalar);
% L - pure delay (scalar);
% Tmax - maximum time constant (scalar);

% Determination of the apparent delay 
[n,m]=size(he);
for i=1:n-1
   if(he(i+1,2)>he(i,2))
      Lapparent=i;
      break
   end
end

% Determination of the inflection point 
for i=Lapparent:n-2
  ind=infl_ind(he(i,:),he(i+1,:),he(i+2,:));
  if (ind==2) | (ind==3)
     ipn=i;
     break;
  end
end

% Calculate the coefficients of the tangents y = coefi (1) * x coefi (2) )
x1=[he(ipn-1,1) he(ipn,1) he(ipn+1,1)]; y1=[he(ipn-1,2) he(ipn,2) he(ipn+1,2)];
coef1=polyfit(x1,y1,1);
x2=[he(ipn,1) he(ipn+1,1) he(ipn+2,1)];y2=[he(ipn,2) he(ipn+1,2) he(ipn+2,2)];
coef2=polyfit(x2,y2,1);	

% Averaging of the two tangents 
coef=(coef1+coef2)/2;

% Coordinates of the intersection with the x axis
coor1(1)=-coef(2)/coef(1); coor1(2)=0;

% Coordinates of the intersection point with the set value 
coor2(1)=(he(n,2)-coef(2))/coef(1); coor2(2)=he(n,2);

% Draws the transitient function 
figure(41)
plot(he(:,1),he(:,2),'b-'), hold on, grid

% Notes the coordinates of the inflection point 
x_infl=(he(ipn,1)+he(ipn+1,1))/2; y_infl=(he(ipn,2)+he(ipn+1,2))/2;
plot(x_infl,y_infl,'*'); 

%Draws the tangent 
line([coor1(1) coor2(1)],[coor1(2) coor2(2)]);	

% Draws the set value 
line([0 he(n,1)],[he(n,2) he(n,2)]);

% Draws the x axis
line([0 he(n,1)],[0 0]);

% Notes the coordinates of the intersections of the tangent 
plot(coor2(1),coor2(2),'o'); % with the set value
plot(coor1(1),coor1(2),'o'); % with the x axis
title('Cohen-Coon Tangent Method')
hold off
saveas(gcf,'h2KTL_fig.png')



% Determining model parameters

% Gain 
Ko=coor2(2);

% Time constant
T=interp1(he(Lapparent+1:n,2), he(Lapparent+1:n,1),0.63*Ko)-coor1(1);

% Delay
L=coor1(1);

% Maximum time constant 
Tmax=coor2(1)-coor1(1);

