
% 1. Load the given plant
plant

% 2. Get the step response
T_sim = 90
out = sim('get_step',T_sim);
he_1  = out.he_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3. Zigler-Nichols method 1 for PID tuning

%   3.1 Determine Model parameters
[a_zn1, l_zn1]= h2aL(he_1)

%   3.2 Determine PID coeficients
kp_zn1 = 1.2 / a_zn1
ti_zn1 = 2 * l_zn1
td_zn1 = l_zn1 / 2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4. Cohen-Coon method for PID tuning

%   4.1 Determine Model Parameters tangent method
[ko_cc_tan, t_cc_tan, l_cc_tan, t_max_cc_tan] = h2KTL(he_1)

plant_cc_tan = tf(ko_cc_tan, [t_cc_tan,1], 'OutputDelay', l_cc_tan )

figure(42)
plot(he_1(:,1), he_1(:,2),'r') 
hold on
step(plant_cc_tan)
legend({'plant','Tangent method'},'Location','northeast')
title('Compare Tangent method')
hold off
saveas(gcf,'compare_tan_fig.png')

%   4.2 Determine PID coeficients tangent method
alpha_cc_tan = (ko_cc_tan * l_cc_tan)/t_cc_tan
tau_cc_tan   = l_cc_tan/(l_cc_tan + t_cc_tan)

kp_cc_tan = (1.35 / alpha_cc_tan )*(1 + ((0.18 * tau_cc_tan)/ (1 - tau_cc_tan)))
ti_cc_tan = ((2.50 - 2.0 * tau_cc_tan)/(1 - 0.39 * tau_cc_tan)) * l_cc_tan
td_cc_tan = ((0.37 - 0.37* tau_cc_tan)/(1 - 0.81 * tau_cc_tan)) * l_cc_tan


%   4.3 Determine Model Parameters Strejc method
[ko_cc_strejc, t_cc_strejc, l_cc_strejc] = h2Strejc(he_1, 0.9 )

plant_cc_strejc = tf(ko_cc_strejc, [t_cc_strejc,1], 'OutputDelay', l_cc_strejc )

figure(43)
plot(he_1(:,1), he_1(:,2),'r') 
hold on
step(plant_cc_strejc)
legend({'plant','Strejc method'},'Location','northeast')
title('Compare Strejc method')
hold off
saveas(gcf,'compare_strejc_fig.png')

%   4.4 Determine PID coeficients Strejc method
alpha_cc_strejc = (ko_cc_strejc * l_cc_strejc)/t_cc_strejc
tau_cc_strejc   = l_cc_strejc/(l_cc_strejc + t_cc_strejc)

kp_cc_strejc = (1.35 / alpha_cc_strejc )*(1 + ((0.18 * tau_cc_strejc)/ (1 - tau_cc_strejc)))
ti_cc_strejc = ((2.50 - 2.0 * tau_cc_strejc)/(1 - 0.39 * tau_cc_strejc)) * l_cc_strejc
td_cc_strejc = ((0.37 - 0.37* tau_cc_strejc)/(1 - 0.81 * tau_cc_strejc)) * l_cc_strejc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5. Zigler Nichols Method 2 for PID Tuning

%   5.1 Determine critical Gain and Oscilation period
% g_crit_zn2 = NONE
% t_crit_zn2 = NONE

%   5.2 Determine PID coeficients (Zigler-Nichols Method 2)

% kp_zn2 = 0.6   * g_crit_zn2
% ti_zn2 = 0.5   * t_crit_nz2
% td_zn2 = 0.125 * t_crit_zn2


% 6. CHR pid Tuning

[kp_chr_lo_0, ti_chr_lo_0, td_chr_lo_0] = PIDtun_CHRlo(a_zn1,l_zn1, 'PID', 0)

[kp_chr_lo_20, ti_chr_lo_20, td_chr_lo_20] = PIDtun_CHRlo(a_zn1,l_zn1, 'PID', 20)

[kp_chr_re_0, ti_chr_re_0, td_chr_re_0] = PIDtun_CHRre(a_zn1,l_zn1, t_max_cc_tan, 'PID', 0)

[kp_chr_re_20, ti_chr_re_20, td_chr_re_20] = PIDtun_CHRre(a_zn1,l_zn1,t_max_cc_tan, 'PID', 20)


% 7. Compare PIDs

%   7.1 Compare PIDs time series
pids_out = sim('compare_pids', 130)

figure(71)
hold on
plot(pids_out.y_zn1(:,1), pids_out.y_zn1(:,2), 'b')
plot(pids_out.y_cc_tan(:,1), pids_out.y_cc_tan(:,2), 'r')
plot(pids_out.y_cc_strejc(:,1), pids_out.y_cc_strejc(:,2), 'k')
plot(pids_out.y_chr_lo_0(:,1), pids_out.y_chr_lo_0(:,2), '--')
plot(pids_out.y_chr_lo_20(:,1), pids_out.y_chr_lo_20(:,2), 'g')
plot(pids_out.y_chr_re_0(:,1), pids_out.y_chr_re_0(:,2), 'm')
plot(pids_out.y_chr_re_20(:,1), pids_out.y_chr_re_20(:,2), '.')
legend({'Zigler-Nichols1','Choen-Coon tangent', 'Choen-Coon Strejc',...
    'CHR lo 0%', 'CHR lo 20%', 'CHR re 0%', 'CHR re 20%' }, ...
    'Location','southeast')
