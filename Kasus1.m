
% pengerjaan kasus 1 responsi 1
% Tyasastri Hning Kurniasih L0325034

function Kasus1()
  t = linspace(0, 5, 500);
  x = 3 * t;
  eksak = hitungNilaiEksak(t);           % hitung nilai
  hasil_n23 = hitungPendekatan(x, 23);
  hasil_n24 = hitungPendekatan(x, 24);
  hasil_n25 = hitungPendekatan(x, 25);
  tampilkanHasil(eksak, hasil_n23, hasil_n24, hasil_n25);

  figure;
  hold on;
  plot(t, eksak, 'r');
  plot(t, hasil_n23, 'g');
  plot(t, hasil_n24, 'y');
  plot(t, hasil_n25, 'b');
  aturGrafik(eksak, hasil_n23, hasil_n24, hasil_n25);
  hold off;
endfunction

function eksak = hitungNilaiEksak(t)
  eksak = 5 * (cos((t * 36)/12) + exp(10));
endfunction

function hasil = hitungPendekatan(x, n)
  deret_cos = 0;
  deret_exp = 0;
  for i = 0:(n-1)
    deret_cos += (-1)^i * (x.^(2*i)) / factorial(2*i);
    deret_exp += (10^i) / factorial(i);
  endfor
  hasil = 5 * (deret_cos + deret_exp);
endfunction


function tampilkanHasil(eksak, n23, n24, n25)
  fprintf('\nRata-Rata Hasil Perhitungan\n');
  fprintf('feksak : %.6f\n', mean(eksak));
  fprintf('fn=23  : %.6f\n', mean(n23));
  fprintf('fn=24  : %.6f\n', mean(n24));
  fprintf('fn=25  : %.6f\n', mean(n25));

  % Menghitung galat mutlak pada setiap titik
  error_n23 = abs(eksak - n23);
  error_n24 = abs(eksak - n24);
  error_n25 = abs(eksak - n25);

  % Menghitung rerata galat mutlak
  galat23 = mean(error_n23);
  galat24 = mean(error_n24);
  galat25 = mean(error_n25);

  fprintf('\nGalat Mutlak\n');
  fprintf('fn=23 : %.8f\n', galat23);
  fprintf('fn=24 : %.8f\n', galat24);
  fprintf('fn=25 : %.8f\n', galat25);

  % Menghitung galat relatif dalam persen
  penyebut = mean(abs(eksak));
  rel23 = galat23 / penyebut * 100;
  rel24 = galat24 / penyebut * 100;
  rel25 = galat25 / penyebut * 100;

  fprintf('\nPersentase Galat Relatif\n');
  fprintf('fn=23 : %.8f%%\n', rel23);
  fprintf('fn=24 : %.8f%%\n', rel24);
  fprintf('fn=25 : %.8f%%\n', rel25);

  % Memeriksa toleransi 1 persen
  fprintf('\nPemeriksaan Toleransi 1%%\n');

  if rel23 <= 1
    fprintf('fn=23 memenuhi toleransi.\n');
  else
    fprintf('fn=23 tidak memenuhi toleransi.\n');
  endif

  if rel24 <= 1
    fprintf('fn=24 memenuhi toleransi.\n');
  else
    fprintf('fn=24 tidak memenuhi toleransi.\n');
  endif

  if rel25 <= 1
    fprintf('fn=25 memenuhi toleransi.\n');
  else
    fprintf('fn=25 tidak memenuhi toleransi.\n');
  endif
endfunction

function aturGrafik(feksak, hasil_n23, hasil_n24, hasil_n25)
  text(0.5, 0.95, 'Tyasastri Hning Kurniasih - L0325034', ...
       'Units', 'normalized', ...
       'HorizontalAlignment', 'center', ...
       'VerticalAlignment', 'top', ...
       'FontSize', 10, ...
       'Color', [0.65 0.65 0.65]);

  grid on;
  xlabel('t');
  ylabel('h');
  title('Visualisasi Gelombang Air Laut h = h_0(cos(tv/\lambda)+e^x)', ...
        'FontSize', 12);

  legend('feksak', 'fn = 23', 'fn = 24', 'fn = 25', ...
         'location', 'southeastoutside');

  pos_x = 3;
  idx = 375;
  text(pos_x, feksak(idx), 'feksak', 'FontSize', 9);
  text(pos_x, hasil_n23(idx), 'fn = 23', 'FontSize', 9);
  text(pos_x, hasil_n24(idx), 'fn = 24', 'FontSize', 9);
  text(pos_x, hasil_n25(idx), 'fn = 25', 'FontSize', 9);

  fprintf('\nTyasastri Hning Kurniasih L0325034\n');
endfunction
