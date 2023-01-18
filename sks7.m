%  Bitfehlerwahrscheinlichkeitsschätzung

fa = 9e6;
Ta = 1/fa;
Ps = 1; %mittlere Sendeleistung V^2
Ts = 1e-6;
ns = floor(Ts/Ta); %Anzahl Stützstellen pro symbol
U0 = sqrt(Ps*2);
Eb = (U0^2*Ts)/2;
EbPsi0dB_vec = 0:2:16;

for k = 1:length(EbPsi0dB_vec)

    EbPsi0dB = EbPsi0dB_vec(k);
    EbPsi0 = 10^(0.1*EbPsi0dB);
    
    Psi0 = 1/EbPsi0 * Eb;

    %Zufahlszahlen

    nb = 1e5;
    xb = randi([0,1],1,nb);

    %Quellensignal

    uq = zeros(1,ns*length(xb));

    for kq = 1: length(xb)
        uq((kq-1)*ns+1:kq*ns) = [xb(kq) zeros(1,ns-1)];
    end    

    us = U0*Ts*conv(gs,uq);
    us = us(ceil(length(gs)/2-floor(ns/2)+1):length(us)- ...
        floor(length(gs)/2+floor(ns/2))+1)
end    