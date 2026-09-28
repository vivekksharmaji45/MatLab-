grades_arr = input('Provide Grade Array: ');
[avg_grade, top_grade, success_cnt, error_cnt] = analyzeMarks(grades_arr);

stream_id = fopen('result.txt', 'w');
fprintf('Input Marks: [ ');
fprintf(stream_id, 'Input Marks: [ ');
for k = 1:length(grades_arr)
    fprintf('%g ', grades_arr(k));
    fprintf(stream_id, '%g ', grades_arr(k));
end
fprintf(stream_id, ']\n\n');
fprintf(stream_id, 'Average Valid Mark : %.2f\n', avg_grade);
fprintf(stream_id, 'Highest Valid Mark : %g\n', top_grade);
fprintf(stream_id, 'Pass Count : %d\n', success_cnt);
fprintf(stream_id, 'Fail Count : %d\n', error_cnt);

fclose(stream_id);
fprintf('\nSaved to grade_analysis.txt\n');
