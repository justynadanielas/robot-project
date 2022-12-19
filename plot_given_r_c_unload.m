function [U_unload, values] = plot_given_r_c_unload(row_num, col_num)
%PLOT_GIVEN_R_C_UNLOAD plots data from unload file for a given row & col number
%   row_num is a number in range [6;15]
%   col_num is a number in range [14;31]

% import danych z plików load
hex_unload = import_data_hex_unload(row_num, col_num);
robotic_skin_unload = import_data_robotic_skin_unload(row_num, col_num);
columnFz = hex_unload{1}.data(:,7);

% z której kolumny bierzemy dane
% ustalenie rozmiaru szukanej kolumny
% robotic_skin_unload to struct zawierający dane z pliku robotic_skin
size_of_robotic_skin = size(robotic_skin_unload{1}.colheaders);

% na tej podstawie tworzę wektor odpowiadającej długości 
colsnum = (1:size_of_robotic_skin(2));

% mapowanie (kluczami są char, a wartościami double) 
mapping = containers.Map(robotic_skin_unload{1}.colheaders, colsnum);

% tworzę zmienną przechowującą nazwę sensora
format_spec = 'row_%d_col_%d';
sensor_name = sprintf(format_spec,row_num,col_num);

% na podstawie tego klucza odczytuję numer odpowiedniej kolumny sensora
robotic_skin_col = mapping(sensor_name);

% U jest typu cell, zapisuję tam dane z danej kolumny (wartości napięcia)
U_unload{row_num}{col_num} = robotic_skin_unload{1}.data(:,robotic_skin_col);

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
k = length(U_unload{row_num}{col_num})/length(columnFz);

% obliczenie wartości dla współczynników funkcji liniowej o poszerzonej
% dziedzinie
new_a1 = a1*(1/k);
new_a2 = a2*(1/k);
new_xk = xk*k;
new_b1 = b1;
new_b2 = b2;
new_xe = xe*k;

% wektor wartości od 1 do 952
vec1 = (1:new_xk-1);

% wektor wartości od  953 do 1538
vec2 = (new_xk:new_xe);

% wzór nowych funkcji liniowych
values1 = new_a1*vec1+new_b1;
values2 = new_a2*vec2+new_b2;

% połączenie tych dwóch funkcji w jedno
% zmieniam 'values' na return funkcji
values = [values1, values2];

% indeksowanie służy naprawieniu problemu z różną liczbą wierszy w pliku
% robotic_skin
f = figure('visible','off');
plot(values(1:1535)', U_unload{row_num}{col_num}(1:1535)); 
format_spec = 'row_%d_col_%d_unload';
plot_name = sprintf(format_spec,row_num,col_num);
title(plot_name, 'Interpreter', 'none')
saveas(f,plot_name,'png');

end

