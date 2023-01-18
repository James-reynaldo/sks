close all;
clear all;

U0=5
Ts= 1e-6
fa = 11e6
fs=1/Ts
len = 64

border = (len)/fa/2


t = linspace(-border,border-(1/fa),len)
f= -(fa/2):(fa/(len)):(fa/2-(fa/(len)))
y = 10*sin(2*pi*fs*t) %als control
Rck = zeros(1,len)
% Rck(1,ceil(len*(1/4)):ceil(len*(3/4)))=U0
Rck(1,33-floor(0.5e-6*fa):33+floor(0.5e-6*fa))=U0
%Rck= ifftshift(Rck)

figure(1)
stem(t,Rck)
title('Rechteckimpuls')
xlabel('t')
ylabel('x(t)')


figure(2)
plot(t,y)
title('Sinus')
xlabel('t')
ylabel('x(t)')

Rck_fft = fftshift((fft(Rck))) /fa

Rck_theo = U0*Ts*sinc(Ts*f)


figure(3)
stem(f,abs(Rck_fft))
hold on
plot(f,abs(Rck_theo))
title('Rck_fft')
xlabel('f')
ylabel('U')


fg=0.8e6

Spr = heaviside(t);
ge = (2*pi*fg*exp(-t*(2*pi*fg))) .* Spr
ge((length(ge)/2)+1)= (2*pi*fg*exp(0*(2*pi*fg)))
ge = ge./fa
Ge = 1./(1+(1i*(f/fg)));

figure(5)
plot(f,Ge)
title('Ge_fft')
xlabel('f')
ylabel('U')

figure(6)
plot(t,ge)
title('ge')
ylabel('x(t)')
xlabel('t')


emp = (conv(ge,Rck,"same"))./sum(ge)
figure(7)
plot(t,emp)
title('Empfangsgrundimpuls Faltung')
ylabel('xe(t)')
xlabel('t')


spk_f = Rck_fft .* Ge

figure(9)
plot(f,abs(spk_f))
emp_f = ifft(spk_f)*fa
title('spk_f')
ylabel('U')
xlabel('f')

figure(8)
plot(t,abs(emp_f))
title('Empfangsgrundimpuls ifft')
ylabel('xe(t)')
xlabel('t')




