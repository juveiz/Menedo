function y = sir(t,u)
a = 0.5;
b = 0.005 * a;

y = [-b * u(1) * u(2);b * u(1) * u(2) - a * u(2);a * u(2)];
end

