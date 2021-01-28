function [bi1,bi2,bd,ad]=dpid_Uni(Kp,Ti,Td,Tf,gi,gd,T0)

Ki=Kp*T0/Ti;
Kd=Kp*Td/T0;
bi1=Ki*gi; bi2=Ki*(1-gi);
gf=gd+Tf/T0; bd=Kd/gf;
ad=1-1/gf;
end