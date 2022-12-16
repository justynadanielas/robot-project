function F = import_data_robotic_skin_unload(r, c)
%IMPORT_DATA_ROBOTIC_SKIN_UNLOAD 
%   kod bierze plik robotic_skin_unload  z folderu 25.04.2022 o danym r, c
%   i na jego podstawie tworzy macierz structów o nazwie F
    i = 1;
    format_spec = 'sensor_row_%d_col_%d_robotic_skin_unload.dat';
    file_name = sprintf(format_spec,r,c);
    delimiterIn = '\t';
    F{i} = importdata(file_name,delimiterIn);

end

