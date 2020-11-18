N = [100,1000,100000,100000,1000000];
e1 = zeros(1,5); % error absoluto en T
e2 = zeros(1,5); % error absoluto en t

for i=1:5
    [u,t] = euler(@f1,N(i),0,10,[2;3]);
    y = u1(t);
    error= u - y;
    e1(i) = max(abs(error(:,N(i)+1)));
    e2(i) = max(max(abs(error)));
end

h = 10./N;
loglog(h,e1);
hold on
loglog(h,e2);
legend('Error 1','Error 2');
