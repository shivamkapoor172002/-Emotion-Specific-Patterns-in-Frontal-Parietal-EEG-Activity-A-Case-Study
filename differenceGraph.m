% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
horror_start = 16;           % Start time for horror (0 minutes)
horror_end = 4 * 60 + 58;        % End time for horror (3 minutes and 52 seconds)

comedy_start = 4 * 60 + 59;       % Start time for comedy (3 minutes and 53 seconds)
comedy_end = 9 * 60 + 41;        % End time for comedy (13 minutes and 19 seconds)

patriotic_start = 9 * 60 + 42 ;   % Start time for patriotic (13 minutes and 20 seconds)
patriotic_end = 14 * 60 + 24 ;           % End time for patriotic (20 minutes)

% Find indices corresponding to the specified time intervals
horror_indices = find(time_vector >= horror_start & time_vector <= horror_end);
comedy_indices = find(time_vector >= comedy_start & time_vector <= comedy_end);
patriotic_indices = find(time_vector >= patriotic_start & time_vector <= patriotic_end);

% Remove time from 113.281 to 132.812 seconds for the "horror" plot
exclude_indices_horror = find(time_vector >= 113.281 & time_vector <= 132.812);
horror_indices = setdiff(horror_indices, exclude_indices_horror);

% Remove x-axis values from 113.281 to 132.812
set(gca, 'XTick', []);

% Smooth EEG data for each genre
smoothing_parameter = 0.2; % Adjust the smoothing parameter as needed

smoothed_horror_data = smooth(time_vector(horror_indices), eeg_data(horror_indices), smoothing_parameter, 'rloess');
smoothed_comedy_data = smooth(time_vector(comedy_indices), eeg_data(comedy_indices), 0.1, 'rloess');
smoothed_patriotic_data = smooth(time_vector(patriotic_indices), eeg_data(patriotic_indices), 0.1, 'rloess');

% Plot smoothed EEG data for each genre
figure;

subplot(3, 1, 1);
plot(time_vector(horror_indices), smoothed_horror_data - min(smoothed_horror_data), 'Color', [1, 0, 0], 'LineWidth', 1.5);
title('Data for Horror');
legend('Horror', 'Location', 'northeast', 'FontSize', 12); % Set legend to upper right corner
xlabel('Time (seconds)');
ylabel('Amplitude');
ylim([0, max(smoothed_horror_data)]); % Set y-axis limits to start from 0
grid on; % Add grid lines

subplot(3, 1, 2);
plot(time_vector(comedy_indices), smoothed_comedy_data - min(smoothed_comedy_data), 'Color', [0, 1, 0], 'LineWidth', 1.5);
title('Data for Comedy');
legend('Comedy', 'Location', 'northeast', 'FontSize', 12); % Set legend to upper right corner
xlabel('Time (seconds)');
ylabel('Amplitude');
ylim([0, max(smoothed_comedy_data)]); % Set y-axis limits to start from 0
grid on; % Add grid lines

subplot(3, 1, 3);
plot(time_vector(patriotic_indices), smoothed_patriotic_data - min(smoothed_patriotic_data), 'Color', [0, 0, 1], 'LineWidth', 1.5);
title('Data for Patriotic');
legend('Patriotic', 'Location', 'northeast', 'FontSize', 12); % Set legend to upper right corner
xlabel('Time (seconds)');
ylabel('Amplitude');
ylim([0, max(smoothed_patriotic_data)]); % Set y-axis limits to start from 0
grid on; % Add grid lines

% Set background color
set(gcf, 'Color', 'w');