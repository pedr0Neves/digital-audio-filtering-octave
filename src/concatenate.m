%% CONCATENAR E SALVAR O ÁUDIO FILTRADO
% carregar os segmentos já filtrados
[p, fs] = audioread('../audio/processed/audio_p1_filtered.wav');
[q, fs] = audioread('../audio/processed/audio_p2_filtered.wav');

% concatenar
x_filtrado = [p; q];

% normalizar e ajustar amplitude
x_filtrado = x_filtrado / max(abs(x_filtrado));
x_filtrado = min(max(x_filtrado * 1.3, -1), 1);

% salvar
audiowrite('../audio/processed/Laputa_ROT_filtrado.wav', x_filtrado, fs);
disp('O audio foi salvo como "Laputa_ROT_filtrado.wav".');

% espectros pós-filtragem
P = abs(fft(p));
Q = abs(fft(q));
n_1 = length(p);
f_1 = (0:n_1-1)*(fs/n_1);
n_2 = length(q);
f_2 = (0:n_2-1)*(fs/n_2);

% plotar
figure(4);
subplot(2,1,1);
plot(f_1(1:n_1/2), P(1:n_1/2));
title('Espectro- Magnitude x Frequencia');
ylabel('Magnitude');
xlabel('Frequencia (Hz)');
subplot(2,1,2);
plot(f_2(1:n_2/2), Q(1:n_2/2));
title('Espectro- Magnitude x Frequencia');
ylabel('Magnitude');
xlabel('Frequencia (Hz)');
grid on;

print('../figs/graf_espectros_pos.png', '-dpng');
disp('A imagem foi salva como "graf_espectros_pos.png".');
