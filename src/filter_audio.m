%% FILTRO CHEBYSHEV TIPO I
pkg load signal;

% carregar segmentos
[x_1, fs] = audioread('../audio/processed/audio_p1.wav');
[x_2, fs] = audioread('../audio/processed/audio_p2.wav');

% filtro 1: 300–1700 Hz, 6ª ordem
fc = [300, 1700];
[num, den] = cheby1(6, 0.5, fc/(fs/2));
p = filter(num, den, x_1);
audiowrite('../audio/processed/audio_p1_filtered.wav', p, fs);

% filtro 2: 25–1700 Hz, 4ª ordem
fc = [25, 1700];
[num, den] = cheby1(4, 0.5, fc/(fs/2));
q = filter(num, den, x_2);
audiowrite('../audio/processed/audio_p2_filtered.wav', q, fs);

disp('Segmentos filtrados salvos como "audio_p1_filtered.wav" e "audio_p2_filtered.wav".');
