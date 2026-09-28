function [ok_cnt, sum_total, average_score, max_grade, min_grade, pass_tally, fail_tally, status_flag] = resultSummary(seq)
    ok_cnt = 0;
    sum_total = 0;
    filtered_list = [];

    for k = 1:length(seq)
        val_item = seq(k);
        if val_item >= 0 && val_item <= 100
            ok_cnt = ok_cnt + 1;
            sum_total = sum_total + val_item;
            filtered_list = [filtered_list, val_item];
        end
    end

    if ok_cnt > 0
        average_score = sum_total / ok_cnt;
        max_grade = max(filtered_list);
        min_grade = min(filtered_list);
    else
        average_score = 0;
        max_grade = 0;
        min_grade = 0;
    end

    pass_tally = 0;
    fail_tally = 0;
    for k = 1:length(filtered_list)
        if filtered_list(k) >= 33
            pass_tally = pass_tally + 1;
        else
            fail_tally = fail_tally + 1;
        end
    end

    if pass_tally >= fail_tally
        status_flag = 'PASS';
    else
        status_flag = 'FAIL';
    end
end
