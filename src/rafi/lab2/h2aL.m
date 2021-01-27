function [a,L]=h2aL(he)
% Approximation of a transient characteristic
% with a two-parameter model
% W(s) = (a / (L * s)) * e^(-L * s)

% Determining the inflection point
[n,m]=size(he);
for i=1:n-2
  ind=infl_ind(he(i,:),he(i+1,:),he(i+2,:));
  if (ind==2) | (ind==3)
   ipn=i;
   break;
  end
end

% Calculate the coefficients of
% tangents y = coefi (1) * x coefi (2) 
x1=[he(ipn-1,1) he(ipn,1) he(ipn+1,1)];
y1=[he(ipn-1,2) he(ipn,2) he(ipn+1,2)];
coef1=polyfit(x1,y1,1);

x2=[he(ipn,1) he(ipn+1,1) he(ipn+2,1)];
y2=[he(ipn,2) he(ipn+1,2) he(ipn+2,2)];
coef2=polyfit(x2,y2,1);

% Averaging the two tangents 
coef=(coef1+coef2)/2;

%Coordinates of intersection with the x axis 
coor1(1)=-coef(2)/coef(1);
coor1(2)=0;

figure(31)
% Draws the transitient characteristic 
plot(he(:,1),he(:,2),'b-'), hold on, grid

% Notes the coordinates of
% inflection points 
x_infl=(he(ipn,1)+he(ipn+1,1))/2;
y_infl=(he(ipn,2)+he(ipn+1,2))/2;
plot(x_infl,y_infl,'*'); 

% Draws the tangent 
line([0 x_infl],[coef(2) y_infl]);

% Draws the x axis
line([0 he(n,1)],[0 0]);	

% Notes the points of intersection
% of the tangent line
plot(coor1(1),coor1(2),'o'); % with the x axis
plot(0,coef(2),'o'); % with the y axis

title('Zigler-Nichols Method 1')
hold off
saveas(gcf,'h2aL_fig.png')

%Return the parameters
a=abs(coef(2)); L=coor1(1);
