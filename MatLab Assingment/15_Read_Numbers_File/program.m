stream_in = fopen('input.txt', 'r');

if stream_in == -1
    fprintf('Error: input.txt file can not open!\n');
else
    arr_vals = fscanf(stream_in, '%f');
    fclose(stream_in);

    total_len = length(arr_vals);

    sum_total = 0;
    min_elem = arr_vals(1);
    max_elem = arr_vals(1);
    pos_num = 0;
    neg_num = 0;
    zero_num = 0;

    for k = 1:total_len
        val_item = arr_vals(k);

        sum_total = sum_total + val_item;

        if val_item > min_elem
        else
            min_elem = val_item;
        end

        if val_item > max_elem
            max_elem = val_item;
        end

        if val_item > 0
            pos_num = pos_num + 1;
        elseif val_item < 0
            neg_num = neg_num + 1;
        else
            zero_num = zero_num + 1;
        end
    end

    average_val = sum_total / total_len;

    stream_out = fopen('output.txt', 'w');

    for k = 1:total_len
        fprintf(stream_out, '%d \n', arr_vals(k));
    end
    fprintf(stream_out, 'Total Elements : %d\n', total_len);
    fprintf(stream_out, 'Positive Count : %d\n', pos_num);
    fprintf(stream_out, 'Negative Count : %d\n', neg_num);
    fprintf(stream_out, 'Zero Count     : %d\n', zero_num);
    fprintf(stream_out, 'Sum            : %d\n', sum_total);
    fprintf(stream_out, 'Average        : %.2f\n', average_val);
    fprintf(stream_out, 'Minimum        : %d\n', min_elem);
    fprintf(stream_out, 'Maximum        : %d\n', max_elem);
    fclose(stream_out);
    fprintf('\nAnalysis successfully saved to result_output.txt\n');
end
