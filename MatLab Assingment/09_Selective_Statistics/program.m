dataset_vals = input('Provide array elements [ ]: ');
pos_counter = 0;
pos_summation = 0;

for k_idx = 1:length(dataset_vals)
    if dataset_vals(k_idx) <= 0
        continue;
    end
    pos_counter = pos_counter + 1;
    pos_summation = pos_summation + dataset_vals(k_idx);
end

file_handler = fopen('output.txt', 'w');
if pos_counter > 0
    pos_average = pos_summation / pos_counter;
    fprintf(file_handler, 'Count of Positive Values: %d\n', pos_counter);
    fprintf(file_handler, 'Sum of Positive Values  : %d\n', pos_summation);
    fprintf(file_handler, 'Average of Positive Values: %.2f\n', pos_average);
else
    alert_text = 'No positive values exist in the given array.';
    fprintf('%s\n', alert_text);
    fprintf(file_handler, '%s\n', alert_text);
end
fclose(file_handler);
disp('Saved to pos_analysis_out.txt');
