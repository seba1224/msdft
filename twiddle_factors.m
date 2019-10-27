function out = twiddle_factors(N,k,flag)
   n = [0:1:2^N-1];
   disp(k)
   fact = exp(2*pi*1i/(2^N)*n*k);
    if (flag==0)
        out = real(fact);
        %disp('real')
    else
        out = imag(fact);
        %disp('imag')
    end
end