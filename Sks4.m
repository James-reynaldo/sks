clear all;
close all
N = 10000

rng(1)
x = randi([0 1],1,10000)

figure(1)

subplot(5,1,1)
stem(x(1:50))

subplot(5,1,2)
histogram(x,'Normalization','pdf')

m = mean(x) %Erwartungswert (a+b)/2 = 0.5
v = var(x) % VAR ((b-a+1)^2-1)/12 = 0.25

%Box Müller Methode
erw = 1
vari = 4

N = 10000
M = 100 % number of bins
rng(1)
x1 = rand(1,10000)

rng(2)
x2 = rand(1,10000)

Y1 = erw + sqrt(vari) .* sqrt(-2*log(x1)).*cos(2*pi*x2)
Y2 = erw + sqrt(vari) .* sqrt(-2*log(x1)).*sin(2*pi*x2)

subplot(5,1,3)
histogram(Y1,M,'Normalization','pdf')
title('BM cos')
ylabel('f(x)')
xlabel('x')

subplot(5,1,4)
histogram(Y2,M,'Normalization','pdf')
title('BM sin')
ylabel('f(x)')
xlabel('x')

%randn
random = randn(1,N)

subplot(5,1,5)
histogram(random,'Normalization','pdf')
title('randn')
ylabel('f(x)')
xlabel('x')

%Additionsmethode
add = zeros(N,1);

for k = 1:N
    x = rand(12,1);
    add(k,1) = erw + sqrt(vari) * (sum(x)-6);
end   

add_mean = mean(add);
add_var = var(add);

figure(2);
histogram(add,M,'Normalization','pdf')
title('Add_methode')
ylabel('f(x)')
xlabel('x')





