K   = 2
T1  = 6
T2  = 12

% This is the given plant
plant_1 = tf([K], conv([T1,1],[T2,1])) 
