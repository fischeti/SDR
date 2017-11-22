function z = fm4modulate(data)

tau00 = 4;
tau01 = 8;
tau10 = 16;
tau11 = 20;

tauS = 80;

% repencode

t = linspace(0,tauS*length(data)-1,tauS*length(data));

y00 = findbits(data,[0,0]);
y01 = findbits(data,[0,1]);
y10 = findbits(data,[1,0]);
y11 = findbits(data,[1,1]);

z00 = repencode(y00,2*tauS).*cos(2*pi/tau00*t);
z01 = repencode(y01,2*tauS).*cos(2*pi/tau01*t);
z10 = repencode(y10,2*tauS).*cos(2*pi/tau10*t);
z11 = repencode(y11,2*tauS).*cos(2*pi/tau11*t);

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
z = z00 + z01 + z10 + z11;
% 
% plot(t,z)

end