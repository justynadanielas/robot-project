function [Fz_min_values, Fz_max_values, U_min_values, U_max_values] = statistics_min_max_Fz_U()
%STATISTICS_MIN_MAX_FZ_U Funkcja przechodzi po wszystkich czujnikach i
%zwraca wykresy pokazujące rozkład min i max wartości Fz i U
%   Fz to siła przyłożona do czujnika, a U to napięcie wygenerowane przez
%   czujnik

% Fz_min_values = zeros(1, 180);
Fz_max_values = zeros(1, 180);
% U_min_values = zeros(1, 180);
% U_max_values = zeros(1, 180);
n = 1;

for row_num = 6:1:15
    for col_num = 14:1:31
        [Fz_min, Fz_max, U_min, U_max] = min_max_Fz_U(row_num,col_num);
%         Fz_min_values(n) = Fz_min;
        Fz_max_values(n) = Fz_max;
%         U_min_values(n) = U_min;
%         U_max_values(n) = U_max;
        n = n+1;
    end
end

% histogram(U_max_values, 10)
% title('Distribution of U_max_values', 'Interpreter', 'none')

histogram(Fz_max_values, 10)
title('Distribution of Fz_max_values', 'Interpreter', 'none')

end

