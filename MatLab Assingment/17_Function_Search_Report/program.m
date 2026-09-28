stream_in = fopen('numbers.txt', 'r');

if stream_in == -1
    fprintf('Error: numbers.txt file can not open!\n');
else
    arr_in = fscanf(stream_in, '%f');
    fclose(stream_in);

    lookup_num = 50;

    [start_idx, tally_cnt] = findValue(arr_in, lookup_num);

    stream_out = fopen('output.txt', 'w');

    fprintf('Array: [ ');
    fprintf(stream_out, 'Array: [ ');
    for k = 1:length(arr_in)
        fprintf(stream_out, '%g ', arr_in(k));
    end
    fprintf(stream_out, ']\n\n');

    fprintf(stream_out, 'Target Value     : %g\n', lookup_num);
    fprintf(stream_out, 'First Index      : %d\n', start_idx);
    fprintf(stream_out, 'Total Occurrence : %d\n', tally_cnt);

    fclose(stream_out);
    fprintf('\nSearch results saved to lookup_summary.txt\n');
end
