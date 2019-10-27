function twid_msdft_init(blk, varargin)

defaults = {'fft_len', 10, 'twid_bitsize', 18, 'bin_num', 0};

if same_state(blk, 'defaults', defaults, varargin{:}), return, end
check_mask_type(blk, 'msdft_twiddle_factors');
munge_block(blk, varargin{:});


N = get_var('fft_len', varargin{:});
twid_size = get_var('twid_bitsize', varargin{:});
bin_number = get_var('bin_num', varargin{:});

fmtstr = sprintf('N=%d, k=%d', N, bin_number);
set_param(blk, 'AttributesFormatString', fmtstr);

save_state(blk, varargin{:});

end

