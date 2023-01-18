close all;

syms s;

Ps = 1;
Ts = 1e-6;
phi= 2*10e-8;
theta = 2e-8;
fg = 0:1:2000000;

U_0 = sqrt(2*Ps);

U_a= U_0*((1/2)-exp(-2*pi*fg*Ts));

for j= 1: length(U_a)
    if (U_a(j)<0)
        U_a(j)=0;
    end

end

figure(1);
plot(fg,U_a);
title('Güte der Übertragung')
xlabel('fg')
ylabel('U')

U_2r = theta * pi * fg;

figure(2);
plot(fg,U_2r);
title('Rauschleistung')
xlabel('Ur2')
ylabel('fg')

q = (U_a.^2) ./ U_2r;
q_str = 10 .* log(q);
figure(3);
plot(fg,q);
title('SRV')
xlabel('fg')
ylabel('Qmax')

Pf = 1/2 * erfc(sqrt(q/2));

figure(4)
semilogy(fg,Pf)
title('Güte der Übertragung')
xlabel('fg')
ylabel('logarithmische Teilung')

[M,I] = max(q); % I is the Fgopt

U_a_max=U_a(I);
U_2r_max=U_2r(I);
q_max = q(I);
Pf_max = Pf(I);

f = linspace(0,3e6,10001);
Ge = 1./(1+(1i*(f/I)));

figure(5)
plot(f,abs(Ge))
title('Amplitudengang(linear)')
xlabel('f')
ylabel('Ge(t)')


Ge_amp= 20*log10(abs(Ge));
Ge_pha= angle(Ge)*180/pi;

figure(6)
semilogx(f,Ge_amp);
title('Amplitudengang')
xlabel('f')
ylabel('U')

figure(7)
semilogx(f,Ge_pha);
title('Phasengang')
xlabel('f')
ylabel('grad')


t = linspace(0,3*Ts,1000);
g = 2*pi*I*(exp(-t*(2*pi*I)));
figure(8)
plot(t,g)
title('Gewichtsfunktion')
xlabel('t')
ylabel('x(t)')



Spr = heaviside(t);
figure(9)
plot(t,Spr);
title('Spr1')
xlabel('t')
ylabel('x(t)')

Spr2 = heaviside(t-Ts);
figure(10)
plot(t,Spr2)
title('Spr2')
xlabel('t')
ylabel('x(t)')


xe  = U_0*((1-exp(-t.*(2*pi*I))).*Spr-(1-exp((-(t-Ts)).*(2*pi*I))).*Spr2);
figure(11)
plot(t,xe)
title('Rechteckantwort')
xlabel('t')
ylabel('x(t)')
