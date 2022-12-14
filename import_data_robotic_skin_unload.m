function F = import_data_robotic_skin_unload(r, c)
%IMPORT_DATA_ROBOTIC_SKIN_UNLOAD Summary of this function goes here
%   Detailed explanation goes here
    i = 1;
    format_spec = 'sensor_row_%d_col_%d_robotic_skin_unload.dat';
    file_name = sprintf(format_spec,r,c);
    delimiterIn = '\t';
    F{i} = importdata(file_name,delimiterIn);

end

