M = 1.4
[K_1,Ti_1,Td_1,b_1]=PIDtun_AHtau(ko_1,t_1,l_1,'PID',M)

N    = 10
Tf_1 = Td / N
c_1  = 0.3
Tt_1 = sqrt(Ti_1+Td_1)