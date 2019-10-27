fs = 100*10^6;
largo = 80000;
t = [0:largo-1]/fs;
t_cycl = [0:largo-1];
data_in = zeros(largo,2);
data_in(:,1) = t_cycl;

freq1 = 5*10^6;
freq2 = 12.5*10^6;
sin_clean = 0.*sin(2*pi*freq1*t(1:length(t)))+0.5*sin(2*pi*freq2*t(1:length(t)));
data_in(1:length(t), 2) = sin_clean;
%data_in(1:length(t),2) =awgn(sin_clean, 20);

bins = [0:1:31];
sinc = zeros(largo, 2);
sinc(:,1) = t_cycl;
sinc(3,2) = 1;