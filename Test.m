nrep = 3;
BSCerror = 0.;
pre = [1 0 1 0 1];
after = [0 1 0 1 0];

input = source(10,0.5)
subplot(9, 1,1)
plot(input,'o')
title('source')
repen = repencode(input, nrep);
subplot(9, 1,2)
plot(repen,'o')
title('repencode')
axis([1 30 0 1]);
keysequence = addkeys(repen, pre, after);
subplot(9, 1,3)
plot(keysequence,'o')
axis([1 40 0 1]);
title('addkeys')
modul = modulate(keysequence);
subplot(9, 1,4)
plot(modul);
title('modulate')
noisy = [2*rand(1,234)-1, modul, 2*rand(1,234)-1];
subplot(9,1,5)
plot(noisy);
title('channel')
symbsync = Symbolsync(noisy);
subplot(9,1,6)
plot(symbsync);
title('symbolsync')
demodul = demodulate(symbsync);
subplot(9,1,7)
plot(demodul,'o')
title('demodulate')
axis([1 40 0 1]);
frame = framesync(demodul, pre, after);
subplot(9,1,8)
plot(frame,'o')
title('framesync')
axis([1 30 0 1]);
repdec = repdecode(frame, nrep);
subplot(9,1,9)
plot(repdec, 'o')
title('repdecode')