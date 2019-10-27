fft_len = 2^10;

cosine = cos_data.data();
sine = sin_data.data();

y = fft(cosine(200:200+fft_len));
p2 = abs(y);
p1 = p2(1:fft_len/2+1);
p1(2:end-1) = 2*p1(2:end-1);
plot(20*log10(p1), '-*')
