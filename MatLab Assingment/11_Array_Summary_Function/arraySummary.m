function [accum_sum, avg_val, min_elem, max_elem] = arraySummary(seq_item)
    accum_sum = 0;
    length_seq = length(seq_item);

    for idx_loop = 1:length_seq
        accum_sum = accum_sum + seq_item(idx_loop);
    end
    avg_val = accum_sum / length_seq;
    min_elem = seq_item(1);
    max_elem = seq_item(1);

    for idx_loop = 2:length_seq
        if seq_item(idx_loop) < min_elem
            min_elem = seq_item(idx_loop);
        end
        if seq_item(idx_loop) > max_elem
            max_elem = seq_item(idx_loop);
        end
    end
end
