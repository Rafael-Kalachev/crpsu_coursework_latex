function [sq_err] = square_error(y,r)

[N,X] = size(y);

sum_e2 = 0;
for i = 1:N
    sum_e2 = sum_e2 + (y(i,2) - r)^2;
end

sq_err = sqrt((1/N)* sum_e2);

end

