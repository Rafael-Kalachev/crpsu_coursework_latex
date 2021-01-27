function [su] = square_control_deviation(u)

[N,X] = size(u);

us = u(N);

sum_ue2 = 0;
for i = 1:N
    sum_ue2 = sum_ue2 + (u(i) - us)^2;
end
su = sqrt((1/N)* sum_ue2);
end

