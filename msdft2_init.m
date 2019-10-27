function msdft2_init(input_bitsize, fft_len, bin_range, ... 
    twid_bitsize, res_out_size, out_bitsize, latency)

    din = xInport('din');
    sync = xInport('sync');
    rst = xInport('rst');

   
    comb_data = xSignal;
    comb = xBlock('sys_lib/msdft_comb', struct('input_bitsize', input_bitsize,...
                    'fft_len', fft_len, 'latency', latency), {sync, rst, din},{comb_data});
    
    %rst signal propagated
    %IMPORTANTE!! CREO QUE EL RESET DEL RESONATOR NO ESTA BIEN 
    %IMPLEMENTADO!!
    
    rst1_data = xSignal;
    rst1 =xBlock('sys_lib/Delay2', struct('Latency', latency+1), {rst},{rst1_data});
    
    %sync signal propagated
    sync1_data = xSignal;
    sync1 = xBlock('sys_lib/Delay2', struct('Latency', latency+1), {sync}, {sync1_data});
    
    
    sync_val = 2^fft_len+2*latency+12;
    sync_out_data = xOutport('sync_out');
    sync_out = xBlock('sys_lib/Delay2', struct('Latency', sync_val), {sync}, {sync_out_data});

    
    for i=1:length(bin_range)
        name = strcat('bin0',num2str(bin_range(i)));
        name2 = strcat('bin',num2str(bin_range(i)));
        %res_out = xSignal(name);
        res_out = xOutport(name2);
        twid = xSignal('twid');
        block_name = strcat('res',num2str(bin_range(i)));
        res = xBlock('sys_lib/resonator', ...
            struct('fft_len', fft_len, 'twid_bitsize', twid_bitsize, ...
            'bin_number', bin_range(i), 'input_bitsize', input_bitsize+1, ...
            'input_frac', input_bitsize-1, 'res_bitsize',res_out_size, ...
            'add_lat', latency), {comb_data, sync1_data,rst1_data},...
            {res_out, twid});
        
        fin = xBlock('sys_lib/Terminator', struct(), {twid});
        
        %dout = xOutport(name2);
        %mul = xBlock('sys_lib/cmult', struct('n_bits_a', res_out_size, ...
        %            'bin_pt_a', input_bitsize+twid_bitsize-3, ...
        %            'n_bits_b', twid_bitsize, 'bin_pt_b', twid_bitsize-2,...
        %            'n_bits_ab', out_bitsize, 'bin_pt_ab',...
        %            input_bitsize+2*twid_bitsize-5), {res_out, twid}, {dout});
        
    end
end