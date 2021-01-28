
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


t_sim =

   100

[Warning: Solver is encountering difficulty in simulating model 'spid_antiwindup' at time 1.0000000000000036. Simulink will continue to simulate with warnings. Please check the
model for errors.] 
[> In lab2 (line 29)
In run (line 91)] 
[Warning: Solver was unable to reduce the step size without violating minimum step size of 3.55271e-15 for 1 consecutive times at time 1.  Solver will continue simulation with the
step size restricted to 3.55271e-15 and using an effective relative error tolerance of 0.0135238, which is greater than the specified relative error tolerance of 0.001. This
usually may be caused by the high stiffness of the system. Please check the system or increase the solver Number of consecutive min steps violation parameter.] 
[> In lab2 (line 29)
In run (line 91)] 

out = 

  Simulink.SimulationOutput:
                   tout: [115x1 double] 
                 u_b_nn: [115x1 double] 
                 u_b_yn: [115x1 double] 
                 u_b_yy: [115x1 double] 
                    u_s: [115x1 double] 
                 y_b_nn: [115x2 double] 
                 y_b_yn: [115x2 double] 
                 y_b_yy: [115x2 double] 
                    y_s: [115x2 double] 

     SimulationMetadata: [1x1 Simulink.SimulationMetadata] 
           ErrorMessage: [0x0 char] 

