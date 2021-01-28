b = [1/6;2/3;1/6];
c = [0;1/2;1];
A = [0 0 0;1/2 0 0;-1 2 0];
%vector de tamaño de mallados
N=[100,1000,10000,100000];
% vector de errores
e1=zeros(1,4); 
e2=e1; 
for i=1:4
    [u,t]=RKexplicito(@f1,N(i),0,10,[2;3],b,c,A);
    uu=s_exac(t);
    % error en cada punto del mallado
    error=u-uu;
    %error absoluto en T
    e1(i)=max(abs(error(:,N(i)+1)));
    %error absoluto para todo t
    e2(i)=max(max(abs(error)));
end
%vector de pasos
h=10./N;
%gráficas logarítmicas
loglog(h,e1)
hold on 
loglog(h,e2)
legend('Error 1','Error 2');
hold off
%calcular pendiente media de la recta
e1=log10(e1);
e2=log10(e2);
h=log10(h);
p1=zeros(3,1);
p2=p1;
for i=1:3
    s=h(i+1)-h(i);
    p1(i)=(e1(i+1)-e1(i))/s;
    p2(i)=(e2(i+1)-e2(i))/s;
end
sum(p1)/3
sum(p2)/3