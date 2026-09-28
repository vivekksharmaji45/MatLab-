data_array = [68, 55, 91, 88, 79, 62, 45, 88, 37];

sz = length(data_array);
top_num = -Inf;
sub_top = -Inf;

for k = 1:sz
    if data_array(k) > top_num
        top_num = data_array(k);
    end
end

for k = 1:sz
    if data_array(k) > sub_top && data_array(k) < top_num
        sub_top = data_array(k);
    end
end

stream_id = fopen('output.txt', 'w');

fprintf(stream_id, 'Input Array: [ ');
for k = 1:sz
    fprintf('%d ', data_array(k));
    fprintf(stream_id, '%d ', data_array(k));
end
fprintf(stream_id, ']\n\n');

fprintf(stream_id, 'Maximum Value        : %d\n', top_num);

if sub_top == -Inf
    fprintf(stream_id, 'Second Distinct Value: Does not exist (All elements are same)\n');
else
    fprintf(stream_id, 'Second Largest Value : %d\n', sub_top);
end

fclose(stream_id);
fprintf('\nResult saved to highest_data.txt\n');
