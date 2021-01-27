function [ym, sigma] = max_sigma(y,r)
% ym - max dynamic deviation
% sigma
y_max = max(y(:,2));

ym    = y_max-r;
sigma = ym/r;
end

