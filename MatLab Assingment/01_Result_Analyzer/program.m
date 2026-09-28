grades_input = input('Provide input marks array []: ');
ok_grades = [];
bad_grades = [];
accum_sum = 0;
unsuccessful_count = 0;
successful_count = 0;

for k = 1:length(grades_input)
    if grades_input(k) >= 0 && grades_input(k) <= 100
        ok_grades = [ok_grades, grades_input(k)];
    else
        bad_grades = [bad_grades, grades_input(k)];
    end
end

peak_grade = ok_grades(1);
bottom_grade = ok_grades(1);

for k = 1:length(ok_grades)
    if ok_grades(k) >= 33
        successful_count = successful_count + 1;
    else
        unsuccessful_count = unsuccessful_count + 1;
    end

    if ok_grades(k) > peak_grade
        peak_grade = ok_grades(k);
    end

    if ok_grades(k) < bottom_grade
        bottom_grade = ok_grades(k);
    end

    accum_sum = accum_sum + ok_grades(k);
end

average_val = accum_sum / length(ok_grades);

file_handler = fopen('output.txt', 'w');

fprintf(file_handler, 'Sum: %d \n', accum_sum);
fprintf(file_handler, 'Average: %d \n', average_val);
fprintf(file_handler, 'Highest: %d \n', peak_grade);
fprintf(file_handler, 'Lowest: %d \n', bottom_grade);
fprintf(file_handler, 'Total Pass Student: %d \n', successful_count);
fprintf(file_handler, 'Total Fail Student: %d', unsuccessful_count);
fclose(file_handler);
disp('File created and saved all Summary');
