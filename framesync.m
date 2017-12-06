function seq = framesync(a, pre, after)
% function seq = framesync(a, pre, after)
%
% Zweck: detektiert die Start- und End-Praeambel und fuehrt
%        eine Rahmensynchronisation durch
%
% Parameters:   a        ... empfangenes symbolsynchronisiertes Signal
%               pre      ... Start-Praeambel
%               after    ... End-Praeambel
%               
% Returns:      seq      ... rahmensynchronisiertes Signal
%
a = 2*a-1;
offpre = sync(a,2*pre-1);
offafter = sync(a, 2*after-1);
seq = (a([offpre + length(pre):offafter - 1])+1)/2;
end

