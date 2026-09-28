first_grid = input('Provide first matrix array [ ]: ');
second_grid = input('Provide second matrix array [ ]: ');

[r_sz1, c_sz1] = size(first_grid);
[r_sz2, c_sz2] = size(second_grid);

file_handler = fopen('output.txt', 'w');

if c_sz1 ~= r_sz2
    fprintf(file_handler, 'Multiplication not possible: Columns of Matrix 1 (%d) must equal Rows of Matrix 2 (%d).\n', c_sz1, r_sz2);
else
    for r_idx = 1:r_sz1
        for c_idx = 1:c_sz2
            sum_total = 0;
            for k_idx = 1:c_sz1
                sum_total = sum_total + first_grid(r_idx, k_idx) * second_grid(k_idx, c_idx);
            end
            manual_grid(r_idx, c_idx) = sum_total;
        end
    end

    builtin_grid = first_grid * second_grid;

    flag_check = 1;
    for r_idx = 1:r_sz1
        for c_idx = 1:c_sz2
            if manual_grid(r_idx, c_idx) ~= builtin_grid(r_idx, c_idx)
                flag_check = 0;
            end
        end
    end

    fprintf(file_handler, 'Manual Result:\n');
    for r_idx = 1:r_sz1
        for c_idx = 1:c_sz2
            fprintf(file_handler, '%d\t', manual_grid(r_idx, c_idx));
        end
        fprintf(file_handler, '\n');
    end

    fprintf(file_handler, '\nMATLAB Built-in Result:\n');
    for r_idx = 1:r_sz1
        for c_idx = 1:c_sz2
            fprintf(file_handler, '%d\t', builtin_grid(r_idx, c_idx));
        end
        fprintf(file_handler, '\n');
    end

    if flag_check == 1
        fprintf(file_handler, '\nMatch Status: Both results MATCH perfectly!\n');
    else
        fprintf(file_handler, '\nMatch Status: Results DO NOT match.\n');
    end
end

fclose(file_handler);
disp('Saved to matrix_product_out.txt');
