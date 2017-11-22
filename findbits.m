function x = findbits (bits,tofind)

x = [];

for i=1:length(tofind):length(bits)-1
    
    x = [x,isequal(tofind,bits(1,i:i+length(tofind)-1))]
         
end
end