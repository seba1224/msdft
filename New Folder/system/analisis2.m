%hiperparameters
sim_large = 5001;
fft_len = 2^6;
plot_chunks = 8;
marks = {'x','*', '^', '+', 'v', '>', '<', 'v'};


data = zeros(32,sim_large);


data(1,:) = bin0.data.data();
data(2,:)= bin1.data.data();
data(3,:) = bin2.data.data();
data(4,:)= bin3.data.data();
data(5,:)= bin4.data.data();
data(6,:)= bin5.data.data();
data(7,:)= bin6.data.data();
data(8,:)= bin7.data.data();
data(9,:)= bin8.data.data();
data(10,:)= bin9.data.data();
data(11,:)= bin10.data.data();
data(12,:)= bin11.data.data();
data(13,:)= bin12.data.data();
data(14,:)= bin13.data.data();
data(15,:)= bin14.data.data();
data(16,:)= bin15.data.data();
data(17,:)= bin16.data.data();
data(18,:)= bin17.data.data();
data(19,:)= bin18.data.data();
data(20,:)= bin19.data.data();
data(21,:)= bin20.data.data();
data(22,:)= bin21.data.data();
data(23,:)= bin22.data.data();
data(24,:)= bin23.data.data();
data(25,:)= bin24.data.data();
data(26,:)= bin25.data.data();
data(27,:)= bin26.data.data();
data(28,:)= bin27.data.data();
data(29,:)= bin28.data.data();
data(30,:)= bin29.data.data();
data(31,:)= bin30.data.data();
data(32,:)= bin31.data.data();


i = 1;
while (i<=32/plot_chunks)
    j = 1;
    leg = {0,0,0,0,0,0,0,0};
    while (j<=plot_chunks)
        aux = data((i-1)*plot_chunks+j,:);
        plot(10*log10(aux+1), 'color',rand(1,3), 'marker', marks{j});
        hold on
        %leg = [leg, num2str(((i-1)*plot_chunks+(j-1))*100/fft_len)];
        leg{j} = num2str(((i-1)*plot_chunks+(j-1)));
        j = j +1;
    end
    axis([0,sim_large,100, 180])
    legend(leg)
    i = i+1; 
    figure
end



figure
pcolor(10*log10(data(:,1:500)))
shading flat
hcb = colorbar('location','EastOutside');
ylabel('bins')
xlabel('clk cycles')
title('msdft spectrogram')

figure
plot((0:1:31), 10*log10(data(:,1000)))
title('msdft instantaneous spectrum')
xlabel('bins')
ylabel('[dB]')
%{
asd = fft_out.data();
plot((0:1:2^6-1), 10*log10(asd(352:352+2^6-1)+1))
title('FFT Xilinx')
xlabel('bins')
ylabel('[dB]')
%}










