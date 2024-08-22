% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Downsample EEG data
downsample_factor = 5000;  % Adjust as needed
downsampled_data = downsample(eeg_data, downsample_factor);

% Create downsampled time vector
downsampled_times = ALLEEG(1).times(1:downsample_factor:end);

% Ensure the lengths match
min_length = min(length(downsampled_times), length(downsampled_data));
downsampled_times = downsampled_times(1:min_length);
downsampled_data = downsampled_data(1:min_length);

% Plot downsampled EEG data
figure;
plot(downsampled_times, downsampled_data);
xlabel('Time (s)');
ylabel('Amplitude');
title('Downsampled EEG Data for Genre: Horror');
