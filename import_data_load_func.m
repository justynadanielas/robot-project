% kod bierze plik hex_load  z folderu 25.04.2022 o danym r, c
% i na jego podstawie tworzy macierz structów o nazwie A

function A = import_data_load_func(r, c)
    i = 1;
    format_spec = 'sensor_row_%d_col_%d_hex_load.dat';
    file_name = sprintf(format_spec,r,c);
    delimiterIn = '\t';
    A{i} = importdata(file_name,delimiterIn);
end

