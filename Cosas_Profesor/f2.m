function y = f2(t,u)
%
% Variables entrada
%   t vector s
%   u vector columna de tamaño 2s
%
% Variables salida
%   y vector columna de tamaño 2s
%
s=length(t);
y=zeros(s*2,1);
for i=1:s
    y(2*i-1:2*i)= [-2 1;998 -999]*u(2*i-1:2*i) + [2*sin(t(i));999*(cos(t(i))-sin(t(i)))];
end
end

