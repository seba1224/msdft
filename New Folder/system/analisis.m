fft_len = 2^4;

%fft input
fs =100;
y = fft(data_in(1:fft_len,2));
p2 = abs(y);
p1 = p2(1:fft_len/2+1);
p1(2:end-1) = 2*p1(2:end-1);
f = fs*(0:(fft_len/2))/fft_len;
figure
plot(f, 10*log10(p1),'-*')
title('256 fft input')

%import the data from simulation

data = zeros(8,80001);

data(1,:) = bin.data();
data(2,:)= bin1.data();
data(3,:) = bin2.data();
data(4,:)= bin3.data();
data(5,:)= bin4.data();
data(6,:)= bin5.data();
data(7,:)= bin6.data();
data(8,:)= bin7.data();

figure
plot(10*log10(data(1,1:4:end)), 'b-*')
hold on
plot(10*log10(data(2,1:4:end)), 'red-*')
hold on
plot(10*log10(data(3,1:4:end)),'black-*')
hold on
plot(10*log10(data(4,1:4:end)), 'green-*')
hold on
plot(10*log10(data(5,1:4:end)), 'c-*')
hold on
plot(10*log10(data(6,1:4:end)), 'yellow-*')
hold on
plot(10*log10(data(7,1:4:end)), 'blue-+')
hold on
plot(10*log10(data(8,1:4:end)), 'red-+')
hold on


b0 = num2str(0);
b1 = num2str(100/fft_len);
b2 = num2str(100/fft_len*2);
b3 = num2str(100/fft_len*3);
b4 = num2str(100/fft_len*4);
b5 = num2str(100/fft_len*5);
b6 = num2str(100/fft_len*6);
b7 = num2str(100/fft_len*7);

legend(b0,b1,b2,b3,b4,b5,b6,b7);


%{
i = 0;
while(i<20)
   plot(f(1:4), 10*log10(data(1:4,100+i)+1))
   hold on
   i = i+1;
end
%}

%{
data(9,:)= bin8.data();
data(10,:)= bin9.data();
data(11,:)= bin10.data();
data(12,:)= bin11.data();
data(13,:)= bin12.data();
data(14,:)= bin13.data();
data(15,:)= bin14.data();
data(16,:)= bin15.data();
data(17,:)= bin16.data();
data(18,:)= bin17.data();
data(19,:)= bin18.data();
data(20,:)= bin19.data();
data(21,:)= bin20.data();
data(22,:)= bin21.data();
data(23,:)= bin22.data();
data(24,:)= bin23.data();
data(25,:)= bin24.data();
data(26,:)= bin25.data();
data(27,:)= bin26.data();
data(28,:)= bin27.data();
data(29,:)= bin28.data();
data(30,:)= bin29.data();
data(31,:)= bin30.data();
data(32,:)= bin31.data();



figure
%imshow(data);
i = 0;
while(i<20)
   plot(f(1:16), 10*log10(data(1:16,100+i)+1))
   hold on
   i = i+1;
end
%}