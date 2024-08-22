% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
horror_start = 19;           % Start time for horror (0 minutes)
horror_end = 3 * 60 + 52;        % End time for horror (3 minutes and 52 seconds)

% Find indices corresponding to the specified time intervals for horror
horror_indices = find(time_vector >= horror_start & time_vector <= horror_end);

% Remove time from 100 to 150 seconds
exclude_indices = find(time_vector >= 109 & time_vector <= 136);
horror_indices = setdiff(horror_indices, exclude_indices);

% Smooth EEG data for horror
smoothed_horror_data = smooth(time_vector(horror_indices), eeg_data(horror_indices), 0.1, 'rloess');

% Plot smoothed EEG data for horror (excluding the specified time range)
figure;
plot(time_vector(horror_indices), smoothed_horror_data, 'LineWidth', 1.5, 'Color', 'red');
title('Smoothed EEG Data for Horror');
legend('Horror'); % Add legend for Horror
xlabel('Time (seconds)');
ylabel('Amplitude');
