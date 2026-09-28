dataset = input('Provide array elements [ ]: ');
pos_tally = 0;
neg_tally = 0;
zero_tally = 0;
even_tally = 0;
odd_tally = 0;
pos_total = 0;
neg_total = 0;

for idx = 1:length(dataset)
    if dataset(idx) > 0
        pos_tally = pos_tally + 1;
        pos_total = pos_total + dataset(idx);
    elseif dataset(idx) < 0
        neg_tally = neg_tally + 1;
        neg_total = neg_total + dataset(idx);
    else
        zero_tally = zero_tally + 1;
    end

    if dataset(idx) >= 0
        if mod(dataset(idx), 2) == 0
            even_tally = even_tally + 1;
        else
            odd_tally = odd_tally + 1;
        end
    end
end

if pos_tally >= neg_tally && pos_tally >= zero_tally
    dominant_type = 'Positive';
elseif neg_tally >= pos_tally && neg_tally >= zero_tally
    dominant_type = 'Negative';
else
    dominant_type = 'Zero';
end
stream_handle = fopen('output.txt', 'w');
fprintf(stream_handle, 'Positive Values Count: %d\n', pos_tally);
fprintf(stream_handle, 'Negative Values Count: %d\n', neg_tally);
fprintf(stream_handle, 'Zero Values Count    : %d\n', zero_tally);
fprintf(stream_handle, 'Even Integers Count  : %d\n', even_tally);
fprintf(stream_handle, 'Odd Integers Count   : %d\n', odd_tally);
fprintf(stream_handle, 'Sum of Positive Values: %g\n', pos_total);
fprintf(stream_handle, 'Sum of Negative Values: %g\n', neg_total);
fprintf(stream_handle, 'Highest Count Category: %s\n', dominant_type);

fclose(stream_handle);

disp('Results successfully saved to analysis_data.txt');
