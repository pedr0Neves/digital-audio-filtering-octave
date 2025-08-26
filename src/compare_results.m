%% COMPARAR OS TRÊS ÁUDIOS
% carregar os três sinais
[x, fs] = audioread('../audio/original/Laputa_mod.wav');
[y, fs] = audioread('../audio/noisy/Laputa_ROT_mod.wav');
[x_filtrado, fs] = audioread('../audio/processed/Laputa_ROT_filtrado.wav');

% definir vetores de tempo
n = length(x);
t = (0:n-1)/fs * 1000;

n2 = length(y);
t2 = (0:n2-1)/fs * 1000;

n3 = length(x_filtrado);
t3 = (0:n3-1)/fs * 1000;

% plotar comparação
figure(5);
subplot(3,1,1);
plot(t, x);
title('audio x tempo - Laputa');
ylabel('Amplitude');
xlabel('tempo (ms)');
subplot(3,1,2);
plot(t2, min(max(y*1.3, -1), 1));
title('audio x tempo - Laputa ROT');
ylabel('Amplitude');
xlabel('tempo (ms)');
subplot(3,1,3);
plot(t3, min(max(x_filtrado*1.3, -1), 1));
title('audio x tempo - Laputa filtrado');
ylabel('Amplitude');
xlabel('tempo (ms)');
grid on;

% salvar figura
print('../figs/graf_comparacao.png', '-dpng');
disp('A imagem foi salva como "graf_comparacao.png".');
