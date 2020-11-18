[u,t] = euler(@sir,100,0,15,[995;5;0]);
plot(t,u(1,:))
hold on
plot(t,u(2,:))
hold on
plot(t,u(3,:))
legend('S(t)','I(t)','R(t)')
