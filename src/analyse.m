%% DIVIDIR O ÁUDIO E PLOTAR ESPECTROS (PRÉ-FILTRAGEM)
[y, fs] = audioread('../audio/noisy/Laputa_ROT_mod.wav');

% dividir o audio no instrumental e quando comeca a cantar (14s)
n_samples = fs * 14;
x_1 = x(1:n_samples);
x_2 = x(n_samples+1:end);

% salvar segmentos
audiowrite('../audio/processed/audio_p1.wav', x_1, fs);
disp('O audio foi salvo como "audio_p1.wav".');
audiowrite('../audio/processed/audio_p2.wav', x_2, fs);
disp('O audio foi salvo como "audio_p2.wav".');

% espectros
X_1 = abs(fft(x_1));
X_2 = abs(fft(x_2));
n_1 = length(x_1);
f_1 = (0:n_1-1)*(fs/n_1);
n_2 = length(x_2);
f_2 = (0:n_2-1)*(fs/n_2);

% plotar
figure(3);
subplot(2,1,1);
plot(f_1(1:n_1/2), X_1(1:n_1/2));
title('Espectro- Magnitude x Frequencia');
ylabel('Magnitude');
xlabel('Frequencia (Hz)');
subplot(2,1,2);
plot(f_2(1:n_2/2), X_2(1:n_2/2));
title('Espectro- Magnitude x Frequencia');
ylabel('Magnitude');
xlabel('Frequencia (Hz)');
grid on;

print('../figs/graf_espectros_pre.png', '-dpng');
disp('A imagem foi salva como "graf_espectros_pre.png".');