title('Compare PID controlled process variable')
hold off
saveas(gcf, 'compare_pids_y_fig.png')

figure(72)
hold on
plot(pids_out.y_zn1(:,1), pids_out.u_zn1(:), 'b')
plot(pids_out.y_cc_tan(:,1), pids_out.u_cc_tan(:), 'r')
plot(pids_out.y_cc_strejc(:,1), pids_out.u_cc_strejc(:), 'k')
plot(pids_out.y_chr_lo_0(:,1), pids_out.u_chr_lo_0(:), '--')
plot(pids_out.y_chr_lo_20(:,1), pids_out.u_chr_lo_20(:), 'g')
plot(pids_out.y_chr_re_0(:,1), pids_out.u_chr_re_0(:), 'm')
plot(pids_out.y_chr_re_20(:,1), pids_out.u_chr_re_20(:), '.')
legend({'Zigler-Nichols1','Choen-Coon tangent', 'Choen-Coon Strejc',...
    'CHR lo 0%', 'CHR lo 20%', 'CHR re 0%', 'CHR re 20%' }, ...
    'Location','southeast')
title('Compare PID controller output')
hold off
saveas(gcf, 'compare_pids_u_fig.png')

%   7.2 Compare max Sigma
pids_out = sim('compare_pids2', 80)
r = 1
[ym_zn1       , sigma_zn1]        = max_sigma(pids_out.y_zn1,       r)
[ym_cc_tan    , sigma_cc_tan]     = max_sigma(pids_out.y_cc_tan,    r)
[ym_cc_strejc , sigma_cc_strejc]  = max_sigma(pids_out.y_cc_strejc, r)
[ym_chr_lo_0  , sigma_chr_lo_0]   = max_sigma(pids_out.y_chr_lo_0,  r)
[ym_chr_lo_20 , sigma_chr_lo_20]  = max_sigma(pids_out.y_chr_lo_20, r)
[ym_chr_re_0  , sigma_chr_re_0]   = max_sigma(pids_out.y_chr_re_0,  r)
[ym_chr_re_20 , sigma_chr_re_20]  = max_sigma(pids_out.y_chr_re_20, r)

%   7.3 Comapre settling time

r = 1
[t_settle_zn1]        = settle_time(pids_out.y_zn1,       r)
[t_settle_cc_tan]     = settle_time(pids_out.y_cc_tan,    r)
[t_settle_cc_strejc]  = settle_time(pids_out.y_cc_strejc, r)
[t_settle_lo_0]       = settle_time(pids_out.y_chr_lo_0,  r)
[t_settle_lo_20]      = settle_time(pids_out.y_chr_lo_20, r)
[t_settle_re_0]       = settle_time(pids_out.y_chr_re_0,  r)
[t_settle_re_20]      = settle_time(pids_out.y_chr_re_20, r)

%   7.4 Compare sqare error
r = 1
[se_zn1]        = square_error(pids_out.y_zn1,       r)
[se_cc_tan]     = square_error(pids_out.y_cc_tan,    r)
[se_cc_strejc]  = square_error(pids_out.y_cc_strejc, r)
[se_lo_0]       = square_error(pids_out.y_chr_lo_0,  r)
[se_lo_20]      = square_error(pids_out.y_chr_lo_20, r)
[se_re_0]       = square_error(pids_out.y_chr_re_0,  r)
[se_re_20]      = square_error(pids_out.y_chr_re_20, r)

%   7.4 Compare sqare control deviation

[su_zn1]        = square_control_deviation(pids_out.u_zn1)
[su_cc_tan]     = square_control_deviation(pids_out.u_cc_tan)
[su_cc_strejc]  = square_control_deviation(pids_out.u_cc_strejc)
[su_lo_0]       = square_control_deviation(pids_out.u_chr_lo_0)
[su_lo_20]      = square_control_deviation(pids_out.u_chr_lo_20)
[su_re_0]       = square_control_deviation(pids_out.u_chr_re_0)
[su_re_20]      = square_control_deviation(pids_out.u_chr_re_20)


%   7.4 Compare weighted quare quality coeficient
r = 1
gamma = 0.6
[sue_zn1]        = weighted_sqare_quality(pids_out.y_zn1,pids_out.u_zn1,r,gamma)
[sue_cc_tan]     = weighted_sqare_quality(pids_out.y_cc_tan,pids_out.u_cc_tan,r,gamma)
[sue_cc_strejc]  = weighted_sqare_quality(pids_out.y_cc_strejc,pids_out.u_cc_strejc,r,gamma)
[sue_lo_0]       = weighted_sqare_quality(pids_out.y_chr_lo_0,pids_out.u_chr_lo_0,r,gamma)
[sue_lo_20]      = weighted_sqare_quality(pids_out.y_chr_lo_20,pids_out.u_chr_lo_20,r,gamma)
[sue_re_0]       = weighted_sqare_quality(pids_out.y_chr_re_0,pids_out.u_chr_re_0,r,gamma)
[sue_re_20]      = weighted_sqare_quality(pids_out.y_chr_re_20,pids_out.u_chr_re_20,r,gamma)

% 8. Form standard PID to industrial PID
kp_cc_strejc_ind =  (kp_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))
ti_cc_strejc_ind =  (ti_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))
td_cc_strejc_ind =  (td_cc_strejc/2) * (1+sqrt(1-4*td_cc_strejc/ti_cc_strejc))