function G = plot_given_load_unload(row_num, col_num)
%PLOT_GIVEN_LOAD_UNLOAD Summary of this function goes here
%   Detailed explanation goes here


U_load = plot_given_r_c(row_num, col_num);
[U_unload, x] = plot_given_r_c_unload(row_num, col_num);

% sprawdzanie, jak się dostać do wartości U_load i U_unload
% U_load{6}{29}

f = figure('visible','off');
plot(x(1:1533)', U_load{row_num}{col_num}(1:1533)); 
hold on
plot(x(1:1533)', flip(U_unload{row_num}{col_num}(1:1533)));
xlim([0 inf]) 
xlabel('Fz')
ylabel('U')
legend('load','unload', 'Location', 'NorthWest')

format_spec = 'row_%d_col_%d_load_unload';
plot_name = sprintf(format_spec,row_num,col_num);
title(plot_name, 'Interpreter', 'none')
saveas(f,plot_name,'png');
end

