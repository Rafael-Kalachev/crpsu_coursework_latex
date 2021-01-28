function [seu] = weighted_sqare_quality(y,u,r,gamma)

[N,X] = size(u);

us = u(N);

sum_ue2 = 0;
for i = 1:N
    sum_ue2 = sum_ue2 +(y(i,2) - r)^2  + gamma * (u(i) - us)^2;
end

seu = sqrt(sum_ue2/N);


end

