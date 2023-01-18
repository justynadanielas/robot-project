function [Fz_min, Fz_max, U_min, U_max] = min_max_Fz_U(row_num,col_num)
%MIN_MAX_FZ_U Funkcja zwraca min i max wartości dla Fz i U dla danego
%czujnika
%   Fz to siła przyłożona do czujnika, a U to napięcie wygenerowane przez
%   czujnik

U_load = plot_given_r_c(row_num, col_num);
[U_unload, x] = plot_given_r_c_unload(row_num, col_num);

Fz_min = min(x);
Fz_max = max(x);
U_min = min(U_load{row_num}{col_num});
U_max = max(U_unload{row_num}{col_num});

end

