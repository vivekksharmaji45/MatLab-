matrix_data = input('Enter input matrix values [ ]: ');
[num_r, num_c] = size(matrix_data);
highest_num = matrix_data(1, 1);
best_row = 1;
best_col = 1;

for idx_i = 1:num_r
    for idx_j = 1:num_c
        if matrix_data(idx_i, idx_j) > highest_num
            highest_num = matrix_data(idx_i, idx_j);
            best_row = idx_i;
            best_col = idx_j;
        end
    end
end

stream_id = fopen('output.txt', 'w');
fprintf(stream_id, 'Maximum Element: %d\n', highest_num);
fprintf(stream_id, '1-Based Position: Row %d, Column %d\n', best_row, best_col);
fclose(stream_id);

disp('Results successfully saved to matrix_max_out.txt');
