% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
comedy_start = 3 * 60 + 53;       % Start time for comedy (3 minutes and 53 seconds)
comedy_end = 13 * 60 + 19;        % End time for comedy (13 minutes and 19 seconds)

% Find indices corresponding to the specified time intervals for comedy
comedy_indices = find(time_vector >= comedy_start & time_vector <= comedy_end);

% Smooth EEG data for comedy
smoothed_comedy_data = smooth(time_vector(comedy_indices), eeg_data(comedy_indices), 0.1, 'rloess');

% Plot smoothed EEG data for comedy
figure;
plot(time_vector(comedy_indices), smoothed_comedy_data, 'LineWidth', 1.5, 'Color', 'green');
title('Smoothed EEG Data for Comedy');
legend('Comedy'); % Add legend for Comedy
xlabel('Time (seconds)');
ylabel('Amplitude');
