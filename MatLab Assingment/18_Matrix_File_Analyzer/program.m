stream_in = fopen('matrix.txt', 'r');

if stream_in == -1
    fprintf('Error: matrix.txt file can not open!\n');
else
    tot_rows = 3;
    tot_cols = 4;

    content = fscanf(stream_in, '%f', [tot_cols, tot_rows]);
    fclose(stream_in);

    grid_b = content';

    min_elem = grid_b(1, 1);
    m_row = 1;
    m_col = 1;

    max_elem = grid_b(1, 1);
    mx_row = 1;
    mx_col = 1;

    for k = 1:tot_rows
        for j = 1:tot_cols
            val_cell = grid_b(k, j);
            if val_cell < min_elem
                min_elem = val_cell;
                m_row = k;
                m_col = j;
            end

            if val_cell > max_elem
                max_elem = val_cell;
                mx_row = k;
                mx_col = j;
            end
        end
    end

    row_accum = zeros(tot_rows, 1);
    peak_sum = -Inf;
    best_idx = 1;

    for k = 1:tot_rows
        sum_row = 0;
        for j = 1:tot_cols
            sum_row = sum_row + grid_b(k, j);
        end
        row_accum(k) = sum_row;

        if sum_row > peak_sum
            peak_sum = sum_row;
            best_idx = k;
        end
    end

    stream_out = fopen('output.txt', 'w');

    for k = 1:tot_rows
        for j = 1:tot_cols
            fprintf('%g\t', grid_b(k, j));
            fprintf(stream_out, '%g\t', grid_b(k, j));
        end
        fprintf('\n');
        fprintf(stream_out, '\n');
    end

    fprintf(stream_out, 'Minimum Value : %g at Position (%d, %d)\n', min_elem, m_row, m_col);
    fprintf(stream_out, 'Maximum Value : %g at Position (%d, %d)\n', max_elem, mx_row, mx_col);

    for k = 1:tot_rows
        fprintf(stream_out, 'Row %d Sum : %g\n', k, row_accum(k));
    end

    fprintf(stream_out, '\nHighest Row Sum : %g (Row %d)\n', peak_sum, best_idx);

    fclose(stream_out);
    fprintf('\nAnalysis saved to grid_output.txt\n');
end
