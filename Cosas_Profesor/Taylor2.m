function [u,t]=Taylor2(f,df,Jf,T,t0,N,u0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta función resuelve el problema de valor inicial
% Y'=f(t,Y)
% Y(t0)=Y0
% utilizandodo un método de Taylor de orden 2
%
% [u,t]=Taylor2(f,df,Jf,T,t0,N,u0)
%
% Variables de Entrada:
% f: vector columna. función que rige el sistema de EDO,
%    tiene dos argumentos f(t,x) donde t es escalar
%    y x vector columna.
% df: vector columna. función derivada parcial con respecto,
%     al tiempo de f, tiene dos argumentos df(t,x) donde
%     t es escalar y x vector columna.
% Jf: matriz cuadrada. función jacobiano con respecto a las derivadas en x
%     de f, tiene dos argumentos Df(t,x) donde t es escalar
%     y x vector columna.
% N: número de pasos en los que dividimos el intervalo de
%    integración
% t0: tiempo inicial
% T: tiempo final
% u0: vector columna, dato inicial
%
% Variables de Salida:
% u: matriz de length(u0) x length(t) que contiene la solución
% t: vector de tiempos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
% segunda etapa, aplicar algoritmo Taylor de orden 2
I=eye(length(u0));
for n=1:N
    %
    u(:,n+1)=u(:,n)+h*(I+ 0.5*h*Jf(t(n),u(:,n)))*f(t(n),u(:,n))+ 0.5*h^2*df(t(n),u(:,n));
end
%
% tercera etapa, preparar los datos de salidad
%
end