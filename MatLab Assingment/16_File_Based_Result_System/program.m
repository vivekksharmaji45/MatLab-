file_handle1 = fopen('marks.txt', 'r');
if file_handle1 == -1
    fprintf('Error: marks.txt file nahi khul saki!\n');
else
    score_data = fscanf(file_handle1, '%f', [3, Inf]);
    fclose(file_handle1);
    score_data = score_data';
    num_rows = size(score_data, 1);
    file_handle2 = fopen('result.txt', 'w');

    fprintf(file_handle2, 'Student | Sub1 | Sub2 | Sub3 | Total | Average | Status\n');

    for k = 1:num_rows
        m1 = score_data(k, 1);
        m2 = score_data(k, 2);
        m3 = score_data(k, 3);

        accum_tot = m1 + m2 + m3;
        avg_score = accum_tot / 3;

        if avg_score >= 42
            grade_state = 'Pass';
        else
            grade_state = 'Fail';
        end

        fprintf(file_handle2, 'Student %d | %g | %g | %g | %g | %.2f | %s\n', k, m1, m2, m3, accum_tot, avg_score, grade_state);
    end
    fclose(file_handle2);
    fprintf('\nReport successfully written to output_summary.txt\n');
end
