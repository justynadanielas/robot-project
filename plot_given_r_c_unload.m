function [U_unload, values] = plot_given_r_c_unload(row_num, col_num)
%PLOT_GIVEN_R_C_UNLOAD plots data from unload file for a given row & col number
%   row_num is a number in range [6;15]
%   col_num is a number in range [14;31]

% import danych z plików load
hex_unload = import_data_hex_unload(row_num, col_num);
robotic_skin_unload = import_data_robotic_skin_unload(row_num, col_num);
columnFz_negative = hex_unload{1}.data(:,7);
columnFz = columnFz_negative*(-1);

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

% ta metoda wydaje się bardziej naukowa
% values = resample(columnFz, 1535, length(columnFz));

% ta metoda daje wykresy bardziej przypominające poprzednia
Fz_max = max(columnFz);
values = linspace(0, Fz_max, 1533);

% indeksowanie służy naprawieniu problemu z różną liczbą wierszy w pliku
% robotic_skin
% f = figure('visible','off');
% plot(values(1:1533)', U_unload{row_num}{col_num}(1:1533)); 
% xlim([0 inf]) 
% xlabel('Fz')
% ylabel('U')
% format_spec = 'row_%d_col_%d_unload';
% plot_name = sprintf(format_spec,row_num,col_num);
% title(plot_name, 'Interpreter', 'none')
% saveas(f,plot_name,'png');

end

