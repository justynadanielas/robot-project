% kod bierze plik z folderu 25.04.2022 
% i na jego podstawie tworzy macierz structów o nazwie A

function A = import_data_load_func(r, c)
    i = 1;
%     for r = 6:1:15
%         for c = 14:1:31
%             r = 6;
%             c = 15;
            format_spec = 'sensor_row_%d_col_%d_hex_load.dat';
            file_name = sprintf(format_spec,r,c);
            delimiterIn = '\t';
            A{i} = importdata(file_name,delimiterIn);
            i = i+1;
%         end
%     end
end

