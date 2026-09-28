grid_data = input('Provide a matrix dataset [ ]: ');
[total_rows, total_cols] = size(grid_data);
highest_accum = -inf;
best_row_no = 0;

file_handler = fopen('output.txt', 'w');
for idx_r = 1:total_rows
    accum_sum = 0;
    peak_val = grid_data(idx_r, 1);

    for idx_c = 1:total_cols
        cell_val = grid_data(idx_r, idx_c);
        accum_sum = accum_sum + cell_val;

        if cell_val > peak_val
            peak_val = cell_val;
        end
    end

    mean_val = accum_sum / total_cols;
    fprintf('Row %d: Sum: %d, Average: %d, Maximum: %d\n', idx_r, accum_sum, mean_val, peak_val);
    fprintf(file_handler, 'Row %d: Sum: %d, Average: %d, Maximum: %d\n', idx_r, accum_sum, mean_val, peak_val);

    if accum_sum > highest_accum
        highest_accum = accum_sum;
        best_row_no = idx_r;
    end
end

fprintf('\nRow with Highest Row-Sum is Row: %d \n', best_row_no);
fprintf(file_handler, '\nRow with Highest Row-Sum is Row: %d\n', best_row_no);

fclose(file_handler);
disp('Results successfully saved to grid_report.txt');
