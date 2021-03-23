function y = f1(t,u)
%
% Variables entrada
%   t escalar
%   u vector columna de tamaño 2
%
% Variables salida
%   y vector columna de tamaño 2
%
A=[-2 1;1 -2];
y= A*u + 2*[sin(t);cos(t)-sin(t)];
end

