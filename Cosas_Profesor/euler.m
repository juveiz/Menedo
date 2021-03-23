function [u,t]=euler(f,N,t0,T,u0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta función resuelve el problema de valor inicial en [t0,T]
%           U'=f(t,U)
%           U(t0)=u0
% utilizando el método de Euler
%
% [u,t]=euler(f,N,t0,T,u0)
%
% Variables de Entrada:
% f: vector columna. función que rige el sistema de EDO,
%    tiene dos argumentos f(t,x) donde t es escalar
%    y x vector columna.
% N: número de pasos en los que dividimos el intervalo de
%    integración
% t0: tiempo inicial
% T: tiempo final
% u0: vector columna. Dato inicial
%
% Variables de Salida:
% u: matriz de length(u0) x N+1 que contiene la solución
% t: vector de tiempos, de tamaño N+1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% primera etapa, preparar las variables para abordar el algoritmo
% paso equidistante
h=(T-t0)/N;
% vector de tiempos
t=[t0:h:T];
% matriz solución numérica
u=zeros(length(u0),N+1);
%incorporando el dato inicial en mi solución numérica
u(:,1)=u0;
%
% segunda etapa, aplicar algoritmo euler
%  u(n+1)=u(n)+h*f(t(n),u(n))
for n=1:N
    u(:,n+1)=u(:,n)+h*f(t(n),u(:,n));
end
%
% tercera etapa, preparar los datos de salidad
%
end