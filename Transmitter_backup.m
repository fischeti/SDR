% SDR Transmitter

%Recive data input

n = 3;

data = round(rand(1,10*n));
% s = fopen('datei.txt','r');
% bitsequence = fread(s, 'ubit1')'
% fclose(s);

% Modulate data
%prefix =  [1,1,1,1,1,1,1,1];
%postfix = [1,1,1,1,1,1,1,1];

send = fm_2highn_modulate(data, n);
receive = fm_2highn_demodulate(send, n);

subplot(2,1,1)
plot(receive,'ro')
subplot(2,1,2)
plot(data, 'ro')
%Send data
%send(send) %TODO
% plot(send);
% plot(fmdemodulate(send),'ro');
