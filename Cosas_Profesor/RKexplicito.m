function [u,t]=RKexplicito(f,N,t0,T,u0,b,c,A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta función resuelve el problema de valor inicial en [t0,T]
%           U'=f(t,U)
%           U(t0)=u0
% utilizando un método Runge Kutta explícito
%
% [u,t]=RKexplicito(f,N,t0,T,u0,b,c,A)
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
% b,c,A: tablero de Butcher, b es el vector de pesos (s), 
%        c vector nodos (s), A matriz cuadrada (s*s)
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
d=length(u0);
u=zeros(d,N+1);
%incorporando el dato inicial en mi solución numérica
u(:,1)=u0;
s=length(c);
k=zeros(d,s);
%
% segunda etapa, aplicar algoritmo Runge-Kutta
%
for n=1:N
    % calculamos los pasos
    k(:,1)=f(t(n),u(:,n));
    for i=2:s
        k(:,i)=f(t(n)+c(i)*h,u(:,n)+h*k(:,1:i-1)*(A(i,1:i-1))');
    end
    % avanzamos al siguiente paso
    u(:,n+1)=u(:,n)+h*k*b;
end
%
% tercera etapa, preparar los datos de salidad
%
end