%monte carlo hit and miss
clear all
close all

N = 5000

rng(1)
z = rand(N,2)

xk = zeros(1,N)

for i=1:N
    if ((z(i,1))^2+(z(i,2))^2) <1
        xk(1,i) = 1
    else
        xk(1,i) = 0
    end     
end

pi_est = (sum(xk)/N)*4

z_inv = z'

figure(1)
plot(z_inv(1,1:N),z_inv(2,1:N),'r.')
%% 

circle(0,0,1)

xlim([0 1])
ylim([0 1])


