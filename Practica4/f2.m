function y = f2(t,u)
A = [-2 1; 998 -999];
s = length(t);
y = zeros(s*2,1);
for i=1:s
    y(2*i-1:2*i) = A*u(2*i-1:2*i) + [2*sin(t(i));999*(cos(t(i))-sin(t(i)))];
end

