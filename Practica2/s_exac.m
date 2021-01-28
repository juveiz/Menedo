function u = s_exac(t)
%
% Variables entrada
%   t vector fila de tamaño N+1
%
% Variables salida
%   u matriz  de tamaño de 2x(N+1)
%
u= [2*exp(-t)+sin(t);2*exp(-t)+cos(t)];
end

