% SDR Transmitter

%Recive data input

n = 2;
praeambel = round(rand(1,100));
endambel = round(rand(1,100));

s = fopen('datei.txt', 'r');
bitsequence = fread(s, 'ubit1')';
fclose(s);

% bitsequence = repmat([1 0 1],1,50);

data = [praeambel bitsequence endambel];

% Modulate data
%prefix =  [1,1,1,1,1,1,1,1];
%postfix = [1,1,1,1,1,1,1,1];

send = fm_2highn_modulate(data, n);
% noise_addition = [rand(1,100) send rand(1,100)];
% plot(noise_addition)

p = audioplayer(send, 22044);
r = audiorecorder(22044, 16, 1);
record(r);
play(p);
pause(20);
stop(r);
receive = getaudiodata(r)';

symbol_sync = Symbolsync(receive, praeambel, n);
plot(symbol_sync)
receive = fm_2highn_demodulate(symbol_sync, n);
frame_sync = framesync(receive, praeambel, endambel);
plot(frame_sync)


subplot(2,1,1)
plot(frame_sync,'ro')
subplot(2,1,2)
plot(bitsequence, 'ro')
%Send data
%send(send) %TODO
% plot(send);
% plot(fmdemodulate(send),'ro');
isequal(frame_sync, bitsequence)

kolar = fopen('empf.txt', 'w');
fwrite(kolar,frame_sync, 'ubit1');
fclose(kolar);