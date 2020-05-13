function fftPlotter(signal,fs)
%FFTPLOTTER Takes signal and sampling rate to comute fft and plot results

%by Benjamin Quessy

signal_fft = fft(signal);
L=length(signal_fft);
f = fs*(0:(L/2))/L;
P2 = abs(signal_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

plot(f,P1); 

xlabel('frenquence (Hz)');
ylabel('|P1(f)|');

ax = gca;
ax.XAxis.Exponent = 3;
end

