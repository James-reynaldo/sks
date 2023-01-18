N = 10000

rng(1)
x = rand(1,10000)

figure(1)
subplot(3,1,1)
plot(x)

xk = x(1:9999)

xk1 = x(2:10000)

subplot(3,1,2)
plot(xk,xk1,'r.')

subplot(3,1,3)
 histogram(x,100,'Normalization','pdf')

% histogramm zeigt eine fast stetige Klassenhäufigkeit 

m = mean(x) %Erwartungswert 1/2
v = var(x) %1/12

%Aufgabe 2
y = 2.*sqrt(x)

figure(2)
subplot(3,1,1)
plot(y)

yk = y(1:9999)

yk1 = y(2:10000)

subplot(3,1,2)
plot(yk,yk1,'r.')


subplot(3,1,3)
histogram(y,100,'Normalization','pdf')

my = mean(y) %Erwartungswert 4/3
vy = var(y) %2/9



