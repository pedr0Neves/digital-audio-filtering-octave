%% PREPROCESS: Recorte dos 20 primeiros segundos
pkg load signal;

% carregar o arquivo da musica base
[x, fs] = audioread('../audio/original/Laputa.wav');

% definir o corte da musica para os 20 primeiros segundos
max_time = 20;
n_samples = min(length(x), fs * max_time);
x = x(1:n_samples);

% salvar a musica recortada
audiowrite('../audio/original/Laputa_mod.wav', x, fs);
disp('O audio foi salvo como "Laputa_mod.wav".');

% agora vamos repetir o mesmo processo para o arquivo de musica ruidosa
[y, fs] = audioread('../audio/noisy/Laputa_ROT.wav');
n_samples = min(length(y), fs * max_time);
y = y(1:n_samples);
audiowrite('../audio/noisy/Laputa_ROT_mod.wav', y, fs);
disp('O audio foi salvo como "Laputa_ROT_mod.wav".');
