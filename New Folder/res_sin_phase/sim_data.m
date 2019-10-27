fs = 100*10^6;
largo = 7000;
t = [0:largo-1]/fs;
t_cycl = [0:largo-1];
data_in = zeros(largo,2);
data_in(:,1) = t_cycl;

freq1 = 5*10^6;
freq2 = 7.0312*10^6;
sin_clean = 0.*sin(2*pi*freq1*t(1:length(t)))+0.5*sin(2*pi*freq2*t(1:length(t)));

asd = sin_clean(1024:end-1)-sin_clean(1:end-1024);
data_in(1:length(asd), 2) = asd;


y = fft(asd(1:1024));
p2 = abs(y);
p1 = p2(1:1024/2+1);
p1(2:end-1) = 2*p1(2:end-1);
f = fs/10^6*(0:(1024/2))/1024;
plot(f, 20*log10(p1+1))

