matrix_cells = {[15, -2, 70, 10, -5, 40], [-10, -20, -4, -6, -250]};

stream_h = fopen('output.txt', 'w');
for count_k = 1:length(matrix_cells)
    seq_item = matrix_cells{count_k};
    fprintf(stream_h, 'Test Case %d Input Array: [ ', count_k);
    for j_idx = 1:length(seq_item)
        fprintf('%d ', seq_item(j_idx));
        fprintf(stream_h, '%d ', seq_item(j_idx));
    end
    fprintf(stream_h, ']\n');
    [accum_sum, avg_val, min_elem, max_elem] = arraySummary(seq_item);

    fprintf(stream_h, 'Total   : %d\n', accum_sum);
    fprintf(stream_h, 'Average : %.2f\n', avg_val);
    fprintf(stream_h, 'Minimum : %d\n', min_elem);
    fprintf(stream_h, 'Maximum : %d\n\n', max_elem);
end
fclose(stream_h);
fprintf('\nSaved to array_analysis_out.txt\n');
