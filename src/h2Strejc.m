function [Ko,T,L]=h2Strejc(he,p)

[n,m]=size(he);
for i=1:n-1
   if(he(i+1,2)>he(i,2))
      Lapparent=i;
      break
   end
end

for i=Lapparent:n-2
  ind=infl_ind(he(i,:),he(i+1,:),he(i+2,:));	
if (ind==2) | (ind==3)
     ipn=i;
     break;
  end
end 
figure(30)
hold on
plot(he(:,1),he(:,2),'b-'), hold on, grid
ta=(he(ipn,1)+he(ipn+1,1))/2; ha=(he(ipn,2)+he(ipn+1,2))/2;
plot(ta,ha,'*'); 

Ko=he(n,2);
hb=p*Ko; tb=interp1(he(Lapparent+1:n,2), he(Lapparent+1:n,1),hb);
plot(tb,hb,'*'); 
title('Strejc Method')
hold off
saveas(gcf, 'h2Strejc.png')
lb=log(1-hb); la=log(1-ha);
L=(ta*lb-tb*la)/(lb-la);
T=(L-tb)/lb;
