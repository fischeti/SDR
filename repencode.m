function outputsequence = repencode(bit_sequence, n)
% function outputsequence = repencode(seq, n)
%
% Zweck: Repetiercode der jedes Bit in einer Bitsequenz n-mal repetiert
%        z.B. 101 -> 111000111
%
% Parameters:   bit_sequence    ... Bitsequenz
%               n               ... Repetitionszahl jedes Bits
%
% Returns:      outputsequence  ... ausgegebene Bitsequenz
%

% Macht aus einer aus einem [1xm]-Vektor eine [nxm]-Matrix
SEQ = repmat(bit_sequence, n,1);

% Wandelt eine [nxm]-Matrix in ein [1x(n*m)]-Vektor um
outputsequence = reshape(SEQ, 1, length(bit_sequence)*n);

end

