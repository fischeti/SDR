%SDR Reciver

%recive
inputnoise = recive(); %TODO

%demodulate
input = findbegin(inputnoise); %TODO
recive = demodulate(input); %TODO
bits = derepet(recive); %TODO
data = prepostremove(bits); %TODO

%save data
%TODO


