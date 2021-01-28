
                                                                              < M A T L A B (R) >
                                                                    Copyright 1984-2020 The MathWorks, Inc.
                                                                    R2020b (9.9.0.1467703) 64-bit (glnxa64)
                                                                                August 26, 2020

 
To get started, type doc.
For product information, visit www.mathworks.com.
 

K =

     2


T1 =

     6


T2 =

    12


plant_1 =
 
          2
  -----------------
  72 s^2 + 18 s + 1
 
Continuous-time transfer function.


T_sim =

    90

[Warning: MATLAB has disabled some advanced graphics rendering features by switching to software OpenGL. For more information, click <a href="matlab:opengl('problems')">here</a>.] 

a_zn1 =

    0.1352


l_zn1 =

    3.2736


kp_zn1 =

    8.8745


ti_zn1 =

    6.5473


td_zn1 =

    1.6368


ko_cc_tan =

    0.9988


t_cc_tan =

   16.6298


l_cc_tan =

    3.2736


t_max_cc_tan =

   24.1809


plant_cc_tan =
 
                   0.9988
  exp(-3.27*s) * -----------
                 16.63 s + 1
 
Continuous-time transfer function.


alpha_cc_tan =

    0.1966


tau_cc_tan =

    0.1645


kp_cc_tan =

    7.1094


ti_cc_tan =

    7.5944


td_cc_tan =

    1.1676


ko_cc_strejc =

    0.9988


t_cc_strejc =

   13.4893


l_cc_strejc =

    5.5848


plant_cc_strejc =
 
                   0.9988
  exp(-5.58*s) * -----------
                 13.49 s + 1
 
Continuous-time transfer function.


alpha_cc_strejc =

    0.4135


tau_cc_strejc =

    0.2928


kp_cc_strejc =

    3.5080


ti_cc_strejc =

   12.0698


td_cc_strejc =

    1.9157


kp_chr_lo_0 =

    7.0257


ti_chr_lo_0 =

    7.8567


td_chr_lo_0 =

    1.3749


kp_chr_lo_20 =

    8.8745


ti_chr_lo_20 =

    6.5473


td_chr_lo_20 =

    1.3749


kp_chr_re_0 =

    4.4373


ti_chr_re_0 =

   24.1809


td_chr_re_0 =

    1.6368


kp_chr_re_20 =

    7.0257


ti_chr_re_20 =

   33.8533


td_chr_re_20 =

    1.5386


pids_out = 

  Simulink.SimulationOutput:
                  scope: [1x1 timeseries] 
                   tout: [69x1 double] 
            u_cc_strejc: [69x1 double] 
               u_cc_tan: [69x1 double] 
             u_chr_lo_0: [69x1 double] 
            u_chr_lo_20: [69x1 double] 
             u_chr_re_0: [69x1 double] 
            u_chr_re_20: [69x1 double] 
                  u_zn1: [69x1 double] 
            y_cc_strejc: [69x2 double] 
               y_cc_tan: [69x2 double] 
             y_chr_lo_0: [69x2 double] 
            y_chr_lo_20: [69x2 double] 
             y_chr_re_0: [69x2 double] 
            y_chr_re_20: [69x2 double] 
                  y_zn1: [69x2 double] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 


pids_out = 

  Simulink.SimulationOutput:
                  scope: [1x1 timeseries] 
                   tout: [65x1 double] 
            u_cc_strejc: [65x1 double] 
               u_cc_tan: [65x1 double] 
             u_chr_lo_0: [65x1 double] 
            u_chr_lo_20: [65x1 double] 
             u_chr_re_0: [65x1 double] 
            u_chr_re_20: [65x1 double] 
                  u_zn1: [65x1 double] 
            y_cc_strejc: [65x2 double] 
               y_cc_tan: [65x2 double] 
             y_chr_lo_0: [65x2 double] 
            y_chr_lo_20: [65x2 double] 
             y_chr_re_0: [65x2 double] 
            y_chr_re_20: [65x2 double] 
                  y_zn1: [65x2 double] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 


r =

     1


ym_zn1 =

    0.3179


sigma_zn1 =

    0.3179


ym_cc_tan =

    0.3641


sigma_cc_tan =

    0.3641


ym_cc_strejc =

    0.2132


sigma_cc_strejc =

    0.2132


ym_chr_lo_0 =

    0.3314


sigma_chr_lo_0 =

    0.3314


ym_chr_lo_20 =

    0.3595


sigma_chr_lo_20 =

    0.3595


ym_chr_re_0 =

    0.1046


sigma_chr_re_0 =

    0.1046


ym_chr_re_20 =

    0.0823


sigma_chr_re_20 =

    0.0823


r =

     1


t_settle_zn1 =

   15.2283


t_settle_cc_tan =

   13.6283


t_settle_cc_strejc =

   23.2283


t_settle_lo_0 =

   15.2283


t_settle_lo_20 =

   13.6283


t_settle_re_0 =

   16.8283


t_settle_re_20 =

   12.0283


r =

     1


se_zn1 =

    0.4426


se_cc_tan =

    0.4469


se_cc_strejc =

    0.4602


se_lo_0 =

    0.4468


se_lo_20 =

    0.4425


se_re_0 =

    0.4531


se_re_20 =

    0.4437


su_zn1 =

    3.5515


su_cc_tan =

    2.9017


su_cc_strejc =

    1.3386


su_lo_0 =

    2.8357


su_lo_20 =

    3.5925


su_re_0 =

    1.7037


su_re_20 =

    2.7389


r =

     1


gamma =

    0.6000


sue_zn1 =

    2.7863


sue_cc_tan =

    2.2917


sue_cc_strejc =

    1.1344


sue_lo_0 =

    2.2415


sue_lo_20 =

    2.8177


sue_re_0 =

    1.3953


sue_re_20 =

    2.1674


kp_cc_strejc_ind =

    2.8138


ti_cc_strejc_ind =

    9.6816


td_cc_strejc_ind =

    1.5366

