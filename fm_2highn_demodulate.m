function b = fm_2highn_demodulate(data, n)

tau_bits = zeros(1,2^n);
tauS = 80*2^n/2;
b = zeros(1,length(data)/n);

d = 0:2^n-1;
y = de2bi(d,'left-msb');

for i = 1:2^n
    tau_bits(i) = tauS/(4*i);
end

t = 0:length(data)-1;

for j = 1:length(tau_bits)
    for i = 1:length(data)/tauS
        z(j,i) = cos(2*pi/tau_bits(j)*t((i-1)*tauS+1:i*tauS))*data((i-1)*tauS+1:i*tauS)';

        %    z(i)= round(r(i)/(tauS/2));
    end
    r(j,:) = repdecode(z(j,:),n);
end

z = round(r/(tauS/2));

for j = 1:2^n
    for i=1:length(z(1,:))
        b(n*i-(n-1):n*i) = b(n*i-(n-1):n*i) + z(j,i)*y(j,:);
    end
end
% subplot(4,1,1)
% plot(z00,'ro')
% subplot(4,1,2)
% plot(z01,'ro')
% subplot(4,1,3)
% plot(z10,'ro')
% subplot(4,1,4)
% plot(z11,'ro')

end