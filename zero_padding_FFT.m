function [shiftedSpectrum,spectrum,freqAxis]=zero_padding_FFT(signal,fs,N)
%This function will compute the fast fourier transform of the given signal
% with N points

k=0:N-1;     %create a vector from 0 to N-1
T=N/fs;      %signal duration in time domain
freq=k/T;    %create the frequency axis

spectrum=fft(signal,N); % normalized fast fourier transform
shiftedSpectrum = fftshift(spectrum); %shifted fft for better observation
freqAxis = (-fs/2)+freq; %Creating the freqeuncy axis for plotting (for shifted fft)
end

