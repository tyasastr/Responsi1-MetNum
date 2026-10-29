% kasus 3 metode biseksi
% Tyasastri Hning Kurniasih - L0325034

function Kasus3()
  % Volume bola = 300 cm^3
  % Vbola = (4/3)pi*r^3
  % (4/3)pi*r^3 = 300
  % (4/3)pi*r^3 - 300 = 0
  % maka:
  f = @(r) (4/3)*pi*r.^3 - 300;

  % interval dari grafik
  a = 4;
  b = 5;

  n = 25;
  tol = 0.0001;

  fa = f(a);
  fb = f(b);

  if fa*fb > 0
    error('Warning tanda sama (f(a)f(b) > 0), tidak ada akar!')
  endif

  fprintf('\nIter\ta\t\tb\t\tc\t\tf(c)\n');

  for i = 1:n

    r = (a+b)/2;
    fc = f(r);

    fprintf('%d\t%.10f\t%.10f\t%.10f\t%.10f\n',...
        i,a,b,r,fc);

    if abs(fc) <= tol
      break;
    endif

    if fa*fc < 0
      b = r;
      fb = fc;
    else
      a = r;
      fa = fc;
    endif

  endfor

  fprintf('\nJari-jari bola dan tabung = %.10f cm\n', r);

  % volume bola
  Vbola = (4/3)*pi*r^3;

  % volume tabung
  % tinggi = diameter = 2r
  Vtabung = pi*r^2*(2*r);

  % volume tabung di luar bola
  Vluar = Vtabung - Vbola;

  fprintf('Volume bola = %.10f cm^3\n',Vbola);
  fprintf('Volume tabung = %.10f cm^3\n',Vtabung);
  fprintf('Volume tabung di luar bola = %.10f cm^3\n',Vluar);

fprintf('\nTyasastri Hning Kurniasih L0325034\n'); %wm
end
