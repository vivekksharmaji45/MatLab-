file_h1 = fopen('student_marks.txt', 'r');
if file_h1 == -1
    fprintf('Error: student_marks.txt file can not open!\n');
else
    grades_in = fscanf(file_h1, '%f');
    fclose(file_h1);

    len_items = length(grades_in);

    [ok_cnt, sum_total, average_score, max_grade, min_grade, pass_tally, fail_tally, status_flag] = resultSummary(grades_in);

    file_h2 = fopen('final_report.txt', 'w');

    if file_h2 == -1
        fprintf('Error: report_results.txt file not create/write!\n');
    else
        fprintf(file_h2, '\nRaw Input Marks:\n');

        for k = 1:len_items
            fprintf('%g ', grades_in(k));
            fprintf(file_h2, '%g ', grades_in(k));
        end
        fprintf(file_h2, 'Total Entries Read : %d\n', len_items);
        fprintf(file_h2, 'Valid Marks Count  : %d\n', ok_cnt);
        fprintf(file_h2, 'Invalid Entries    : %d\n', len_items - ok_cnt);
        fprintf(file_h2, 'Total Valid Marks  : %g\n', sum_total);
        fprintf(file_h2, 'Average Mark       : %.2f\n', average_score);
        fprintf(file_h2, 'Highest Mark       : %g\n', max_grade);
        fprintf(file_h2, 'Lowest Mark        : %g\n', min_grade);
        fprintf(file_h2, 'Pass Count         : %d\n', pass_tally);
        fprintf(file_h2, 'Fail Count         : %d\n', fail_tally);
        fprintf(file_h2, 'Overall Status     : %s\n', status_flag);
        fclose(file_h2);
        fprintf('\nReport successfully generated and saved to report_results.txt\n');
    end
end
