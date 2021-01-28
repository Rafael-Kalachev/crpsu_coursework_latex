
% 1. Load the given plant
plant

% 2. Get the step response
T_sim = 90
out = sim('get_step',T_sim);
he_1  = out.he_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3. Determine Model Parameters Strejc method
[ko_cc_strejc, t_cc_strejc, l_cc_strejc] = h2Strejc(he_1, 0.9 )

plant_cc_strejc = tf(ko_cc_strejc, [t_cc_strejc,1], 'OutputDelay', l_cc_strejc )

% 4. Determine PID coeficients Strejc method
alpha_cc_strejc = (ko_cc_strejc * l_cc_strejc)/t_cc_strejc
tau_cc_strejc   = l_cc_strejc/(l_cc_strejc + t_cc_strejc)

kp_cc_strejc = (1.35 / alpha_cc_strejc )*(1 + ((0.18 * tau_cc_strejc)/ (1 - tau_cc_strejc)))
ti_cc_strejc = ((2.50 - 2.0 * tau_cc_strejc)/(1 - 0.39 * tau_cc_strejc)) * l_cc_strejc
td_cc_strejc = ((0.37 - 0.37* tau_cc_strejc)/(1 - 0.81 * tau_cc_strejc)) * l_cc_strejc

% 5. Tune with the TAU method 

M = 1.4
[kp_tau,ti_tau,td_tau,b_tau]=PIDtun_AHtau(ko_cc_strejc,t_cc_strejc,l_cc_strejc,'PID',M)

N_tau    = 10
tf_tau   = td_tau / N_tau
c_tau    = 0.3
tt_tau   = sqrt(ti_tau+td_tau)

% 6. Tune with Kappa method

%   6.1 Use model Get_param_Ku_Tu to obtain parameters
d  = 4
A  = 0.2479/2
Ku = 4*d/(pi*A)
Tu = 7.05

%   6.2 Tune PID
M = 1.4
[kp_kap, ti_kap, td_kap, b_kap] =PIDtun_AHkap(K,Ku,Tu,'PID',M)

N_kap  = 10
tf_kap = td_kap / N_kap
c_kap  = 0.4
tt_kap = sqrt(ti_kap+td_kap)




% 7. P-S-T PID
t0 =6
[P_kap,S_kap,T_kap]=dpid_PST(kp_kap,ti_kap,td_kap,b_kap,c_kap,tf_kap,0.5,0.5,t0)

[P_tau,S_tau,T_tau]=dpid_PST(kp_tau,ti_tau,td_tau,b_tau,c_tau,tf_tau,0.5,0.5,t0)

