% Assuming ALLEEG contains EEG data
% Access EEG data from the first dataset
eeg_data = ALLEEG(1).data;

% Assuming ALLEEG(1).times contains the time vector
time_vector = ALLEEG(1).times;

% Define time intervals in seconds
start_time = 0 * 60;            % Start time (0 minutes)
end_time = 3 * 60 + 53;         % End time (3 minutes and 53 seconds)

% Find indices corresponding to the specified time interval
time_indices = find(time_vector >= start_time & time_vector <= end_time);

% Extract EEG data for the specified time interval
eeg_data_interval = eeg_data(:, time_indices);

% Compute the power spectral density using FFT
fs = 1 / (time_vector(2) - time_vector(1)); % Sampling frequency
nfft = 2^nextpow2(length(time_indices));    % Next power of 2 for FFT
frequencies = fs / 2 * linspace(0, 1, nfft / 2 + 1); % Frequency axis

% Apply FFT to EEG data
fft_data = fft(eeg_data_interval, nfft, 2);

% Compute power spectral density
psd = abs(fft_data(:, 1:nfft/2+1)).^2 / (fs * nfft);

% Define frequency bands
delta_band = [0.5 4];
theta_band = [4 8];
alpha_band = [8 13];
beta_band = [13 30];
gamma_band = [30 40]; % Adjust the upper limit as needed

% Find indices corresponding to each frequency band
delta_indices = find(frequencies >= delta_band(1) & frequencies <= delta_band(2));
theta_indices = find(frequencies >= theta_band(1) & frequencies <= theta_band(2));
alpha_indices = find(frequencies >= alpha_band(1) & frequencies <= alpha_band(2));
beta_indices = find(frequencies >= beta_band(1) & frequencies <= beta_band(2));
gamma_indices = find(frequencies >= gamma_band(1) & frequencies <= gamma_band(2));

% Extract power in each frequency band
delta_power = mean(psd(:, delta_indices), 2);
theta_power = mean(psd(:, theta_indices), 2);
alpha_power = mean(psd(:, alpha_indices), 2);
beta_power = mean(psd(:, beta_indices), 2);
gamma_power = mean(psd(:, gamma_indices), 2);

% Compute standard deviations for each frequency band
delta_std = std(psd(:, delta_indices), 0, 2);
theta_std = std(psd(:, theta_indices), 0, 2);
alpha_std = std(psd(:, alpha_indices), 0, 2);
beta_std = std(psd(:, beta_indices), 0, 2);
gamma_std = std(psd(:, gamma_indices), 0, 2);

% Interpolate the standard deviation values to match the length of time_interp
delta_std_interp = interp1(time_vector(time_indices), delta_std, time_interp, 'pchip');
theta_std_interp = interp1(time_vector(time_indices), theta_std, time_interp, 'pchip');
alpha_std_interp = interp1(time_vector(time_indices), alpha_std, time_interp, 'pchip');
beta_std_interp = interp1(time_vector(time_indices), beta_std, time_interp, 'pchip');
gamma_std_interp = interp1(time_vector(time_indices), gamma_std, time_interp, 'pchip');

% Plot error bar graphs for the power in each frequency band
figure;

subplot(5, 1, 1);
errorbar(time_interp, delta_power, delta_std_interp);
title('Delta Power');
xlabel('Time (seconds)');
ylabel('Power');

subplot(5, 1, 2);
errorbar(time_interp, theta_power, theta_std_interp);
title('Theta Power');
xlabel('Time (seconds)');
ylabel('Power');

subplot(5, 1, 3);
errorbar(time_interp, alpha_power, alpha_std_interp);
title('Alpha Power');
xlabel('Time (seconds)');
ylabel('Power');

subplot(5, 1, 4);
errorbar(time_interp, beta_power, beta_std_interp);
title('Beta Power');
xlabel('Time (seconds)');
ylabel('Power');

subplot(5, 1, 5);
errorbar(time_interp, gamma_power, gamma_std_interp);
title('Gamma Power');
xlabel('Time (seconds)');
ylabel('Power');