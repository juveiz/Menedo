function [u,t]=RKexplicito(f,N,t0,T,u0,b,c,A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci´on resuelve el problema de valor inicial
% u’=f(t,u)
% u(t0)=u0
% utilizando un método Runge Kutta explícito
%
% [u,t]=RKexplicito(f,N,t0,T,u0,b,c,A)
%
% Variables de Entrada:
% f: vector columna. funci´on que rige el sistema de EDO,
% tiene dos argumentos f(t,x) donde t es escalar
% y x vector columna.
% N: n´umero de pasos en los que dividimos el intervalo de
% integraci´on
% t0: tiempo inicial
% T: tiempo final
% u0: vector columna. Dato inicial
% b,c,A: tablero de Butcher, b es el vector de pesos(s), c vector nodos(s) y A
%        matriz cuadrada (sxs)
%
% Variables de Salida:
% u: matriz de length(u0) x N que contiene la soluci´on
% t: vector de tiempos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% primera etapa, preparar las variables para abordar el algoritmo
h = (T -t0)/N;
% vector de tiempos
t = [t0:h:T];
% matriz solucion numerica
d = length(u0);
u = zeros(d,N+1);
% incorporamos el dato inicial en mi solucion numerica
u(:,1) = u0;
s = length(c);
k = zeros(d,s);
% segunda etapa, aplicar el algoritmo de euler
% u(n+1) = u(n) + h*f(t(n),u(n))
%
for n = 1:N
    k(:,1) = f(t(n),u(:,n));
    for i = 2:s
        k(:,i) = f(t(n)+c(i)*h,u(:,n)+h*k(:,1:i-1)*A(i,1:i-1)');
    end
    u(:,n+1) = u(:,n) + h*k*b;
end
end