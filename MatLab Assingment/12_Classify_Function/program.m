clear; clc;

list_x = [8, -6, 0, 4, -2, 0, 10, 11];
list_y = [-5, -12, 3, -11, 0, -8, 5, 9];

[pos_x, neg_x, zero_x, even_x, odd_x] = classifyArray(list_x);
[pos_y, neg_y, zero_y, even_y, odd_y] = classifyArray(list_y);

stream_id = fopen('output.txt', 'w');

fprintf('Array 1: [ ');
fprintf(stream_id, 'Array 1: [ ');
for k = 1:length(list_x)
    fprintf(stream_id, '%d ', list_x(k));
end
fprintf(stream_id, ']\n');

fprintf(stream_id, 'Array 2: [ ');
for k = 1:length(list_y)
    fprintf(stream_id, '%d ', list_y(k));
end

fprintf(stream_id, ']\n\n');
fprintf(stream_id, 'Metric | Array 1 | Array 2\n');
fprintf(stream_id, 'Positive Count | %d | %d\n', pos_x, pos_y);
fprintf(stream_id, 'Negative Count | %d | %d\n', neg_x, neg_y);
fprintf(stream_id, 'Zero Count | %d | %d\n', zero_x, zero_y);
fprintf(stream_id, 'Even Count | %d | %d\n', even_x, even_y);
fprintf(stream_id, 'Odd Count | %d | %d\n', odd_x, odd_y);
fclose(stream_id);
fprintf('\nSaved to array_stats_out.txt\n');
