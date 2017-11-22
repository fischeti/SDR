function bhat = demodulate(r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

tau0 = 20;
tau1 = 8;
tauS = 80;

t = 0:length(r)-1;

% y0 = cos(2*pi/tau0*t).*r;
% y1 = cos(2*pi/tau1*t).*r;

for i = 1:length(r)/tauS
   z0(i) = cos(2*pi/tau0*t((i-1)*tauS+1:i*tauS))*r((i-1)*tauS+1:i*tauS)'
   z1(i) = cos(2*pi/tau1*t((i-1)*tauS+1:i*tauS))*r((i-1)*tauS+1:i*tauS)'
end


bhat = (z1-z0+tauS/2)/tauS;
% 
% subplot(7,1,1);
% plot(t,r);
% axis([0 length(r) -1 1]);
% subplot(7,1,2);
% plot(t,y0);
% axis([0 length(r) -1 1]);
% subplot(7,1,3);
% plot([1:length(r)/tauS],z0,'o');
% axis([1 length(r)/tauS 0 40]);
% subplot(7,1,4);
% plot(t,y1);
% axis([0 length(r) -1 1]);
% subplot(7,1,5);
% plot([1:length(r)/tauS],z1,'o');
% axis([1 length(r)/tauS 0 40]);
% subplot(7,1,6);
% plot([1:length(r)/tauS],z1-z0,'o');
% axis([1 length(r)/tauS -40 40]);
% subplot(7,1,7);
% plot([1:length(r)/tauS],bhat,'o');
% axis([1 length(r)/tauS 0 1]);

end


