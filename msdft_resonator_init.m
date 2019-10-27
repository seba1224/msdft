function msdft_resonator_init(blk, varargin)
defaults = {'fft_len', 10, 'twid_bitsize', 15, ...
            'bin_number', 5, 'input_bitsize',10, ...
            'input_frac', 8, 'res_bitsize', 40, ...
            'add_lat', 0};
if same_state(blk, 'defaults', defaults, varargin{:}), return, end
check_mask_type(blk, 'msdft_res');
munge_block(blk, varargin{:});

fft_len = get_var('fft_len', varargin{:});
twid_size = get_var('twid_bitsize', varargin{:});
bin_number = get_var('bin_number', varargin{:});
input_size = get_var('input_bitsize', varargin{:});
input_frac = get_var('input_frac', varargin{:});
res_size = get_var('res_bitsize', varargin{:});
add_lar = get_var('add_lat', varargin{:});


fmtstr = sprintf('N=%d, k=%d', fft_len, bin_number);
set_param(blk, 'AttributesFormatString', fmtstr);

save_state(blk, varargin{:});
 


end


