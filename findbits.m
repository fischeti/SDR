function x = findbits (bits,tofind)

x = [];

if length(tofind) == 1
   range =  1:length(tofind):length(bits);
else
   range = 1:length(tofind):length(bits)-length(tofind)+1;
end

for i=range
    
    x = [x,isequal(tofind,bits(i:i+length(tofind)-1))];
         
end

end