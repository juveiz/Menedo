function y = SIR(t,u)
%
% Variables entrada
%   t escalar
%   u=[S;I;R] vector columna de tamaño 3
%
% Variables salida
%   y vector columna de tamaño 3
%
% Defino variables para mi función
a=0.5;
b=0.005*a;
y= [-b*u(1)*u(2);b*u(1)*u(2)-a*u(2);a*u(2)];
end

