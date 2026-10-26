% pengerjaan kasus 2 metode tidak langsung (ga bisa)
% Tyasastri Hning Kurniasih - L0325034

function Kasus2GaussSeidel() % kasus 2 metode tidak langsung
  A = [2.5, 1.5, 5, 0.5;
       4, 0.75, 1, 2;
       2, 1.5, 0.5, 6;
       1, 4.25, 2, 0.9];
  b = [161000; 149000; 251500; 173000];
  n = length(b);
  max_iterasi = 20;
  tol = 0.001;

  % menampilkan matriks awal
  fprintf('Matriks awal (sebelum eliminasi): \n')
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6g ', A(i,j));
    end
    fprintf('|%6g ]\n', b(i));
  end

fprintf('Metode Gauss-Seidel\n');
fprintf('Menggunakan N = %d\n', max_iterasi);
fprintf('Toleransi error = %f\n\n', tol);

% inisialisasi tebakan awal
x = zeros(n, 1);
konvergen = false;

% iterasi
for iter = 1:max_iterasi
  x_old = x;

  for i = 1:n
    sum_val = 0;

    for j = 1:n
      if i ~= j
        sum_val = sum_val + A(i, j) * x(j);
      end
    end
    x(i) = (b(i) - sum_val) / A(i, i);
  end

  % perhitungan error relatif
  err = norm(x - x_old) / max(norm(x), eps);
  fprintf('Iterasi ke-%d, error = %.6f\n', iter, err);

  % periksa toleransi
  if err < tol
    konvergen =true;
    fprintf('\nToleransi terpenuhi pada iterasi ke-%d\n dengan error < 0.001\n', iter);
    break;
  end
end

if konvergen
  fprintf('\nMetode Gauss-Seidel konvergen\n');
else
  fprintf('\nMetode Gauss-Seidel tidak konvergen\n');
endif
fprintf('\nTyasastri Hning Kurniasih L0325034\n'); %wm
end
