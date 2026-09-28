function [p_tally, n_tally, z_tally, ev_tally, od_tally] = classifyArray(arr_in)
    p_tally = 0;
    n_tally = 0;
    z_tally = 0;
    ev_tally = 0;
    od_tally = 0;

    for k = 1:length(arr_in)
        val_elem = arr_in(k);
        if val_elem > 0
            p_tally = p_tally + 1;
        elseif val_elem < 0
            n_tally = n_tally + 1;
        else
            z_tally = z_tally + 1;
        end
        if mod(val_elem, 1) == 0
            if mod(val_elem, 2) == 0
                ev_tally = ev_tally + 1;
            else
                od_tally = od_tally + 1;
            end
        end
    end
end
