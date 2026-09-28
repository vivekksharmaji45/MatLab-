number_in = input('Enter Numerical Input: ');
working_copy = number_in;
digit_count = 0;
digit_sum = 0;
ev_cnt = 0;
od_cnt = 0;
rev_output = 0;

if number_in < 0
  disp('Given Number is Negative');
  stream_id = fopen('analysis_out.txt', 'w');
  fprintf(stream_id, 'Given Number is Negative');
  fclose(stream_id);
else
  while working_copy > 0
    single_dig = mod(working_copy, 10);
    digit_count = digit_count + 1;
    digit_sum = digit_sum + single_dig;
    if mod(single_dig, 2) == 0
        ev_cnt = ev_cnt + 1;
    else
        od_cnt = od_cnt + 1;
    end
    rev_output = (rev_output * 10) + single_dig;
    working_copy = fix(working_copy / 10);
  end

  if number_in == rev_output
    is_pal = 'Yes';
  else
    is_pal = 'No';
  end

  stream_id = fopen('output.txt', 'w');
  fprintf(stream_id, 'Original Number: %d\n', number_in);
  fprintf(stream_id, 'Number of Digits: %d\n', digit_count);
  fprintf(stream_id, 'Sum of Digits: %d\n', digit_sum);
  fprintf(stream_id, 'Count of Even Digits: %d\n', ev_cnt);
  fprintf(stream_id, 'Count of Odd Digits: %d\n', od_cnt);
  fprintf(stream_id, 'Reversed Number: %d\n', rev_output);
  fprintf(stream_id, 'Is Palindrome: %s\n', is_pal);
  fclose(stream_id);
  disp('Results successfully written to analysis_out.txt');
end
