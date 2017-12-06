% SDR Transmitter

%Recive data input

n = 4;
praeambel = round(rand(1,100));
endambel = round(rand(1,100));

s = fopen('datei.txt', 'r');
bitsequence = fread(s, 'ubit1')';
fclose(s);

data = [praeambel bitsequence endambel];
% s = fopen('datei.txt','r');
% bitsequence = fread(s, 'ubit1')'
% fclose(s);

% Modulate data
%prefix =  [1,1,1,1,1,1,1,1];
%postfix = [1,1,1,1,1,1,1,1];

send = fm_2highn_modulate(data, n);
noise_addition = [rand(1,100) send rand(1,100)];
plot(noise_addition)
symbol_sync = Symbolsync(noise_addition, praeambel, n);
plot(symbol_sync)
receive = fm_2highn_demodulate(symbol_sync, n);
frame_sync = framesync(receive, praeambel, endambel);
plot(frame_sync)


subplot(2,1,1)
plot(frame_sync,'ro')
subplot(2,1,2)
plot(data(11:end-10), 'ro')
%Send data
%send(send) %TODO
% plot(send);
% plot(fmdemodulate(send),'ro');
isequal(frame_sync, data(101:end-100))

kolar = fopen('empf.txt', 'w');
fwrite(kolar,frame_sync, 'ubit1');
fclose(kolar);