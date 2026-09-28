function [start_idx, tally_cnt] = findValue(arr_in, lookup_num)
    start_idx = -1;
    tally_cnt = 0;

    for k_idx = 1:length(arr_in)
        if arr_in(k_idx) == lookup_num
            tally_cnt = tally_cnt + 1;

            if start_idx == -1
                start_idx = k_idx;
            end
        end
    end
end
