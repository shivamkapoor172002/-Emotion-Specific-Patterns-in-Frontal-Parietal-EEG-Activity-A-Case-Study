% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
patriotic_start = 13 * 60 + 20;   % Start time for patriotic (13 minutes and 20 seconds)
patriotic_end = 20 * 60;           % End time for patriotic (20 minutes)

% Find indices corresponding to the specified time intervals for patriotic
patriotic_indices = find(time_vector >= patriotic_start & time_vector <= patriotic_end);

% Smooth EEG data for patriotic
smoothed_patriotic_data = smooth(time_vector(patriotic_indices), eeg_data(patriotic_indices), 0.1, 'rloess');

% Plot smoothed EEG data for patriotic
figure;
plot(time_vector(patriotic_indices), smoothed_patriotic_data, 'LineWidth', 1.5, 'Color', 'blue');
title('Smoothed EEG Data for Patriotic');
legend('Patriotic'); % Add legend for Patriotic
xlabel('Time (seconds)');
ylabel('Amplitude');
