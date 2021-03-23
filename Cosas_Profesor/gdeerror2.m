%vector de tamaño de mallados
N=[100,1000,10000,100000,1000000];
% vector de errores
e1=zeros(1,5); %error Euler
e2=e1; %error Taylor 2
for i=1:5
    [u,t]=euler(@f1,N(i),0,10,[2;3]);
    [v,t]=Taylor2(@f1,@df1,@Jf1,10,0,N(i),[2;3]);
    uu=s_exac(t);
    %error absoluto para todo t
    e1(i)=max(max(abs(u-uu)));
    e2(i)=max(max(abs(v-uu)));
end
%vector de pasos
h=10./N;
%gráficas logarítmicas
loglog(h,e1)
hold on 
loglog(h,e2)
%
%calcular pendiente media de la recta
e1=log10(e1);
e2=log10(e2);
h=log10(h);
p1=zeros(4,1);
p2=p1;
for i=1:4
    s=h(i+1)-h(i);
    p1(i)=(e1(i+1)-e1(i))/s;
    p2(i)=(e2(i+1)-e2(i))/s;
end
sum(p1)/4
sum(p2)/4
    