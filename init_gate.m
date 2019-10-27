function init_gate(bin_len, bitwidth)
    din = xInport('sync');
    sync_line = xSignal;
    sync_blk = xBlock('lib_gate/GatewayOut',struct(),{din},{sync_line});
    disp('asd')
    sync_out = xBlock('lib_gate/ToWorkspace',struct(), {sync_line});
    for i=1:bin_len
        name = strcat('bin',num2str(i-1));
        input = xInport(name);
        aux1 = xSignal;
        pow = xBlock('lib_gate/power', struct('BitWidth',bitwidth), {input},...
                    {aux1});
        aux2 = xSignal;
        reint = xBlock('lib_gate/Reinterpret', struct(), {aux1}, {aux2});
        %aux3 = xSignal;
        name_out = strcat('out', name);
        aux3 = xOutport(name_out);
        gat = xBlock('lib_gate/GatewayOut', struct(), {aux2}, {aux3});
        %out = xBlock('lib_gate/ToWorkspace', struct(),...
        %             {aux3});
    end
   
end


