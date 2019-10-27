function complex_sub_init(blk, varargin)
defaults = {'a_bitsize', 10, 'b_bitsize', 10, 'latency', 0};
if same_state(blk, 'defaults', defaults, varargin{:}), return, end
check_mask_type(blk, 'complex_sub');
munge_block(blk, varargin{:});

a = get_var('a_bitsize', varargin{:});
b = get_var('b_bitsize', varargin{:});
lat = get_var('latency', varargin{:});


fmtstr = sprintf('latency=%d', lat);
set_param(blk, 'AttributesFormatString', fmtstr);
save_state(blk, varargin{:});
end