function ans_res = safeFactorial(num)
    if num < 0 || mod(num, 1) ~= 0
        fprintf('Error: Input %d is invalid (must be a non-negative integer).\n', num);
        ans_res = 0;
        return;
    end
    ans_res = 1;
    for idx_k = 1:num
        ans_res = ans_res * idx_k;
    end
end
