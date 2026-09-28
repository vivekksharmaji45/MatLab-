data_arr = [1, 7, -4, 5.5];

stream_h = fopen('output.txt', 'w');
for k = 1:length(data_arr)
    num = data_arr(k);
    fprintf('Testing Input: %d\n', num);
    fprintf(stream_h, 'Testing Input: %d\n', num);
    fact_out = safeFactorial(num);
    if num >= 0 && mod(num, 1) == 0
        fprintf('Factorial of %d is: %d\n\n', num, fact_out);
        fprintf(stream_h, 'Result: Factorial of %d is: %d\n\n', num, fact_out);
    else
        fprintf(stream_h, 'Result: Invalid Input (Rejected)\n\n');
        fprintf('\n');
    end
end

fclose(stream_h);
disp('Saved to factorial_report.txt');
