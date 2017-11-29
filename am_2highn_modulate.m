function z = fm_2highn_modulate(data, n)

Amax = 10;

tauS = 80*2^n/2;

for i = 1:2^n
    tau_bits(i) = tauS/(4*i);
%     tauS = lcm(tauS, i);
end

% repencode

t = linspace(0,tauS*length(data)-1,tauS*length(data));

d = 0:2^n-1;
y = de2bi(d,'left-msb');

for i = 1:2^n
    y_findbits(i,:) = findbits(data,y(i,:));
    z(i,:) = repencode(y_findbits(i,:),n*tauS).*cos(2*pi/tau_bits(i)*t);
end

% z00 = repencode(y00,2*tauS).*cos(2*pi/tau00*t);
% z01 = repencode(y01,2*tauS).*cos(2*pi/tau01*t);
% z10 = repencode(y10,2*tauS).*cos(2*pi/tau10*t);
% z11 = repencode(y11,2*tauS).*cos(2*pi/tau11*t);

% subplot(5,1,1)
% plot(z00)
% subplot(5,1,2)
% plot(z01)
% subplot(5,1,3)
% plot(z10)
% subplot(5,1,4)
% plot(z11)
% subplot(5,1,5)
% plot(data,'ro')

z = sum(z);

% 
plot(t,z)

end