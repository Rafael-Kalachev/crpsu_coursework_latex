function [sig_max] = max_preregulirane(y, r)
% r e ustanovena nachalna stoinost%
y_max = max(y);
sig_max=y_max-r;
end

