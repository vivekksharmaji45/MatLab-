dataset_vals = input('Provide array sequence [ ]: ');
lookup_item = input('Enter query element: ');
start_index = 0;
occurrence_tally = 0;

for k = 1:length(dataset_vals)
    if dataset_vals(k) == lookup_item
        start_index = k;
        break;
    end
end

for k = 1:length(dataset_vals)
    if dataset_vals(k) == lookup_item
        occurrence_tally = occurrence_tally + 1;
    end
end

file_handler = fopen('output.txt', 'w');
if start_index > 0
    fprintf(file_handler, 'Value %d found at first position: %d\n', lookup_item, start_index);
    fprintf(file_handler, 'Total occurrences of %d: %d\n', lookup_item, occurrence_tally);
else
    fprintf(file_handler, 'Value %d is absent in the array.\n', lookup_item);
end
fclose(file_handler);
disp('Results successfully saved to lookup_results.txt');
