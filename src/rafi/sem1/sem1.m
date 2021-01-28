
% 1. Load the given plant
plant

% 2. Get the step response
T_sim = 90
out = sim('get_step',T_sim);
he_1  = out.he_1;


% 3. Determine Model Parameters Strejc method
[ko_cc_strejc, t_cc_strejc, l_cc_strejc] = h2Strejc(he_1, 0.9 )

%   3.1 Determine PID coeficients Strejc method
alpha_cc_strejc = (ko_cc_strejc * l_cc_strejc)/t_cc_strejc
tau_cc_strejc   = l_cc_strejc/(l_cc_strejc + t_cc_strejc)

kp_cc_strejc = (1.35 / alpha_cc_strejc )*(1 + ((0.18 * tau_cc_strejc)/ (1 - tau_cc_strejc)))
ti_cc_strejc = ((2.50 - 2.0 * tau_cc_strejc)/(1 - 0.39 * tau_cc_strejc)) * l_cc_strejc
td_cc_strejc = ((0.37 - 0.37* tau_cc_strejc)/(1 - 0.81 * tau_cc_strejc)) * l_cc_strejc

% 4. Calculate industrial PID coeficients

kp_cc_strejc_ind =  kp_cc_strejc * (ti_cc_strejc+td_cc_strejc)/ti_cc_strejc
ti_cc_strejc_ind =  ti_cc_strejc+td_cc_strejc
td_cc_strejc_ind =  (ti_cc_strejc*td_cc_strejc)/(ti_cc_strejc+td_cc_strejc)

kp_cc_strejc_ind =  (kp_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))
ti_cc_strejc_ind =  (ti_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))
td_cc_strejc_ind =  (td_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))