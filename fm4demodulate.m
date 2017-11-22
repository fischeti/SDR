function z = fm4demodulate (bits)


tau00 = 4;
tau01 = 8;
tau10 = 16;
tau11 = 20;

tauS = 80;

t = 0:length(bits)-1;

for i = 1:length(bits)/tauS
   z00(i) = cos(2*pi/tau00*t((i-1)*tauS+1:i*tauS))*bits((i-1)*tauS+1:i*tauS)';
   z01(i) = cos(2*pi/tau01*t((i-1)*tauS+1:i*tauS))*bits((i-1)*tauS+1:i*tauS)';
   z10(i) = cos(2*pi/tau10*t((i-1)*tauS+1:i*tauS))*bits((i-1)*tauS+1:i*tauS)';
   z11(i) = cos(2*pi/tau11*t((i-1)*tauS+1:i*tauS))*bits((i-1)*tauS+1:i*tauS)';
end
% 

r00 = repdecode(z00,2);
r01 = repdecode(z01,2);
r10 = repdecode(z10,2);
r11 = repdecode(z11,2);

z00 = round(r00/(tauS/2));
z01 = round(r01/(tauS/2));
z10 = round(r10/(tauS/2));
z11 = round(r11/(tauS/2));

for i=1:length(z00)
    z(2*i-1:2*i) = z00(i).*[0,0]+z01(i).*[0,1]+z10(i).*[1,0]+z11(i).*[1,1];
end

subplot(4,1,1)
plot(z00,'ro')
subplot(4,1,2)
plot(z01,'ro')
subplot(4,1,3)
plot(z10,'ro')
subplot(4,1,4)
plot(z11,'ro')







end