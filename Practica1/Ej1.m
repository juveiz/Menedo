[u,t] = euler(@f1,100,0,10,[2;3]);

subplot(2,2,1);
plot(t,u(1,:));
hold on;
plot(t,u(2,:));

subplot(2,2,2);
plot(u(1,:),u(2,:));

[u,t] = Taylor2(@f1,@df1,@Df1,10,0,100,[2;3]);

subplot(2,2,3);
plot(t,u(1,:));
hold on;
plot(t,u(2,:));

subplot(2,2,4);
plot(u(1,:),u(2,:));