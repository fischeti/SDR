function symb = Symbolsync(a, praeambel, n)
% function symb = Symbolsync(a)
%
% Zweck: fuehrt eine Symbolsynchronisation durch mit dem Sequenzuebergang [0 1]
%
% Parameters:   a        ... empfangenes Signal
%
% Returns:      symb     ... symbolsynchronisiertes Signal
%
tauS = 160*n;
offset = mod(sync(a,fm_2highn_modulate(praeambel,n)),tauS);
symb = a(offset:length(a)-mod(length(a(offset:length(a))),tauS));
end

