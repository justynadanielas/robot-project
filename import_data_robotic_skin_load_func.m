function B = import_data_robotic_skin_load_func(r, c)
%IMPORT_DATA_ROBOTIC_SKIN_FUNC Summary of this function goes here
%   kod bierze plik robotic_skin_load  z folderu 25.04.2022 o danym r, c
%   i na jego podstawie tworzy macierz structów o nazwie B
    i = 1;
    format_spec = 'sensor_row_%d_col_%d_robotic_skin_load.dat';
    file_name = sprintf(format_spec,r,c);
    delimiterIn = '\t';
    B{i} = importdata(file_name,delimiterIn);

end

