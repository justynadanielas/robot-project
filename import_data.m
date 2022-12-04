% TODO: 
% w pętli rysować wykresy
% w pętli zapisywać do pliku
% wykres dla load i unload przedstawić na jednym fig

% porównać różne modele aproksymowanej funkcji
% jedna funkcja opisująca i load i unload 
% a na razie spróbować zrobić dwiema
% analiza pętli histerezy
% jaka jest max i min wartość (długość histerezy)
% gauss dla max i min wartości ze wszystkch czujników
% pole histerezy
% jak chcemy rozwijać ten projekt?

hex_load = import_data_load_func();
robotic_skin_load = import_data_robotic_skin_load_func();
columnFz = hex_load{1}.data(:,7);
% z której kolumny bierzemy dane
row_6_col_15 = robotic_skin_load{1}.data(:,210);

% figure(1)
% scatter(linspace(0, length(columnFz), length(columnFz)), columnFz)

% pierwszy punkt na wykresie
x1 = 1;
y1 = columnFz(x1);
% kolanko na wykresie
xk = 220;
yk = columnFz(xk);
% ostatni punkt na wykresie
xe = length(columnFz);
ye = columnFz(xe);

% pierwsza funkcja liniowa
coefficients = polyfit([x1, xk], [y1, yk], 1);
a1 = coefficients (1);
b1 = coefficients (2);

% druga funkcja liniowa
coefficients = polyfit([xk, xe], [yk, ye], 1);
a2 = coefficients (1);
b2 = coefficients (2);

% współczynnik przeskalowania
k = length(row_6_col_15)/length(columnFz);
new_a1 = a1*(1/k);
new_a2 = a2*(1/k);
new_xk = xk*k;
new_b1 = b1;
new_b2 = b2;
new_xe = xe*k;
vec1 = (1:new_xk-1);
vec2 = (new_xk:new_xe);
values1 = new_a1*vec1+new_b1;
values2 = new_a2*vec2+new_b2;
values = [values1, values2];
size(values1)
size(values2)

% figure(2)
% scatter((1:1538), values)

% indeksowanie służy naprawieniu problemu z różną liczbą wierszy w pliku
% robotic_skin
f = figure('visible','off');
scatter(values(1:1537)', row_6_col_15(1:1537)); % Do whatever plotting you want to here
saveas(f,'savedFigure','png');
% size(values')
% size(row_6_col_15)






