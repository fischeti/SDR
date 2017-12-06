function outputsequence = repdecode(bit_sequence, n)
% function output = repdecode(seq, n)
%
% Zweck: Wandelt eine repetierte Bitsequenz wieder in die normale
%        Bitsequenz zurück in dem es den Mittelwert aus den n-mal repetitiven Bits
%        nimmt.
%
% Parameters:   bit_sequence    ... Bitsequenz
%               n               ... Repetitionszahl jedes Bits
%
% Returns:      outputsequence  ... ausgegebene Bitsequenz
%

if (n ~= 1)
    outputsequence = round(sum(reshape(bit_sequence, n, length(bit_sequence)/n))/n);
else
    outputsequence = round(reshape(bit_sequence, n, length(bit_sequence)/n)/n);
end

