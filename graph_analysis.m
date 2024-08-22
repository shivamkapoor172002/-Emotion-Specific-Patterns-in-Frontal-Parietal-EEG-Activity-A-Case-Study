% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
horror_start = 19;           % Start time for horror (0 minutes)
horror_end = 3 * 60 + 52;     % End time for horror (3 minutes and 52 seconds)

comedy_start = 3 * 60 + 53;   % Start time for comedy (3 minutes and 53 seconds)
comedy_end = 13 * 60 + 19;    % End time for comedy (13 minutes and 19 seconds)

patriotic_start = 13 * 60 + 20;   % Start time for patriotic (13 minutes and 20 seconds)
patriotic_end = 20 * 60;           % End time for patriotic (20 minutes)

% Find indices corresponding to the specified time intervals
horror_indices = find(time_vector >= horror_start & time_vector <= horror_end);
comedy_indices = find(time_vector >= comedy_start & time_vector <= comedy_end);
patriotic_indices = find(time_vector >= patriotic_start & time_vector <= patriotic_end);

% Smooth EEG data for each genre
smoothed_horror_data = smooth(time_vector(horror_indices), eeg_data(horror_indices), 0.1, 'rloess');
smoothed_comedy_data = smooth(time_vector(comedy_indices), eeg_data(comedy_indices), 0.1, 'rloess');
smoothed_patriotic_data = smooth(time_vector(patriotic_indices), eeg_data(patriotic_indices), 0.1, 'rloess');

% Subtract the minimum value of each smoothed genre data
smoothed_horror_data = smoothed_horror_data - min(smoothed_horror_data);
smoothed_comedy_data = smoothed_comedy_data - min(smoothed_comedy_data);
smoothed_patriotic_data = smoothed_patriotic_data - min(smoothed_patriotic_data);

% Plot smoothed EEG data for each genre with different colors
figure;

subplot(3, 1, 1);
plot(time_vector(horror_indices), smoothed_horror_data, 'Color', [1, 0, 0]); % Red for Horror
title('Data for Horror');
legend('Horror'); % Add legend for Horror
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(time_vector(comedy_indices), smoothed_comedy_data, 'Color', [0, 1, 0]); % Green for Comedy
title('Data for Comedy');
legend('Comedy'); % Add legend for Comedy
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(time_vector(patriotic_indices), smoothed_patriotic_data, 'Color', [0, 0, 1]); % Blue for Patriotic
title('Data for Patriotic');
legend('Patriotic'); % Add legend for Patriotic
xlabel('Time (seconds)');
ylabel('Amplitude');
