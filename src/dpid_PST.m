function [P,S,T]=dpid_PST(Kp,Ti,Td,b,c,Tf,gi,gd,T0) 

Ki=Kp*T0/Ti;
Kd=Kp*Td/T0;

bi1=Ki*gi; 
bi2=Ki*(1-gi);

gf=gd+Tf/T0; 
bd=Kd/gf;
p2=1-1/gf; p1=-1-p2; P=[1 p1 p2];

ad=p2;
t0=Kp*b+bi1+bd*c;
t1=-Kp*b*(1+ad)-bi1*ad+bi2-2*bd*c;
t2=Kp*b*ad-bi2*ad+bd;
T=[t0 t1 t2];

s0=Kp+bi1+bd;
s1=-Kp*(1+ad)-bi1*ad+bi2-2*bd;
s2=Kp*ad-bi2*ad+bd; 
S=[s0 s1 s2];
end