function [t_settle] = settle_time(y,r)
%SETTLE_TIME Summary of this function goes here
%   Detailed explanation goes here
bound = 0.05;
time_set = 0;
e = abs(y(:,2)-r)/r;
[N, X] = size(e);

for i = 1:N
    if (e(i) <= bound)
        if (time_set == 0 )
            time_set = 1;
            t_settle = y(i,1);
        end
    else
        time_set = 0;
    end
end

if(time_set == 0)
    t_settle = -1;
end

end

