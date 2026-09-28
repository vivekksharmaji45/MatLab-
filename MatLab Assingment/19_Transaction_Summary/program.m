file_h1 = fopen('transactions.txt', 'r');

if file_h1 == -1
    fprintf('Error: transactions.txt file nahi khul saki!\n');
else
    entries = fscanf(file_h1, '%f');
    fclose(file_h1);

    total_len = length(entries);

    tot_inc = 0;
    tot_exp = 0;
    inc_count = 0;
    exp_count = 0;
    zero_count = 0;
    max_inc = 0;
    max_exp_mag = 0;

    for k = 1:total_len
        curr_val = entries(k);

        if curr_val > 0
            tot_inc = tot_inc + curr_val;
            inc_count = inc_count + 1;

            if curr_val > max_inc
                max_inc = curr_val;
            end

        elseif curr_val < 0
            tot_exp = tot_exp + curr_val;
            exp_count = exp_count + 1;

            mag_val = -curr_val;
            if mag_val > max_exp_mag
                max_exp_mag = mag_val;
            end

        else
            zero_count = zero_count + 1;
        end
    end

    final_bal = tot_inc + tot_exp;

    file_h2 = fopen('output.txt', 'w');
    fprintf(file_h2, 'Total Transactions      : %d\n', total_len);
    fprintf(file_h2, 'Credit Transactions     : %d\n', inc_count);
    fprintf(file_h2, 'Debit Transactions      : %d\n', exp_count);
    fprintf(file_h2, 'Zero Transactions       : %d\n', zero_count);
    fprintf(file_h2, 'Total Credits Amount    : %g\n', tot_inc);
    fprintf(file_h2, 'Total Debits Amount     : %g\n', tot_exp);
    fprintf(file_h2, 'Net Balance             : %g\n', final_bal);
    fprintf(file_h2, 'Largest Credit          : %g\n', max_inc);
    fprintf(file_h2, 'Largest Debit Magnitude : %g\n', max_exp_mag);
    fclose(file_h2);
    fprintf('\nSummary saved to report_out.txt\n');
end
