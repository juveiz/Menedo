function y = f1(t,u)
A = [-2 1; 1 -2];
s = length(t);
y = zeros(s*2,1);
for i=1:s
    y(2*i-1:2*i) = A*u(2*i-1:2*i) + 2*[sin(t(i));cos(t(i))-sin(t(i))];
end

