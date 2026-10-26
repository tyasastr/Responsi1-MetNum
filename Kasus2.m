% kasus 2 metode langsung
% Tyasastri Hning Kurniasih - L0325034

function Kasus2() % kasus 2 metode langsung
  A = [2.5, 1.5, 5, 0.5;
       4, 0.75, 1, 2;
       2, 1.5, 0.5, 6;
       1, 4.25, 2, 0.9];
  b = [161000; 149000; 251500; 173000];
  [n] = size(A, 1); % mengambil jumlah baris dari matriks A

  % menampilkan matriks awal
  fprintf('Matriks awal (sebelum eliminasi): \n')
  for i = 1:n
    fprintf('[ ');
    for j = 1:n
      fprintf('%6g ', A(i,j));
    end
    fprintf('|%6g ]\n', b(i));
  end

% forward elimination
for i = 1 : n-1
    for h = i+1:n
      m = A(h, i) / A(i, i);
      A(h, :) = A(h, :) - m*A(i, :);
      b(h, :) = b(h, :) - m*b(i, :);
    end
end

% menampilkan hasil forward elim
fprintf('\nMatriks yang telah dieliminasi Gauss:\n');
for i = 1:n
    fprintf('[ ');
    for j = 1:n
        fprintf('%10g ', A(i,j));
    end
    fprintf('| %10g ]\n', b(i));
end

% himpunan penyelesaian
x = zeros(n, 1);
for i = n:-1:1
    x(i) = (b(i) - A(i, i+1:n)*x(i+1:n)) / A(i,i);
end

% menampilkan solusi akhir (backward subs)
fprintf('\nSolusi akhir (hasil bacward substitution) x1, x2, x,3 dan, x4:\n')
for i = 1:n
  fprintf('[ %10g ]\n', (x(i)));
end
fprintf("\nHarga/kg\n");
fprintf("Beras: %.2f\n", x(1));
fprintf("Telur: %.2f\n", x(2));
fprintf("Tepung: %.2f\n", x(3));
fprintf("Ayam: %.2f\n", x(4));
fprintf('\nTyasastri Hning Kurniasih L0325034\n'); %wm
end
