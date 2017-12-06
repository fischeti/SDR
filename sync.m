function offset = sync(a,b)
% function offset = sync(a,b)
%
% Zweck: kreuzkorreliert die beiden Vektoren a und b
%
% Parameters:   a        ... Vektor
%               b        ... Vektor
%
% Returns:      offset   ... offset, bzw. Stelle in a wo sich b befindet.
%
correlation = xcorr(a,b);
[Y,offset] = max(correlation);
offset = offset - length(a) + 1;
end

