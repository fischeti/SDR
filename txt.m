% txt.m
%
% Zweck: verschickt ein .txt-File ueber die Luft
%
% Parameters:
%               pre      ... zufallsgenerierte Start-Praeambel
%               after    ... zufallsgenerierte End-Praeambel
%

pre = round(rand(1,50));
after = round(rand(1,50));

s = fopen('datei.txt','r');
bitsequence = fread(s, 'ubit1')'
fclose(s);

keysequence = addkeys(bitsequence, pre, after);
y = modulate(keysequence);
p = audioplayer(y, 22044);
r = audiorecorder(22044, 16, 1);
record(r);
play(p);
pause(20);
stop(r);
receive = getaudiodata(r)';
symb = Symbolsync(receive);
subplot(3,1,1);
plot(symb);
dem = demodulate(symb);
subplot(3,1,2);
plot(dem,'bo')
frame = framesync(dem, pre, after)
subplot(3,1,3);
plot(frame, 'o');

kolar = fopen('empf.txt', 'w');
fwrite(kolar,round(frame-std(frame)/2), 'ubit1');
fclose(kolar);