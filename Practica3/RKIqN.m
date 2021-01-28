function [u,t,it]=RKIqN(f,df,N,t0,T,u0,b,c,A,item,tol)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta funci´on resuelve el problema de valor inicial
% u’=f(t,u)
% u(t0)=u0
% utilizando un método Runge Kutta explícito
%
% [u,t]=RKIqN(f,dF,N,t0,T,u0,b,c,A,item,tol)
%
% Variables de Entrada:
% f: vector columna. funci´on que rige el sistema de EDO,
% tiene dos argumentos f(t,x) donde t es vector de tamanio s
% y x vector columna de tamanio sd
% df: matriz dxd tiene dos argumentos f(t,x) donde t es vector de tamanio s
% y x vector columna de tamanio sd
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
% item: numero max de iteraciones
% tol: error para la iteracion
% it: numero de iteraciones en cada aplicacion de quasinewton
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
it = zeros(d,N+1);
s = length(c);
% segunda etapa, aplicar el algoritmo de euler
% u(n+1) = u(n) + h*f(t(n),u(n))
%
e = ones(s,1);
I = eye(d);
for n = 1:N
    tt = t(n) + c*h;
    V = kron(e,u(:,n));
    DG = eye(s*d) - h*kron(A,I)*kron(eye(s),df(t(n),u(:,N)));
    IDG = DG\eye(s*d);
    norma = 10000;
    while (norma > tol && it(n)<item)
        it(n) = it(n) + 1;
        oldV = V;
        G = V - kron(e,u(:,n)) - h*kron(A,I)*f(tt,V);
        V = V - IDG*G;
        norma = norm(V-oldV)/norm(V);
    end
    
    u(:,n+1) = u(:,n) + h*kron(b',I)*f(tt,V);
end
end