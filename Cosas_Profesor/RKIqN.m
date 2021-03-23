function [u,t,it]=RKIqN(f,df,N,t0,T,u0,b,c,A,itmax,tol)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esta función resuelve el problema de valor inicial en [t0,T]
%           U'=f(t,U)
%           U(t0)=u0
% utilizando un método Runge Kutta imlícito mediante iteración quasi 
% Newton
%
% [u,t,it]=RKIqN(f,df,N,t0,T,u0,b,c,A,itmax,tol)
%
% Variables de Entrada:
% f: vector columna (ds). función que rige el sistema de EDO,
%    tiene dos argumentos f(t,x) donde t es vector(s)
%    y x vector columna (sd). t=(t1,..ts) x=(x1,...,xs) 
%    f=(f(t1,x1),....,f(ts,xs))
% df: matriz cuadrada(d), tiene dos argumentos df(t,x) donde t escalar,
%    y x vector columna (d).
% N: número de pasos en los que dividimos el intervalo de
%    integración
% t0: tiempo inicial
% T: tiempo final
% u0: vector columna. Dato inicial
% b,c,A: tablero de Butcher, b es el vector de pesos (s), 
%        c vector nodos (s), A matriz cuadrada (s)
% itmax: número máximo de iteraciones
% tol: error para la iteración
%
% Variables de Salida:
% u: matriz de length(u0) x N+1 que contiene la solución
% t: vector de tiempos, de tamaño N+1
% it:número de iteraciones en cada aplicación de quasi Newton
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
it=zeros(N,1);
s=length(c);
% matrices para la iteración
e=ones(s,1);
I=eye(d);
%
% segunda etapa, aplicar algoritmo Runge-Kutta quasi-Newton
for n=1:N
    % calculamos los pasos
    tt=t(n)+c*h;
    % vector partida, el natural con h=0
    V=kron(e,u(:,n));
    % G'(x) y su inversa
    DG=eye(s*d)-h*kron(A,I)*kron(eye(s),df(t(n),u(:,n)));
    IDG=DG\eye(s*d);
    % empezamos la iteración quasi-Newton
    norma=1; % para que pueda arrancar
    %iteramos mientras se cumplen estas dos condiciones
    while (norma>tol && it(n)<itmax)
        it(n)=it(n)+1;
        oldV=V; %guardamos el viejo para comparar
        G=V-kron(e,u(:,n))-h*kron(A,I)*f(tt,V);
        V=V-IDG*G;% aplico casi-Newton
        norma=norm(V-oldV)/norm(V); %comparación
    end
    % avanzamos al siguiente paso
    u(:,n+1)=u(:,n)+h*kron(b',I)*f(tt,V); 
end
%
% tercera etapa, preparar los datos de salidad
%
end