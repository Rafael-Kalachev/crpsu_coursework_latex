M = 1.4
[Kp, Ti, Td, b] =PIDtun_AHkap(K,Ku,Tu,'PID',M)

N  = 10
Tf = Td / N
c  = 0.4
Tt = sqrt(Ti+Td)
