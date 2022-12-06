function D = plot_given_r_c_unload(row_num, col_num)
%PLOT_GIVEN_R_C_UNLOAD plots data from unload file for a given row & col number
%   row_num is a number in range [6;15]
%   col_num is a number in range [14;31]

hex_unload = import_data_load_func(row_num, col_num);
robotic_skin_unload = import_data_robotic_skin_load_func(row_num, col_num);
columnFz = hex_unload{1}.data(:,7);

end

