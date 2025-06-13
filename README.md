# DESIGN OF A FREQUENCY DIVISION MULTIPLEXING (FDM) SYSTEM
# Türkçe
Bu MATLAB kodu, frekans bölmeli çoklama (FDM) sistemini simüle eder. İki farklı mesaj sinyali (klasik müzik ve konuşma) sisteme alınır. Her sinyal, farklı taşıyıcı frekanslarla çarpılarak modüle edilir. Modüle edilen sinyaller birleştirilerek tek bir bileşik sinyal oluşturulur. Daha sonra, bu sinyalin frekans bileşenleri FFT kullanılarak analiz edilir. Son adımda ise, bant geçiren ve alçak geçiren filtreler ile orijinal sinyaller geri elde edilir. Bu sayede FDM sisteminin çalışma mantığı hem görsel hem işitsel olarak gözlemlenir.

# English
This MATLAB script simulates a Frequency Division Multiplexing (FDM) system. Two different message signals (classical music and speech) are imported into the system. Each signal is modulated by multiplying it with a unique carrier frequency. The modulated signals are then combined into a single composite signal. Next, the frequency components of this signal are analyzed using the FFT. Finally, band-pass and low-pass filters are applied to recover the original signals. This allows for a visual and auditory observation of how an FDM system operates.
