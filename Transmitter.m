% SDR Transmitter

%Recive data input

data = [1,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,0,1,1,0,1,0,1,1,0,0];
% s = fopen('datei.txt','r');
% bitsequence = fread(s, 'ubit1')'
% fclose(s);

% Modulate data
%prefix =  [1,1,1,1,1,1,1,1];
%postfix = [1,1,1,1,1,1,1,1];

bits = data;
send = fm4modulate(bits);
receive = fm4demodulate(send);

subplot(2,1,1)
plot(receive,'ro')
subplot(2,1,2)
plot(data, 'ro')
%Send data
%send(send) %TODO
% plot(send);
% plot(fmdemodulate(send),'ro');
