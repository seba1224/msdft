import numpy as np
import matplotlib.pyplot as plt
import scipy.fftpack as fftpack
import itertools as iterator

def fft_plot(aux, fftlen, fs):
    y = fftpack.fft(aux[1:fftlen])
    power = np.abs(y)
    aux = power[:fftlen/2]
    f = np.linspace(0, 1.0*fs/2, fftlen/2)
    return [f, aux]


def wk(k,N):
    n = np.arange(N)*1.0
    w = np.exp(1j*2*np.pi*k*n/N)
    return w
    

def msdft(signal,k,N):
    w = wk(k,N)
    #comb filter
    comb = np.zeros(len(signal))
    for i in range(len(signal)):
        if ((i-N)<0):
            comb[i] = signal[i]
        else:
            comb[i] = signal[i]-signal[i-int(N)]
    #twid1
    w1 = w**(-1)
    aux = iterator.cycle(w1)
    twid1 = np.zeros(len(comb), dtype=complex)
    for i in range(len(comb)):
        twid1[i] = comb[i]*aux.next()
    
    #resonator
    res = np.zeros(len(twid1), dtype=complex)
    for i in range(len(twid1)):
        if i==0:
           res[i] = twid1[i]
        else:
            res[i] = twid1[i]+res[i-1]

    #twid2
    aux = iterator.cycle(w)
    out = np.zeros(len(res), dtype=complex)
    for i in range(len(res)):
        out[i] = res[i]*aux.next()
    return out




fs = 1
T = 1./fs

t = np.arange(10**6)*1./fs
frec = 2*np.pi*0.01
signal = 5.0*np.sin(frec*t)

fft_len = 2**10
aux = fft_plot(signal, fft_len, fs)


N = 2.**10
#k = int(0.5+fft_len*frec/fs)
#out = msdft(signal, k, N)
k = 10
out = msdft(signal, k, N)




print(20*np.log10(aux[1][k]+1.0))
plt.plot(aux[0], 20*np.log10(aux[1]+1.0))
plt.title('input signal spectrum')
plt.ylabel('[dB]')

plt.figure()
plt.plot(20*np.log10(np.abs(out[:6000]+1.0)))
plt.title('msdf')
plt.ylabel('[dB]')

plt.figure()
asd = out[::int(N)]
plt.plot(20*np.log10(np.abs(asd)+1.0))
plt.title('msdf taking every N samples at the output')
plt.ylabel('[dB]')

plt.show()

