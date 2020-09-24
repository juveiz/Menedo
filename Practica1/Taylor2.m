function [u,t]=Taylor2(f,df,Df,T,t0,N,u0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci´on resuelve el problema de valor inicial
% u’=f(t,u)
% u(t0)=u0
% utilizandodo un m´etodo de Taylor de orden 2
%
% [u,t]=Taylor2(f,df,Df,T,t0,N,u0,b,c,A)
%
% Variables de Entrada:
% f: vector columna. funci´on que rige el sistema de EDO,
% tiene dos argumentos f(t,x) donde t es escalar
% y x vector columna.
% df: vector columna. funci´on derivada parcial con respecto,
% al tiempo de f, tiene dos argumentos df(t,x) donde
% t es escalar y x vector columna.
% Df: matriz cuadrada. funci´on jacobiano con respecto a x de
% f, tiene dos argumentos Df(t,x) donde t es escalar
% y x vector columna.
% N: n´umero de pasos en los que dividimos el intervalo de
% integraci´on
% t0: tiempo inicial
% T: tiempo final
% u0: vector columna, dato inicial
%
% Variables de Salida:
% u: matriz de length(u0) x length(t) que contiene la soluci´on
% t: vector de tiempos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% primera etapa, preparar las variables para abordar el algoritmo
h = (T -t0)/N;
% vector de tiempos
t = [t0:h:T];
% matriz solucion numerica
u = zeros(length(u0),N+1);
% incorporamos el dato inicial en mi solucion numerica
u(:,1) = u0;

% segunda etapa, aplicar el algoritmo de euler
% u(n+1) = u(n) + h*f(t(n),u(n))
%
for n=1:N
    u(:,n+1) = u(:,n) + h*f(t(n),u(:,n)) + h^2/2*df(t(n),u(:,n)) + h^2/2*Df(t(n),u(:,n))*f(t(n),u(:,n));
end
end