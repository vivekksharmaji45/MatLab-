function [avg_grade, top_grade, success_cnt, error_cnt] = analyzeMarks(grades_arr)
    ok_marks = [];
    for k = 1:length(grades_arr)
        if grades_arr(k) >= 0 && grades_arr(k) <= 100
            ok_marks = [ok_marks, grades_arr(k)];
        end
    end

    if isempty(ok_marks)
        avg_grade = 0;
        top_grade = 0;
        success_cnt = 0;
        error_cnt = 0;
        return;
    end

    accum_sum = sum(ok_marks);
    avg_grade = accum_sum / length(ok_marks);
    top_grade = max(ok_marks);

    success_cnt = 0;
    error_cnt = 0;
    for k = 1:length(ok_marks)
        if ok_marks(k) >= 33
            success_cnt = success_cnt + 1;
        else
            error_cnt = error_cnt + 1;
        end
    end
end
