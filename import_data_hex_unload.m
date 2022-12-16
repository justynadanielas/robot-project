function E = import_data_hex_unload(r, c)
%IMPORT_DATA_HEX_UNLOAD imports data from hex_load file
%   r is a number in range [6;15]
%   c is a number in range [14;31]
%   kod bierze plik hex_unload  z folderu 25.04.2022 o danym r, c
%   i na jego podstawie tworzy macierz structów o nazwie E
    i = 1;
    format_spec = 'sensor_row_%d_col_%d_hex_unload.dat';
    file_name = sprintf(format_spec,r,c);
    delimiterIn = '\t';
    E{i} = importdata(file_name,delimiterIn)
end

