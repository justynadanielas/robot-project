function G = plot_given_load_unload(row_num, col_num)
%PLOT_GIVEN_LOAD_UNLOAD Summary of this function goes here
%   Detailed explanation goes here


U_load = plot_given_r_c(row_num, col_num);
[U_unload, x] = plot_given_r_c_unload(row_num, col_num);

f = figure('visible','off');
plot(x(1:1535)', flip(U_load{row_num}{col_num}(1:1535))); 
hold on
plot(x(1:1535)', U_unload{row_num}{col_num}(1:1535));

format_spec = 'row_%d_col_%d_load_unload';
plot_name = sprintf(format_spec,row_num,col_num);
title(plot_name, 'Interpreter', 'none')
saveas(f,plot_name,'png');
end

