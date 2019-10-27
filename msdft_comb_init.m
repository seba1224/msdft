function msdft_comb_init(blk, varargin)
defaults = {'input_bitsize',10, 'fft_len', 10, 'latency', 0};
if same_state(blk, 'defaults', defaults, varargin{:}), return, end
check_mask_type(blk, 'msdft_comb');
munge_block(blk, varargin{:});

in = get_var('input_bitsize', varargin{:});
fft_len = get_var('fft_len', varargin{:});
lat = get_var('latency', varargin{:});

fmtstr = sprintf('latency=%d', lat);
set_param(blk, 'AttributesFormatString', fmtstr);

save_state(blk, varargin{:}); 
end



