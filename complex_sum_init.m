function complex_sum_init(blk, varargin)
defaults = {'a_bitsize',10, 'a_frac', 9, 'b_bitsize', 10, ...
            'b_frac', 9, 'out_bitsize', 11, 'latency', 1};
if same_state(blk, 'defaults', defaults, varargin{:}), return, end
check_mask_type(blk, 'complex_sum');
munge_block(blk, varargin{:});

a = get_var('a_bitsize', varargin{:});
a_frac = get_var('a_frac', varargin{:});
b = get_var('b_bitsize', varargin{:});
b_frac = get_var('b_frac', varargin{:});
out = get_var('out_bitsize', varargin{:});
lat= get_var('latency', varargin{:});

fmtstr = sprintf('latency=%d', lat);
set_param(blk, 'AttributesFormatString', fmtstr);

save_state(blk, varargin{:});

end
