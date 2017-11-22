function y = modulate(b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tau0 = 20;
tau1 = 8;
tauS = 80;

b_rep = repencode(b, tauS);
t = linspace(0,length(b_rep)-1,length(b_rep));

y1 = b_rep.*cos(2*pi/tau1*t);
y2 = (1-b_rep).*cos(2*pi/tau0*t);
% subplot(5,1,1)
% x1 = 1:length(b);
% plot(x1,b,'o');
% subplot(5,1,2)
% plot(t, b_rep)
% subplot(5,1,3)
% plot(t, y1)
% subplot(5,1,4)
% plot(t,y2)
% subplot(5,1,5)
% plot(t,y1+y2);

y = y1+y2;
end

