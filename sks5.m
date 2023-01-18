close all;
clear all;


Ld = 2e-8;
fa = 17e6;
N= 256;
M = 100;
vari = Ld * fa;
sigma_n = sqrt(vari);
%b

random = sigma_n * randn(1,N);

%c

figure(1);
histogram(random,M,"Normalization","pdf");
title('Wahrscheinlichkeitsdichte')
ylabel('f(x)')
xlabel('x')


%d
%f= -(fa/2):(fa/(N)):(fa/2-(fa/(N)))
f= -(fa/2):(fa/(N)):(fa/2-(fa/(N)));
Rausch_spektrum = periodogram(random,[],f,fa);
Rausch_spektrum_ave = zeros(size(Rausch_spektrum));

for k_P = 1:M
    n =sigma_n* randn(1,N);
    Rausch_spektrum_ave = Rausch_spektrum_ave + periodogram(n,[],f,fa);
end    

Rausch_spektrum_ave = Rausch_spektrum_ave / M;

figure(2);
plot(f,Rausch_spektrum);
title('Rauschleistungs Spektrum')
ylabel('V^2/Hz')
xlabel('f/Hz')

figure(3);
plot(f,Rausch_spektrum_ave);
title('Rauschleistungs Spektrum gemittelt')
ylabel('V^2/Hz')
xlabel('f/Hz')
ylim([0 2.5e-8])
%% 

%Aufgabe 2

U0 = 5;
Ts = 1e-6;
fg = 0.4/Ts;
Nb = 1e3;
%a
xb = randi([0,1],Nb,1);

%b
ns = floor(Ts/(1/fa));
us = zeros(1,ns*length(xb));
for ks=1:length(xb)
    us((ks-1)*ns+1:ks*ns) = U0*xb(ks)*ones(1,ns);
end    
%c
t= linspace(0,Ts*(length(xb)-1),length(us));

figure(4)
plot(t(1:ns*10),us(1:ns*10))%10Ts

%d
ge = 2*pi*fg*exp(-2*pi*fg*t);
ue = 1/sum(ge)*conv(ge,us,'same');

%%
figure(5)
plot(t(1:ns*10),ue(1:ns*10));
title('Empfangssignal')
ylabel('u(t)')
xlabel('t')
%e
eyediagram(ue,ns,1,12)

