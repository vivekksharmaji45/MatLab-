stream_id = fopen('attendance.txt', 'a');

for k = 1:6
    candidate_name = input('Enter Student Name: ', 's');
    fprintf('Select Status: 1. Present  2. Absent  3. Late\n');
    selection = input('Enter choice (1-3): ');
    if selection == 1
        current_state = 'Present';
    elseif selection == 2
        current_state = 'Absent';
    elseif selection == 3
        current_state = 'Late';
    else
        fprintf('Invalid choice! Setting to Absent.\n');
        current_state = 'Absent';
    end

    fprintf(stream_id, 'Name: %s | Status: %s\n', candidate_name, current_state);
    fprintf('Record saved!\n\n');
end

fclose(stream_id);
fprintf('All 6 records saved to daily_log.txt\n');
