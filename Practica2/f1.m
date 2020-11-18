function y = f1(t,u)
A = [-2 1; 1 -2];
y = A*u + 2*[sin(t);cos(t)-sin(t)];
end

