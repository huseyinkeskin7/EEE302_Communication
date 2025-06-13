%% Hüseyin Berk Keskin
%% 20201706019

clc, clear, close all

%% Variables
Fs = 40000;   % sampling frequency
Ts = 1/Fs;  % sampling interval
Fc = 15000; % carrier frequency
B = 5000;   % message bandwidth
T = (0:Ts:2); % message length in sec.

%% Task2-a
m1 = audioread('speech.wav'); % Speech
m2c = audioread('classic.wav'); % Classic Music
m1 = m1(1:5:400001);
m2c = m2c(20000:5:420000);
m2 = cos(2*pi*Fc*T).*m2c;
modulated = m1+m2;

% FFT
N=1024;

[shifted_speech_signal, F_speech_signal, freqAxis1] = zero_padding_FFT(m1, Fs, N);
[shifted_classical_music, F_classical_music, freqAxis2] = zero_padding_FFT(m2c, Fs, N);
[shifted_sum, F_sum, freqAxis3] = zero_padding_FFT(modulated, Fs, N);

%% Task2-b

% Low Pass Filter
[b, a] = butter(5, 650/(Fs/2), 'low');
m1r = filtfilt(b, a, modulated);
h=freqz(b,a,floor(512));
[shifted_LP, F_LP, freqAxis4] = zero_padding_FFT(m1r, Fs, N);


% Band Pass Filter+Low Pass Filter
f_low = 12500;
f_high = 17500;
[b, a] = butter(6, [f_low/(Fs/2), f_high/(Fs/2)], 'bandpass');
bandpass_filtered = filtfilt(b, a, modulated);
bandpass_carried = bandpass_filtered .* cos(2*pi*Fc*T);


[b, a] = butter(5, 650/(Fs/2), 'low');
m2r = filtfilt(b, a, bandpass_carried);
[shifted_BP_LP, F_BP_LP, freqAxis5] = zero_padding_FFT(m2r, Fs, N);


%% Task2-c
% (1)
figure(1)
subplot(221)
plot(T, m1)
title('Message Signal 1 TD')
ylabel('M_1(t)')
xlabel('Time (Sec)')
% (4)
subplot(222)
plot(freqAxis1,abs(shifted_LP));
title('Message Signal 1 FD (1)')
ylabel('M_1(f)')
xlabel('Frequency (Hz)')
subplot(223)
plot(T, m1r)
title('Received Message Signal 1 TD')
ylabel('m_1(t)')
xlabel('Time (Sec)')
subplot(224)
plot(freqAxis4,abs(shifted_LP));
title('Received Message Signal 1 FD (4)')
ylabel('m_1(f)')
xlabel('Frequency (Hz)')

% (2)
figure(2);
subplot(221)
plot(T, m2c)
title('Message Signal 2 TD')
ylabel('M_2(t)')
xlabel('Time (Sec)')
subplot(222)
plot(freqAxis2,abs(shifted_classical_music));
title('Message Signal 2 FD (2)')
ylabel('M_2(f)')
xlabel('Frequency (Hz)')
% (5)
subplot(223)
plot(T, m2r)
title('Received Message Signal 2 TD')
ylabel('m_2(t)')
xlabel('Time (Sec)')
subplot(224)
plot(freqAxis5,abs(shifted_BP_LP));
title('Received Message Signal 2 FD (5)')
ylabel('m_2(f)')
xlabel('Frequency (Hz)')


% (3)
figure(7);
subplot(211)
plot(T, modulated)
title('Sum of Message Signals in Time Domain')
ylabel('M_1(t)+M_2(t)')
xlabel('Time (Sec)')
subplot(212)
plot(freqAxis3,abs(shifted_sum));
title('Sum of Message Signals in Frequnecy Domain (3)')
ylabel('M_1(f)+M_2(f)')
xlabel('Frequency (Hz)')



%% Task2-d

% m1 sinyali için sound (transmitted 1)
sound(m1,10000);

% % m1r sinyali için sound (received 1)
sound(m1r,18000);

% m2 sinyali için sound (transmitted 2)
sound(m2c,10000);

% m2r sinyali için sound (received 2)
sound(m2r,30000);

