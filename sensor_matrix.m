function H = sensor_matrix()
%SENSOR_MATRIX Funkcja tworzy macierz odzwierciedlającą ułożenie sensorow w
%skórze
%   Działające sensory są reprezentowane przez 1, a niedziałające przez 0
H = zeros(10, 18);
n = 1;
limit = 10;
U_max_values = zeros(1, 180);

for row_num = 6:1:15
    for col_num = 14:1:31
        [Fz_min, Fz_max, U_min, U_max] = min_max_Fz_U(row_num,col_num);
%         Fz_min_values(n) = Fz_min;
%         Fz_max_values(n) = Fz_max;
%         U_min_values(n) = U_min;
        U_max_values(n) = U_max;
        if U_max_values(n)>limit
            H(row_num-5, col_num-13) = 1;
        end
        n = n+1;
    end
end

H

end

