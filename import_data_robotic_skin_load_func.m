function B = import_data_robotic_skin_load_func(r, c)
%IMPORT_DATA_ROBOTIC_SKIN_FUNC Summary of this function goes here
%   Detailed explanation goes here
i = 1;
%     for r = 6:1:15
%         for c = 14:1:31
%             r = 6;
%             c = 15;
            format_spec = 'sensor_row_%d_col_%d_robotic_skin_load.dat';
            file_name = sprintf(format_spec,r,c);
            delimiterIn = '\t';
            B{i} = importdata(file_name,delimiterIn);
            i = i+1;
%         end
%     end
end

