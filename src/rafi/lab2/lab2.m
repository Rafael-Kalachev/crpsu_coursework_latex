
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

% 5. Comapre Standard PID, with Standard PID better

%   5.1 Load and simulate model
t_sim = 100
out = sim('spid_antiwindup',t_sim)

figure(51)
hold on
plot(out.y_s(:,1),out.y_s(:,2),'b')
plot(out.y_b_nn(:,1),out.y_b_nn(:,2),'g')
plot(out.y_b_yn(:,1),out.y_b_yn(:,2),'r')
plot(out.y_b_yy(:,1),out.y_b_yy(:,2),'k')

legend({'standard PID','better standard PID (no windup, no saturation)',...
    'better standard PID (no windup, yes saturation)',...
    'better standard PID (yes windup, yes saturation)'},...
    'Location','southeast')
title('Compare process varible with sPID vs better sPID')
hold off
saveas(gcf,'compare_pv_spid_vs_bspid_fig.png')

figure(52)
hold on
plot(out.y_s(:,1),out.u_s,'b')
plot(out.y_b_nn(:,1),out.u_b_nn,'g')
plot(out.y_b_yn(:,1),out.u_b_yn,'r')
plot(out.y_b_yy(:,1),out.u_b_yy,'k')

legend({'standard PID','better standard PID (no windup, no saturation)',...
    'better standard PID (no windup, yes saturation)',...
    'better standard PID (yes windup, yes saturation)'},...
    'Location','northeast')
title('Compare controller output with sPID vs better sPID')
ylim([-0.1,3])
hold off
saveas(gcf,'compare_u_spid_vs_bspid_fig.png')



