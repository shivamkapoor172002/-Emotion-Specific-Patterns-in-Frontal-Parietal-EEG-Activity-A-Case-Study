% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Get the time vector
time_vector = ALLEEG(1).times;

% Display the time vector
disp('Time Vector:');
disp(time_vector);

% Alternatively, you can display the start and end times
start_time = time_vector(1);
end_time = time_vector(end);

disp(['Start Time: ' num2str(start_time) ' seconds']);
disp(['End Time: ' num2str(end_time) ' seconds']);
