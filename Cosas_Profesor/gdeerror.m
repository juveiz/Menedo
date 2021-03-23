%vector de tamaño de mallados
N=[100,1000,10000,100000,1000000];
% vector de errores
e1=zeros(1,5); 
e2=e1; 
for i=1:5
    [u,t]=euler(@f1,N(i),0,10,[2;3]);
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
    